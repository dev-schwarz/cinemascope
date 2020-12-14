// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending<T> _$TrendingFromJson<T extends ResumedMedia>(
    Map<String, dynamic> json) {
  return Trending<T>(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map(ResumedMediaConverter<T>().fromJson)
        ?.toList(),
  );
}

Map<String, dynamic> _$TrendingToJson<T extends ResumedMedia>(
        Trending<T> instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results':
          instance.results?.map(ResumedMediaConverter<T>().toJson)?.toList(),
    };
