// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetails _$AccountDetailsFromJson(Map<String, dynamic> json) {
  return AccountDetails(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    iso_639_1: json['iso_639_1'] as String,
    iso_3166_1: json['iso_3166_1'] as String,
    includeAdult: json['include_adult'] as bool,
    avatar: json['avatar'] == null
        ? null
        : AccountDetailsAvatar.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountDetailsToJson(AccountDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'include_adult': instance.includeAdult,
      'avatar': instance.avatar,
    };

AccountDetailsAvatar _$AccountDetailsAvatarFromJson(Map<String, dynamic> json) {
  return AccountDetailsAvatar(
    gravatar: json['gravatar'] == null
        ? null
        : AccountDetailsGravatar.fromJson(
            json['gravatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountDetailsAvatarToJson(
        AccountDetailsAvatar instance) =>
    <String, dynamic>{
      'gravatar': instance.gravatar,
    };

AccountDetailsGravatar _$AccountDetailsGravatarFromJson(
    Map<String, dynamic> json) {
  return AccountDetailsGravatar(
    hash: json['hash'] as String,
  );
}

Map<String, dynamic> _$AccountDetailsGravatarToJson(
        AccountDetailsGravatar instance) =>
    <String, dynamic>{
      'hash': instance.hash,
    };

AccountAddToWatchlist _$AccountAddToWatchlistFromJson(
    Map<String, dynamic> json) {
  return AccountAddToWatchlist(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$AccountAddToWatchlistToJson(
        AccountAddToWatchlist instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

AccountFavoriteMovies _$AccountFavoriteMoviesFromJson(
    Map<String, dynamic> json) {
  return AccountFavoriteMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountFavoriteMoviesToJson(
        AccountFavoriteMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

AccountFavoriteTvs _$AccountFavoriteTvsFromJson(Map<String, dynamic> json) {
  return AccountFavoriteTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountFavoriteTvsToJson(AccountFavoriteTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

AccountMarkAsFavorite _$AccountMarkAsFavoriteFromJson(
    Map<String, dynamic> json) {
  return AccountMarkAsFavorite(
    statusCode: json['status_code'] as int,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$AccountMarkAsFavoriteToJson(
        AccountMarkAsFavorite instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };

AccountRatedMovies _$AccountRatedMoviesFromJson(Map<String, dynamic> json) {
  return AccountRatedMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountRatedMoviesToJson(AccountRatedMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

AccountRatedTvs _$AccountRatedTvsFromJson(Map<String, dynamic> json) {
  return AccountRatedTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountRatedTvsToJson(AccountRatedTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

AccountWatchListMovies _$AccountWatchListMoviesFromJson(
    Map<String, dynamic> json) {
  return AccountWatchListMovies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountWatchListMoviesToJson(
        AccountWatchListMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

AccountWatchListTvs _$AccountWatchListTvsFromJson(Map<String, dynamic> json) {
  return AccountWatchListTvs(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountWatchListTvsToJson(
        AccountWatchListTvs instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$AccountDetailsToString(AccountDetails o) {
  return """AccountDetails{
  id: ${o.id},
  name: ${o.name},
  username: ${o.username},
  iso_639_1: ${o.iso_639_1},
  iso_3166_1: ${o.iso_3166_1},
  includeAdult: ${o.includeAdult},
  avatar: ${o.avatar.toString().split("\n").join("\n  ")},
}""";
}

String _$AccountDetailsAvatarToString(AccountDetailsAvatar o) {
  return """AccountDetailsAvatar{
  gravatar: ${o.gravatar.toString().split("\n").join("\n  ")},
}""";
}

String _$AccountDetailsGravatarToString(AccountDetailsGravatar o) {
  return """AccountDetailsGravatar{
  hash: ${o.hash},
}""";
}

String _$AccountAddToWatchlistToString(AccountAddToWatchlist o) {
  return """AccountAddToWatchlist{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
}""";
}

String _$AccountMarkAsFavoriteToString(AccountMarkAsFavorite o) {
  return """AccountMarkAsFavorite{
  statusCode: ${o.statusCode},
  statusMessage: ${o.statusMessage},
}""";
}
