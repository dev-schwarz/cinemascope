part of 'media_store.dart';

class TvStore = _TvStore with _$TvStore;

abstract class _TvStore extends MediaStore<Tv> with Store {
  _TvStore({
    @required int id,
    @required DataStore dataStore,
  })  : _id = id,
        super(mediaType: TMediaType.tv, dataStore: dataStore);

  final int _id;

  @override
  Future<Tv> _fetchMediaDetails() => _repository.api.tv
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  Future<TAccountStates> _fetchAccountStates() => _repository.api.tv
      .getAccountStates(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia get _generatedResumedMedia => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.overview,
        dateTime: mediaDetails.firstAirDate,
        imageUrl: TmdbConfig.makePosterUrl(mediaDetails.posterPath),
        mediaType: mediaType,
      );
}
