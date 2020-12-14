// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_discover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverMovie _$DiscoverMovieFromJson(Map<String, dynamic> json) {
  return DiscoverMovie(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DiscoverMovieToJson(DiscoverMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

DiscoverTv _$DiscoverTvFromJson(Map<String, dynamic> json) {
  return DiscoverTv(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TvResumed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DiscoverTvToJson(DiscoverTv instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
