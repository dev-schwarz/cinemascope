// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tv _$TvFromJson(Map<String, dynamic> json) {
  return Tv(
    id: json['id'] as int,
    name: json['name'] as String,
    numberOfSeasons: json['number_of_seasons'] as int,
    numberOfEpisodes: json['number_of_episodes'] as int,
    firstAirDate: dateTimeFromString(json['first_air_date'] as String),
    lastAirDate: dateTimeFromString(json['last_air_date'] as String),
    overview: json['overview'] as String,
    originalName: json['original_name'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    homepage: json['homepage'] as String,
    status: json['status'] as String,
    type: json['type'] as String,
    inProduction: json['in_production'] as bool,
    lastEpisodeToAir: json['last_episode_to_air'] == null
        ? null
        : TvEpisode.fromJson(
            json['last_episode_to_air'] as Map<String, dynamic>),
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : TGenre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdBy: (json['created_by'] as List)
        ?.map((e) =>
            e == null ? null : TvCreatedBy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    episodeRunTime:
        (json['episode_run_time'] as List)?.map((e) => e as int)?.toList(),
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    networks: (json['networks'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productionCompanies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    seasons: (json['seasons'] as List)
        ?.map((e) =>
            e == null ? null : TvSeason.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    credits: json['credits'] == null
        ? null
        : Credits.fromJson(json['credits'] as Map<String, dynamic>),
    videos: json['videos'] == null
        ? null
        : VideoResults.fromJson(json['videos'] as Map<String, dynamic>),
    images: json['images'] == null
        ? null
        : TvImages.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TvToJson(Tv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number_of_seasons': instance.numberOfSeasons,
      'number_of_episodes': instance.numberOfEpisodes,
      'first_air_date': dateTimeToString(instance.firstAirDate),
      'last_air_date': dateTimeToString(instance.lastAirDate),
      'overview': instance.overview,
      'original_name': instance.originalName,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'homepage': instance.homepage,
      'status': instance.status,
      'type': instance.type,
      'in_production': instance.inProduction,
      'last_episode_to_air': instance.lastEpisodeToAir,
      'origin_country': instance.originCountry,
      'genres': instance.genres,
      'created_by': instance.createdBy,
      'episode_run_time': instance.episodeRunTime,
      'languages': instance.languages,
      'networks': instance.networks,
      'production_companies': instance.productionCompanies,
      'seasons': instance.seasons,
      'credits': instance.credits,
      'videos': instance.videos,
      'images': instance.images,
    };

TvGuestStar _$TvGuestStarFromJson(Map<String, dynamic> json) {
  return TvGuestStar(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    character: json['character'] as String,
    order: json['order'] as int,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$TvGuestStarToJson(TvGuestStar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'character': instance.character,
      'order': instance.order,
      'profile_path': instance.profilePath,
    };

TvCrew _$TvCrewFromJson(Map<String, dynamic> json) {
  return TvCrew(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    department: json['department'] as String,
    job: json['job'] as String,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$TvCrewToJson(TvCrew instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'department': instance.department,
      'job': instance.job,
      'profile_path': instance.profilePath,
    };

TvCreatedBy _$TvCreatedByFromJson(Map<String, dynamic> json) {
  return TvCreatedBy(
    id: json['id'] as int,
    creditId: json['credit_id'] as String,
    name: json['name'] as String,
    gender: TPersonGender.fromJson(json['gender'] as int),
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$TvCreatedByToJson(TvCreatedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': TPersonGender.toJson(instance.gender),
      'profile_path': instance.profilePath,
    };

TvEpisode _$TvEpisodeFromJson(Map<String, dynamic> json) {
  return TvEpisode(
    id: json['id'] as int,
    seasonNumber: json['season_number'] as int,
    episodeNumber: json['episode_number'] as int,
    name: json['name'] as String,
    airDate: dateTimeFromString(json['air_date'] as String),
    productionCode: json['production_code'] as String,
    overview: json['overview'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    stillPath: json['still_path'] as String,
    crew: (json['crew'] as List)
        ?.map((e) =>
            e == null ? null : TvCrew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    guestStars: (json['guest_stars'] as List)
        ?.map((e) =>
            e == null ? null : TvGuestStar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    images: json['images'] == null
        ? null
        : TvImages.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TvEpisodeToJson(TvEpisode instance) => <String, dynamic>{
      'id': instance.id,
      'season_number': instance.seasonNumber,
      'episode_number': instance.episodeNumber,
      'name': instance.name,
      'air_date': dateTimeToString(instance.airDate),
      'production_code': instance.productionCode,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'still_path': instance.stillPath,
      'crew': instance.crew,
      'guest_stars': instance.guestStars,
      'images': instance.images,
    };

PopularTvs _$PopularTvsFromJson(Map<String, dynamic> json) {
  return PopularTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularTvsToJson(PopularTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

RateTv _$RateTvFromJson(Map<String, dynamic> json) {
  return RateTv(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$RateTvToJson(RateTv instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

DeleteTvRating _$DeleteTvRatingFromJson(Map<String, dynamic> json) {
  return DeleteTvRating(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$DeleteTvRatingToJson(DeleteTvRating instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

TvRecommendations _$TvRecommendationsFromJson(Map<String, dynamic> json) {
  return TvRecommendations(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TvRecommendationsToJson(TvRecommendations instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

TvResumed _$TvResumedFromJson(Map<String, dynamic> json) {
  return TvResumed(
    id: json['id'] as int,
    name: json['name'] as String,
    firstAirDate: dateTimeFromString(json['first_air_date'] as String),
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
    rating: (json['rating'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TvResumedToJson(TvResumed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'first_air_date': dateTimeToString(instance.firstAirDate),
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
      'rating': instance.rating,
    };

TvSeason _$TvSeasonFromJson(Map<String, dynamic> json) {
  return TvSeason(
    id: json['id'] as int,
    sId: json['s_id'] as String,
    seasonNumber: json['season_number'] as int,
    name: json['name'] as String,
    airDate: dateTimeFromString(json['air_date'] as String),
    episodeCount: json['episode_count'] as int,
    overview: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    episodes: (json['episodes'] as List)
        ?.map((e) =>
            e == null ? null : TvEpisode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    images: json['images'] == null
        ? null
        : TvImages.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TvSeasonToJson(TvSeason instance) => <String, dynamic>{
      'id': instance.id,
      's_id': instance.sId,
      'season_number': instance.seasonNumber,
      'name': instance.name,
      'air_date': dateTimeToString(instance.airDate),
      'episode_count': instance.episodeCount,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'episodes': instance.episodes,
      'images': instance.images,
    };

TopRatedTvs _$TopRatedTvsFromJson(Map<String, dynamic> json) {
  return TopRatedTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TopRatedTvsToJson(TopRatedTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$TvToString(Tv o) {
  return """Tv{
  id: ${o.id},
  name: ${o.name},
  numberOfSeasons: ${o.numberOfSeasons},
  numberOfEpisodes: ${o.numberOfEpisodes},
  firstAirDate: ${o.firstAirDate},
  lastAirDate: ${o.lastAirDate},
  overview: ${o.overview},
  originalName: ${o.originalName},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  homepage: ${o.homepage},
  status: ${o.status},
  type: ${o.type},
  inProduction: ${o.inProduction},
  lastEpisodeToAir: ${o.lastEpisodeToAir.toString().split("\n").join("\n  ")},
  originCountry: ${o.originCountry},
  genres: ${o.genres},
  createdBy: ${o.createdBy},
  episodeRunTime: ${o.episodeRunTime},
  languages: ${o.languages},
  networks: ${o.networks},
  productionCompanies: ${o.productionCompanies},
  seasons: ${o.seasons},
  credits: ${o.credits.toString().split("\n").join("\n  ")},
  videos: ${o.videos.toString().split("\n").join("\n  ")},
  images: ${o.images.toString().split("\n").join("\n  ")},
}""";
}

String _$TvGuestStarToString(TvGuestStar o) {
  return """TvGuestStar{
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

String _$TvCrewToString(TvCrew o) {
  return """TvCrew{
  id: ${o.id},
  creditId: ${o.creditId},
  name: ${o.name},
  gender: ${o.gender},
  department: ${o.department},
  job: ${o.job},
  profilePath: ${o.profilePath},
}""";
}

String _$TvCreatedByToString(TvCreatedBy o) {
  return """TvCreatedBy{
  id: ${o.id},
  creditId: ${o.creditId},
  name: ${o.name},
  gender: ${o.gender},
  profilePath: ${o.profilePath},
}""";
}

String _$TvEpisodeToString(TvEpisode o) {
  return """TvEpisode{
  id: ${o.id},
  seasonNumber: ${o.seasonNumber},
  episodeNumber: ${o.episodeNumber},
  name: ${o.name},
  airDate: ${o.airDate},
  productionCode: ${o.productionCode},
  overview: ${o.overview},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  stillPath: ${o.stillPath},
  crew: ${o.crew},
  guestStars: ${o.guestStars},
  images: ${o.images.toString().split("\n").join("\n  ")},
}""";
}

String _$RateTvToString(RateTv o) {
  return """RateTv{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  ratingType: ${o.ratingType},
  mediaType: ${o.mediaType},
}""";
}

String _$DeleteTvRatingToString(DeleteTvRating o) {
  return """DeleteTvRating{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  ratingType: ${o.ratingType},
  mediaType: ${o.mediaType},
}""";
}

String _$TvResumedToString(TvResumed o) {
  return """TvResumed{
  id: ${o.id},
  mediaType: ${o.mediaType},
  name: ${o.name},
  firstAirDate: ${o.firstAirDate},
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
  rating: ${o.rating},
}""";
}

String _$TvSeasonToString(TvSeason o) {
  return """TvSeason{
  id: ${o.id},
  sId: ${o.sId},
  seasonNumber: ${o.seasonNumber},
  name: ${o.name},
  airDate: ${o.airDate},
  episodeCount: ${o.episodeCount},
  overview: ${o.overview},
  posterPath: ${o.posterPath},
  episodes: ${o.episodes},
  images: ${o.images.toString().split("\n").join("\n  ")},
}""";
}
