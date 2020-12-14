// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    title: json['title'] as String,
    releaseDate: dateTimeFromString(json['release_date'] as String),
    overview: json['overview'] as String,
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
    tagline: json['tagline'] as String,
    budget: json['budget'] as int,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    mediaStatus: TMediaStatus.fromJson(json['status'] as String),
    homepage: json['homepage'] as String,
    video: json['video'] as bool,
    adult: json['adult'] as bool,
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : TGenre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productionCompanies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productionCountries: (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    spokenLanguages: (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    videos: json['videos'] == null
        ? null
        : VideoResults.fromJson(json['videos'] as Map<String, dynamic>),
    credits: json['credits'] == null
        ? null
        : Credits.fromJson(json['credits'] as Map<String, dynamic>),
    images: json['images'] == null
        ? null
        : MovieImages.fromJson(json['images'] as Map<String, dynamic>),
    releaseDates: json['release_dates'] == null
        ? null
        : ReleaseDateResults.fromJson(
            json['release_dates'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'title': instance.title,
      'release_date': dateTimeToString(instance.releaseDate),
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'tagline': instance.tagline,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': TMediaStatus.toJson(instance.mediaStatus),
      'homepage': instance.homepage,
      'video': instance.video,
      'adult': instance.adult,
      'genres': instance.genres,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'spoken_languages': instance.spokenLanguages,
      'videos': instance.videos,
      'credits': instance.credits,
      'images': instance.images,
      'release_dates': instance.releaseDates,
    };

MovieCredits _$MovieCreditsFromJson(Map<String, dynamic> json) {
  return MovieCredits(
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

Map<String, dynamic> _$MovieCreditsToJson(MovieCredits instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) {
  return PopularMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularMoviesToJson(PopularMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

RateMovie _$RateMovieFromJson(Map<String, dynamic> json) {
  return RateMovie(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$RateMovieToJson(RateMovie instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

DeleteMovieRating _$DeleteMovieRatingFromJson(Map<String, dynamic> json) {
  return DeleteMovieRating(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$DeleteMovieRatingToJson(DeleteMovieRating instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

MovieRecommendations _$MovieRecommendationsFromJson(Map<String, dynamic> json) {
  return MovieRecommendations(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieRecommendationsToJson(
        MovieRecommendations instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

MovieResumed _$MovieResumedFromJson(Map<String, dynamic> json) {
  return MovieResumed(
    id: json['id'] as int,
    title: json['title'] as String,
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
    rating: (json['rating'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MovieResumedToJson(MovieResumed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
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
      'rating': instance.rating,
    };

TopRatedMovies _$TopRatedMoviesFromJson(Map<String, dynamic> json) {
  return TopRatedMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TopRatedMoviesToJson(TopRatedMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$MovieToString(Movie o) {
  return """Movie{
  id: ${o.id},
  imdbId: ${o.imdbId},
  title: ${o.title},
  releaseDate: ${o.releaseDate},
  overview: ${o.overview},
  originalTitle: ${o.originalTitle},
  originalLanguage: ${o.originalLanguage},
  voteCount: ${o.voteCount},
  voteAverage: ${o.voteAverage},
  popularity: ${o.popularity},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
  tagline: ${o.tagline},
  budget: ${o.budget},
  revenue: ${o.revenue},
  runtime: ${o.runtime},
  mediaStatus: ${o.mediaStatus},
  homepage: ${o.homepage},
  video: ${o.video},
  adult: ${o.adult},
  genres: ${o.genres},
  productionCompanies: ${o.productionCompanies},
  productionCountries: ${o.productionCountries},
  spokenLanguages: ${o.spokenLanguages},
  videos: ${o.videos.toString().split("\n").join("\n  ")},
  credits: ${o.credits.toString().split("\n").join("\n  ")},
  images: ${o.images.toString().split("\n").join("\n  ")},
  releaseDates: ${o.releaseDates.toString().split("\n").join("\n  ")},
}""";
}

String _$MovieCreditsToString(MovieCredits o) {
  return """MovieCredits{
  cast: ${o.cast},
  crew: ${o.crew},
}""";
}

String _$RateMovieToString(RateMovie o) {
  return """RateMovie{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  ratingType: ${o.ratingType},
  mediaType: ${o.mediaType},
}""";
}

String _$DeleteMovieRatingToString(DeleteMovieRating o) {
  return """DeleteMovieRating{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
  ratingType: ${o.ratingType},
  mediaType: ${o.mediaType},
}""";
}

String _$MovieResumedToString(MovieResumed o) {
  return """MovieResumed{
  id: ${o.id},
  mediaType: ${o.mediaType},
  title: ${o.title},
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
  rating: ${o.rating},
}""";
}
