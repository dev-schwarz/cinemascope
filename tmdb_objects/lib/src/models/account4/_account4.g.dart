// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_account4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account4FavoriteMovies _$Account4FavoriteMoviesFromJson(
    Map<String, dynamic> json) {
  return Account4FavoriteMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Account4FavoriteMoviesToJson(
        Account4FavoriteMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

Account4FavoriteTvs _$Account4FavoriteTvsFromJson(Map<String, dynamic> json) {
  return Account4FavoriteTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Account4FavoriteTvsToJson(
        Account4FavoriteTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

Account4Lists _$Account4ListsFromJson(Map<String, dynamic> json) {
  return Account4Lists(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : Account4ListsItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Account4ListsToJson(Account4Lists instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

Account4ListsItem _$Account4ListsItemFromJson(Map<String, dynamic> json) {
  return Account4ListsItem(
    id: json['id'] as int,
    name: json['name'] as String,
    numberOfItems: json['number_of_items'] as int,
    public: json['public'] as int,
    description: json['description'] as String,
    createdAt: dateTimeFromString(json['created_at'] as String),
    updatedAt: dateTimeFromString(json['updated_at'] as String),
    iso_639_1: json['iso_639_1'] as String,
    iso_3166_1: json['iso_3166_1'] as String,
    sortBy: json['sort_by'] as int,
    adult: json['adult'] as int,
    runtime: json['runtime'] as int,
    revenue: json['revenue'] as String,
    featured: json['featured'] as int,
    averageRating: (json['average_rating'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    backdropPath: json['backdrop_path'] as String,
  );
}

Map<String, dynamic> _$Account4ListsItemToJson(Account4ListsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number_of_items': instance.numberOfItems,
      'public': instance.public,
      'description': instance.description,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'sort_by': instance.sortBy,
      'adult': instance.adult,
      'runtime': instance.runtime,
      'revenue': instance.revenue,
      'featured': instance.featured,
      'average_rating': instance.averageRating,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };

Account4WatchListMovies _$Account4WatchListMoviesFromJson(
    Map<String, dynamic> json) {
  return Account4WatchListMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Account4WatchListMoviesToJson(
        Account4WatchListMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

Account4WatchListTvs _$Account4WatchListTvsFromJson(Map<String, dynamic> json) {
  return Account4WatchListTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Account4WatchListTvsToJson(
        Account4WatchListTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$Account4ListsItemToString(Account4ListsItem o) {
  return """Account4ListsItem{
  id: ${o.id},
  name: ${o.name},
  numberOfItems: ${o.numberOfItems},
  public: ${o.public},
  description: ${o.description},
  createdAt: ${o.createdAt},
  updatedAt: ${o.updatedAt},
  iso_639_1: ${o.iso_639_1},
  iso_3166_1: ${o.iso_3166_1},
  sortBy: ${o.sortBy},
  adult: ${o.adult},
  runtime: ${o.runtime},
  revenue: ${o.revenue},
  featured: ${o.featured},
  averageRating: ${o.averageRating},
  posterPath: ${o.posterPath},
  backdropPath: ${o.backdropPath},
}""";
}
