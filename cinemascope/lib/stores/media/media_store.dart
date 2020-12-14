import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../repositories/tmdb/tmdb_repository.dart';
import '../data/data_store.dart';

part 'media_action.dart';
part 'media_store.g.dart';
part 'movie_store.dart';
part 'person_store.dart';
part 'tv_store.dart';

abstract class MediaStore<T> = _MediaStore<T> with _$MediaStore;

abstract class _MediaStore<T> with Store {
  _MediaStore({
    @required this.mediaType,
    @required DataStore dataStore,
    bool autoFetch = true,
  }) : _dataStore = dataStore {
    fetchMediaDetailsFuture = _emptyMediaDetails;
    if (autoFetch) {
      _fetchAllMediaData();
    }
  }

  final TmdbRepository _repository = TmdbRepository();

  final TMediaType mediaType;
  final DataStore _dataStore;

  TmdbResumedMedia get resumedMedia => _resumedMedia;
  TmdbResumedMedia _resumedMedia;

  /// Media data ([mediaDetails] and [accountStates]) are being fetched.
  @computed
  bool get isFetchingData => !hasMediaDetails; // || !hasAccountStates;

  // --------------------------------------------------------------------------
  // [[ MEDIA DETAILS ]]
  // --------------------------------------------------------------------------
  /// The details of the media.
  T mediaDetails;

  /// [mediaDetails] has been loaded.
  @computed
  bool get hasMediaDetails =>
      fetchMediaDetailsFuture != _emptyMediaDetails &&
      fetchMediaDetailsFuture.status == FutureStatus.fulfilled;

  @observable
  ObservableFuture<T> fetchMediaDetailsFuture;

  // --------------------------------------------------------------------------
  // [[ ACCOUNT STATES ]]
  // --------------------------------------------------------------------------
  /// The account states of the media.
  TAccountStates accountStates;

  /// [accountStates] has been loaded.
  @computed
  bool get hasAccountStates =>
      fetchAccountStatesFuture != _emptyAccountStates &&
      fetchAccountStatesFuture.status == FutureStatus.fulfilled;

  /// [accountStates] has been already loaded and it's not null (empty).
  bool get hasAccountStatesData => hasAccountStates || accountStates != null;

  @observable
  ObservableFuture<TAccountStates> fetchAccountStatesFuture = _emptyAccountStates;

  // --------------------------------------------------------------------------
  // [[ ACCOUNT LISTS ]]
  // --------------------------------------------------------------------------
  Account4Lists get accountLists => _dataStore.listsStore.userLists;

  // --------------------------------------------------------------------------
  // [[ MEDIA LISTS ]]
  // --------------------------------------------------------------------------
  List<Account4ListsItem> mediaLists;

  @computed
  bool get hasMediaLists =>
      fetchMediaListsFuture != _emptyMediaLists &&
      fetchMediaListsFuture.status == FutureStatus.fulfilled;

  @observable
  ObservableFuture<List<Account4ListsItem>> fetchMediaListsFuture = _emptyMediaLists;

  // --------------------------------------------------------------------------
  // [[ MEDIA ACTIONS ]]
  // --------------------------------------------------------------------------
  @observable
  MediaItemAction mediaAction;

  @action
  void _setMediaAction(MediaItemAction action) => mediaAction = action;

  @action
  Future<void> setFavorite(bool value) async {
    final resp = await _repository.api.account.markAsFavorite(
      _resumedMedia.id.toString(),
      _resumedMedia.mediaType.toString(),
      value,
    );

    if (resp.isSuccess) {
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionFavorite(value));
      if (_resumedMedia.mediaType == TMediaType.movie) {
        _dataStore.favoritesStore.fetchFavoriteMovies();
      } else if (_resumedMedia.mediaType == TMediaType.tv) {
        _dataStore.favoritesStore.fetchFavoriteTvs();
      }
    }
  }

  @action
  Future<void> setWatchList(bool value) async {
    final resp = await _repository.api.account.addToWatchlist(
      _resumedMedia.id.toString(),
      _resumedMedia.mediaType.toString(),
      value,
    );

    if (resp.isSuccess) {
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionWatchList(value));
      if (_resumedMedia.mediaType == TMediaType.movie) {
        _dataStore.watchListsStore.fetchWatchListMovies();
      } else if (_resumedMedia.mediaType == TMediaType.tv) {
        _dataStore.watchListsStore.fetchWatchListTvs();
      }
    }
  }

  @action
  Future<void> setRating(double rating, bool clear) async {
    MediaRatingObject resp;

    if (_resumedMedia.mediaType == TMediaType.movie) {
      if (clear) {
        resp = await _repository.api.movie.deleteMovieRating(_resumedMedia.id);
      } else {
        resp = await _repository.api.movie.rateMovie(_resumedMedia.id, rating);
      }
    } else if (_resumedMedia.mediaType == TMediaType.tv) {
      if (clear) {
        resp = await _repository.api.tv.deleteTvRating(_resumedMedia.id);
      } else {
        resp = await _repository.api.tv.rateTv(_resumedMedia.id, rating);
      }
    }

    if (resp.isSuccess) {
      await Future.delayed(const Duration(milliseconds: 1500));
      accountStates = await _fetchAccountStatesInternal();
      _setMediaAction(MediaItemActionRate(!clear, rating));
    }
  }

  // --------------------------------------------------------------------------
  // [[ FETCH DATA ]]
  // --------------------------------------------------------------------------
  Future<void> _fetchAllMediaData() async {
    _fetchMediaDetailsInternal().then((m) {
      this.mediaDetails = m;
      _resumedMedia = _generatedResumedMedia;
      _fetchAccountStatesInternal().then((a) {
        this.accountStates = a;
      });
    });
  }

  @action
  Future<T> _fetchMediaDetailsInternal() async {
    final future = _fetchMediaDetails();
    fetchMediaDetailsFuture = ObservableFuture(future);

    return future;
  }

  @action
  Future<TAccountStates> _fetchAccountStatesInternal() async {
    final future = _fetchAccountStates();
    fetchAccountStatesFuture = ObservableFuture(future);

    return future;
  }

  @action
  Future<List<Account4ListsItem>> fetchMediaLists() async {
    final future = _fetchMediaLists();
    fetchMediaListsFuture = ObservableFuture(future);

    return mediaLists = await future;
  }

  Future<List<Account4ListsItem>> _fetchMediaLists() async {
    final resp = _dataStore.listsStore.userLists.results.where(
      (listItem) {
        return _dataStore.listsStore.allListsDetails
            .firstWhere(
              (details) {
                return details.id == listItem.id;
              },
            )
            .results
            .any(
              (media) {
                return media.id == resumedMedia.id && media.mediaType == resumedMedia.mediaType;
              },
            );
      },
    ).toList();

    return resp;
  }

  Future<T> _fetchMediaDetails();

  Future<TAccountStates> _fetchAccountStates() => Future.value(null);

  TmdbResumedMedia get _generatedResumedMedia;

  static ObservableFuture<List<Account4ListsItem>> _emptyMediaLists = ObservableFuture.value([]);

  final ObservableFuture<T> _emptyMediaDetails = ObservableFuture.value(null);

  static ObservableFuture<TAccountStates> _emptyAccountStates = ObservableFuture.value(null);
}
