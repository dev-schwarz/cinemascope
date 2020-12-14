part of 'media_store.dart';

class PersonStore = _PersonStore with _$PersonStore;

abstract class _PersonStore extends MediaStore<Person> with Store {
  _PersonStore({
    @required int id,
    @required DataStore dataStore,
  })  : _id = id,
        super(mediaType: TMediaType.person, dataStore: dataStore);

  final int _id;

  @override
  Future<Person> _fetchMediaDetails() => _repository.api.people
      .getDetails(
        _id,
        language: TmdbConfig.language.language,
      )
      .then((value) => value);

  @override
  TmdbResumedMedia get _generatedResumedMedia => TmdbResumedMedia(
        id: mediaDetails.id,
        name: mediaDetails.name,
        description: mediaDetails.gender.toString(),
        dateTime: mediaDetails.birthday,
        imageUrl: TmdbConfig.makeProfileUrl(mediaDetails.profilePath),
        mediaType: mediaType,
      );
}
