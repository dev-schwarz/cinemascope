// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    birthday: dateTimeFromString(json['birthday'] as String),
    deathday: dateTimeFromString(json['deathday'] as String),
    placeOfBirth: json['place_of_birth'] as String,
    knownForDepartment: json['known_for_department'] as String,
    homepage: json['homepage'] as String,
    biography: json['biography'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    profilePath: json['profile_path'] as String,
    adult: json['adult'] as bool,
    alsoKnownAs:
        (json['also_known_as'] as List)?.map((e) => e as String)?.toList(),
    images: json['images'] == null
        ? null
        : PersonImages.fromJson(json['images'] as Map<String, dynamic>),
    credits: json['credits'] == null
        ? null
        : PersonCredits.fromJson(json['credits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'birthday': dateTimeToString(instance.birthday),
      'deathday': dateTimeToString(instance.deathday),
      'place_of_birth': instance.placeOfBirth,
      'known_for_department': instance.knownForDepartment,
      'homepage': instance.homepage,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'also_known_as': instance.alsoKnownAs,
      'images': instance.images,
      'credits': instance.credits,
    };

PersonCredits<T> _$PersonCreditsFromJson<T extends PersonCreditsObject>(
    Map<String, dynamic> json) {
  return PersonCredits<T>(
    id: json['id'] as int,
    cast: (json['cast'] as List)
        ?.map(_ConverterPersonCredits<T>().fromJson)
        ?.toList(),
    crew: (json['crew'] as List)
        ?.map(_ConverterPersonCredits<T>().fromJson)
        ?.toList(),
  );
}

Map<String, dynamic> _$PersonCreditsToJson<T extends PersonCreditsObject>(
        PersonCredits<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast?.map(_ConverterPersonCredits<T>().toJson)?.toList(),
      'crew': instance.crew?.map(_ConverterPersonCredits<T>().toJson)?.toList(),
    };

PersonCastMovie _$PersonCastMovieFromJson(Map<String, dynamic> json) {
  return PersonCastMovie(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    title: json['title'] as String,
    character: json['character'] as String,
    releaseDate: dateTimeFromString(json['release_date'] as String),
    overview: json['overview'] as String,
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    video: json['video'] as bool,
    adult: json['adult'] as bool,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonCastMovieToJson(PersonCastMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'title': instance.title,
      'character': instance.character,
      'release_date': dateTimeToString(instance.releaseDate),
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'video': instance.video,
      'adult': instance.adult,
      'genre_ids': instance.genreIds,
    };

PersonCastTv _$PersonCastTvFromJson(Map<String, dynamic> json) {
  return PersonCastTv(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    character: json['character'] as String,
    firstAirDate: dateTimeFromString(json['first_air_date'] as String),
    episodeCount: json['episode_count'] as int,
    overview: json['overview'] as String,
    originalName: json['original_name'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonCastTvToJson(PersonCastTv instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'character': instance.character,
      'first_air_date': dateTimeToString(instance.firstAirDate),
      'episode_count': instance.episodeCount,
      'overview': instance.overview,
      'original_name': instance.originalName,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
    };

PersonCrewMovie _$PersonCrewMovieFromJson(Map<String, dynamic> json) {
  return PersonCrewMovie(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    title: json['title'] as String,
    releaseDate: dateTimeFromString(json['release_date'] as String),
    department: json['department'] as String,
    job: json['job'] as String,
    overview: json['overview'] as String,
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    video: json['video'] as bool,
    adult: json['adult'] as bool,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonCrewMovieToJson(PersonCrewMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'title': instance.title,
      'release_date': dateTimeToString(instance.releaseDate),
      'department': instance.department,
      'job': instance.job,
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'video': instance.video,
      'adult': instance.adult,
      'genre_ids': instance.genreIds,
    };

PersonCrewTv _$PersonCrewTvFromJson(Map<String, dynamic> json) {
  return PersonCrewTv(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    firstAirDate: dateTimeFromString(json['first_air_date'] as String),
    department: json['department'] as String,
    job: json['job'] as String,
    episodeCount: json['episode_count'] as int,
    overview: json['overview'] as String,
    originalName: json['original_name'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonCrewTvToJson(PersonCrewTv instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'first_air_date': dateTimeToString(instance.firstAirDate),
      'department': instance.department,
      'job': instance.job,
      'episode_count': instance.episodeCount,
      'overview': instance.overview,
      'original_name': instance.originalName,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
    };

PersonKnownForMovie _$PersonKnownForMovieFromJson(Map<String, dynamic> json) {
  return PersonKnownForMovie(
    id: json['id'] as int,
    title: json['title'] as String,
    releaseDate: dateTimeFromString(json['release_date'] as String),
    overview: json['overview'] as String,
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    video: json['video'] as bool,
    adult: json['adult'] as bool,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonKnownForMovieToJson(
        PersonKnownForMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'release_date': dateTimeToString(instance.releaseDate),
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'video': instance.video,
      'adult': instance.adult,
      'genre_ids': instance.genreIds,
    };

PersonKnownForTv _$PersonKnownForTvFromJson(Map<String, dynamic> json) {
  return PersonKnownForTv(
    id: json['id'] as int,
    name: json['name'] as String,
    firstAirDate: dateTimeFromString(json['first_air_date'] as String),
    overview: json['overview'] as String,
    originalName: json['original_name'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PersonKnownForTvToJson(PersonKnownForTv instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'first_air_date': dateTimeToString(instance.firstAirDate),
      'overview': instance.overview,
      'original_name': instance.originalName,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'origin_country': instance.originCountry,
      'genre_ids': instance.genreIds,
    };

PersonResumed<T> _$PersonResumedFromJson<T extends PersonKnownForObject>(
    Map<String, dynamic> json) {
  return PersonResumed<T>(
    id: json['id'] as int,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    knownForDepartment: json['known_for_department'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    profilePath: json['profile_path'] as String,
    adult: json['adult'] as bool,
  );
}

Map<String, dynamic> _$PersonResumedToJson<T extends PersonKnownForObject>(
        PersonResumed<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'known_for_department': instance.knownForDepartment,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$PersonToString(Person o) {
  return """Person{
  id: ${o.id},
  imdbId: ${o.imdbId},
  name: ${o.name},
  gender: ${o.gender},
  birthday: ${o.birthday},
  deathday: ${o.deathday},
  placeOfBirth: ${o.placeOfBirth},
  knownForDepartment: ${o.knownForDepartment},
  homepage: ${o.homepage},
  biography: ${o.biography},
  popularity: ${o.popularity},
  profilePath: ${o.profilePath},
  adult: ${o.adult},
  alsoKnownAs: ${o.alsoKnownAs},
  images: ${o.images.toString().split("\n").join("\n  ")},
  credits: ${o.credits.toString().split("\n").join("\n  ")},
}""";
}

String _$PersonCreditsToString(PersonCredits o) {
  return """PersonCredits{
  id: ${o.id},
  cast: ${o.cast},
  crew: ${o.crew},
}""";
}

String _$PersonCreditsObjectToString(PersonCreditsObject o) {
  return """PersonCreditsObject{
  id: ${o.id},
  mediaType: ${o.mediaType},
}""";
}

String _$PersonCastMovieToString(PersonCastMovie o) {
  return """PersonCastMovie{
  id: ${o.id},
  mediaType: ${o.mediaType},
  creditId: ${o.creditId},
  title: ${o.title},
  character: ${o.character},
  releaseDate: ${o.releaseDate},
  overview: ${o.overview},
  originalTitle: ${o.originalTitle},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  video: ${o.video},
  adult: ${o.adult},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonCastTvToString(PersonCastTv o) {
  return """PersonCastTv{
  id: ${o.id},
  mediaType: ${o.mediaType},
  creditId: ${o.creditId},
  name: ${o.name},
  character: ${o.character},
  firstAirDate: ${o.firstAirDate},
  episodeCount: ${o.episodeCount},
  overview: ${o.overview},
  originalName: ${o.originalName},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  originCountry: ${o.originCountry},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonCrewMovieToString(PersonCrewMovie o) {
  return """PersonCrewMovie{
  id: ${o.id},
  mediaType: ${o.mediaType},
  creditId: ${o.creditId},
  title: ${o.title},
  releaseDate: ${o.releaseDate},
  department: ${o.department},
  job: ${o.job},
  overview: ${o.overview},
  originalTitle: ${o.originalTitle},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  video: ${o.video},
  adult: ${o.adult},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonCrewTvToString(PersonCrewTv o) {
  return """PersonCrewTv{
  id: ${o.id},
  mediaType: ${o.mediaType},
  creditId: ${o.creditId},
  name: ${o.name},
  firstAirDate: ${o.firstAirDate},
  department: ${o.department},
  job: ${o.job},
  episodeCount: ${o.episodeCount},
  overview: ${o.overview},
  originalName: ${o.originalName},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  originCountry: ${o.originCountry},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonKnownForObjectToString(PersonKnownForObject o) {
  return """PersonKnownForObject{
  id: ${o.id},
  mediaType: ${o.mediaType},
}""";
}

String _$PersonKnownForMovieToString(PersonKnownForMovie o) {
  return """PersonKnownForMovie{
  id: ${o.id},
  mediaType: ${o.mediaType},
  title: ${o.title},
  releaseDate: ${o.releaseDate},
  overview: ${o.overview},
  originalTitle: ${o.originalTitle},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  video: ${o.video},
  adult: ${o.adult},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonKnownForTvToString(PersonKnownForTv o) {
  return """PersonKnownForTv{
  id: ${o.id},
  mediaType: ${o.mediaType},
  name: ${o.name},
  firstAirDate: ${o.firstAirDate},
  overview: ${o.overview},
  originalName: ${o.originalName},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  originCountry: ${o.originCountry},
  genreIds: ${o.genreIds},
}""";
}

String _$PersonResumedToString(PersonResumed o) {
  return """PersonResumed{
  id: ${o.id},
  mediaType: ${o.mediaType},
  name: ${o.name},
  gender: ${o.gender},
  knownForDepartment: ${o.knownForDepartment},
  popularity: ${o.popularity},
  profilePath: ${o.profilePath},
  adult: ${o.adult},
  knownFor: ${o.knownFor},
}""";
}
