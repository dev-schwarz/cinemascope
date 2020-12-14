// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TAccountStates _$TAccountStatesFromJson(Map<String, dynamic> json) {
  return TAccountStates(
    id: json['id'] as int,
    favorite: json['favorite'] as bool,
    watchList: json['watchlist'] as bool,
    rated: TAccountStates._TAccountStatesRatedFromJson(json['rated']),
  );
}

Map<String, dynamic> _$TAccountStatesToJson(TAccountStates instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favorite': instance.favorite,
      'watchlist': instance.watchList,
      'rated': TAccountStates._TAccountStatesRatedToJson(instance.rated),
    };

TAccountStatesRated _$TAccountStatesRatedFromJson(Map<String, dynamic> json) {
  return TAccountStatesRated(
    isRated: json['is_rated'] as bool ?? true,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TAccountStatesRatedToJson(
        TAccountStatesRated instance) =>
    <String, dynamic>{
      'is_rated': instance.isRated,
      'value': instance.value,
    };

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return Credits(
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crew: (json['crew'] as List)
        ?.map(
            (e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    id: json['id'] as int,
    castId: json['cast_id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    character: json['character'] as String,
    order: json['order'] as int,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'id': instance.id,
      'cast_id': instance.castId,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'character': instance.character,
      'order': instance.order,
      'profile_path': instance.profilePath,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    department: json['department'] as String,
    job: json['job'] as String,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'department': instance.department,
      'job': instance.job,
      'profile_path': instance.profilePath,
    };

TGenre _$TGenreFromJson(Map<String, dynamic> json) {
  return TGenre(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TGenreToJson(TGenre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MovieImages _$MovieImagesFromJson(Map<String, dynamic> json) {
  return MovieImages(
    posters: (json['posters'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backdrops: (json['backdrops'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieImagesToJson(MovieImages instance) =>
    <String, dynamic>{
      'posters': instance.posters,
      'backdrops': instance.backdrops,
    };

TvImages _$TvImagesFromJson(Map<String, dynamic> json) {
  return TvImages(
    posters: (json['posters'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backdrops: (json['backdrops'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stills: (json['stills'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TvImagesToJson(TvImages instance) => <String, dynamic>{
      'posters': instance.posters,
      'backdrops': instance.backdrops,
      'stills': instance.stills,
    };

PersonImages _$PersonImagesFromJson(Map<String, dynamic> json) {
  return PersonImages(
    profiles: (json['profiles'] as List)
        ?.map((e) =>
            e == null ? null : MediaImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PersonImagesToJson(PersonImages instance) =>
    <String, dynamic>{
      'profiles': instance.profiles,
    };

MediaImage _$MediaImageFromJson(Map<String, dynamic> json) {
  return MediaImage(
    height: json['height'] as int,
    width: json['width'] as int,
    aspectRatio: (json['aspect_ratio'] as num)?.toDouble(),
    iso_639_1: json['iso_639_1'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    filePath: json['file_path'] as String,
  );
}

Map<String, dynamic> _$MediaImageToJson(MediaImage instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'aspect_ratio': instance.aspectRatio,
      'iso_639_1': instance.iso_639_1,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'file_path': instance.filePath,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return ProductionCompany(
    id: json['id'] as int,
    name: json['name'] as String,
    originCountry: json['origin_country'] as String,
    logoPath: json['logo_path'] as String,
  );
}

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin_country': instance.originCountry,
      'logo_path': instance.logoPath,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return ProductionCountry(
    name: json['name'] as String,
    iso_3166_1: json['iso_3166_1'] as String,
  );
}

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iso_3166_1': instance.iso_3166_1,
    };

ReleaseDateResults _$ReleaseDateResultsFromJson(Map<String, dynamic> json) {
  return ReleaseDateResults(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ReleaseDate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReleaseDateResultsToJson(ReleaseDateResults instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) {
  return ReleaseDate(
    iso_3166_1: json['iso_3166_1'] as String,
    releaseDates: (json['release_dates'] as List)
        ?.map((e) => e == null
            ? null
            : ReleaseDateItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReleaseDateToJson(ReleaseDate instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'release_dates': instance.releaseDates,
    };

ReleaseDateItem _$ReleaseDateItemFromJson(Map<String, dynamic> json) {
  return ReleaseDateItem(
    certification: json['certification'] as String,
    iso_639_1: json['iso_639_1'] as String,
    note: json['note'] as String,
    releaseDate: dateTimeFromString(json['release_date'] as String),
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$ReleaseDateItemToJson(ReleaseDateItem instance) =>
    <String, dynamic>{
      'certification': instance.certification,
      'iso_639_1': instance.iso_639_1,
      'note': instance.note,
      'release_date': dateTimeToString(instance.releaseDate),
      'type': instance.type,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return SpokenLanguage(
    name: json['name'] as String,
    iso_639_1: json['iso_639_1'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iso_639_1': instance.iso_639_1,
    };

VideoResults _$VideoResultsFromJson(Map<String, dynamic> json) {
  return VideoResults(
    results: (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Video.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VideoResultsToJson(VideoResults instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    id: json['id'] as String,
    iso_639_1: json['iso_639_1'] as String,
    iso_3166_1: json['iso_3166_1'] as String,
    key: json['key'] as String,
    site: json['site'] as String,
    size: json['size'] as int,
    type: TVideoType.fromJson(json['type'] as String),
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': TVideoType.toJson(instance.type),
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$TAccountStatesToString(TAccountStates o) {
  return """TAccountStates{
  id: ${o.id},
  favorite: ${o.favorite},
  watchList: ${o.watchList},
  rated: ${o.rated.toString().split("\n").join("\n  ")},
}""";
}

String _$TAccountStatesRatedToString(TAccountStatesRated o) {
  return """TAccountStatesRated{
  isRated: ${o.isRated},
  value: ${o.value},
}""";
}

String _$CreditsToString(Credits o) {
  return """Credits{
  cast: ${o.cast},
  crew: ${o.crew},
}""";
}

String _$CastToString(Cast o) {
  return """Cast{
  id: ${o.id},
  castId: ${o.castId},
  creditId: ${o.creditId},
  name: ${o.name},
  gender: ${o.gender},
  character: ${o.character},
  order: ${o.order},
  profilePath: ${o.profilePath},
}""";
}

String _$CrewToString(Crew o) {
  return """Crew{
  id: ${o.id},
  creditId: ${o.creditId},
  name: ${o.name},
  gender: ${o.gender},
  department: ${o.department},
  job: ${o.job},
  profilePath: ${o.profilePath},
}""";
}

String _$TGenreToString(TGenre o) {
  return """TGenre{
  id: ${o.id},
  name: ${o.name},
}""";
}

String _$MovieImagesToString(MovieImages o) {
  return """MovieImages{
  posters: ${o.posters},
  backdrops: ${o.backdrops},
}""";
}

String _$TvImagesToString(TvImages o) {
  return """TvImages{
  posters: ${o.posters},
  backdrops: ${o.backdrops},
  stills: ${o.stills},
}""";
}

String _$PersonImagesToString(PersonImages o) {
  return """PersonImages{
  profiles: ${o.profiles},
}""";
}

String _$MediaImageToString(MediaImage o) {
  return """MediaImage{
  height: ${o.height},
  width: ${o.width},
  aspectRatio: ${o.aspectRatio},
  iso_639_1: ${o.iso_639_1},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  filePath: ${o.filePath},
}""";
}

String _$MediaRatingObjectToString(MediaRatingObject o) {
  return """MediaRatingObject{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  ratingType: ${o.ratingType},
  mediaType: ${o.mediaType},
}""";
}

String _$ProductionCompanyToString(ProductionCompany o) {
  return """ProductionCompany{
  id: ${o.id},
  name: ${o.name},
  originCountry: ${o.originCountry},
  logoPath: ${o.logoPath},
}""";
}

String _$ProductionCountryToString(ProductionCountry o) {
  return """ProductionCountry{
  name: ${o.name},
  iso_3166_1: ${o.iso_3166_1},
}""";
}

String _$ReleaseDateResultsToString(ReleaseDateResults o) {
  return """ReleaseDateResults{
  results: ${o.results},
}""";
}

String _$ReleaseDateToString(ReleaseDate o) {
  return """ReleaseDate{
  iso_3166_1: ${o.iso_3166_1},
  releaseDates: ${o.releaseDates},
}""";
}

String _$ReleaseDateItemToString(ReleaseDateItem o) {
  return """ReleaseDateItem{
  certification: ${o.certification},
  iso_639_1: ${o.iso_639_1},
  note: ${o.note},
  releaseDate: ${o.releaseDate},
  type: ${o.type},
}""";
}

String _$ResumedMediaToString(ResumedMedia o) {
  return """ResumedMedia{
  id: ${o.id},
  mediaType: ${o.mediaType},
}""";
}

String _$SpokenLanguageToString(SpokenLanguage o) {
  return """SpokenLanguage{
  name: ${o.name},
  iso_639_1: ${o.iso_639_1},
}""";
}

String _$VideoResultsToString(VideoResults o) {
  return """VideoResults{
  results: ${o.results},
}""";
}

String _$VideoToString(Video o) {
  return """Video{
  id: ${o.id},
  iso_639_1: ${o.iso_639_1},
  iso_3166_1: ${o.iso_3166_1},
  key: ${o.key},
  site: ${o.site},
  size: ${o.size},
  type: ${o.type},
}""";
}
