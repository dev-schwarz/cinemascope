part of 'media_store.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore extends MediaStore<Movie> with Store {
  _MovieStore({
    @required int id,
    @required DataStore dataStore,
  })  : _id = id,
        super(mediaType: TMediaType.movie, dataStore: dataStore);

  final int _id;

  @override
  Future<Movie> _fetchMediaDetails() => _repository.api.movie
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  Future<TAccountStates> _fetchAccountStates() => _repository.api.movie
      .getAccountStates(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia get _generatedResumedMedia => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.title,
        description: mediaDetails.overview,
        dateTime: mediaDetails.releaseDate,
        imageUrl: TmdbConfig.makePosterUrl(mediaDetails.posterPath),
        mediaType: mediaType,
      );
}
