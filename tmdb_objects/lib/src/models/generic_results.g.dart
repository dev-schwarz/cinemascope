// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TGenericResults<T> _$TGenericResultsFromJson<T>(Map<String, dynamic> json) {
  return TGenericResults<T>(
    json['id'] as int,
    json['total_pages'] as int,
    json['total_results'] as int,
    (json['results'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$TGenericResultsToJson<T>(TGenericResults<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results?.map(_Converter<T>().toJson)?.toList(),
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$TGenericResultsToString(TGenericResults o) {
  return """TGenericResults{
  id: ${o.id},
  totalPages: ${o.totalPages},
  totalResults: ${o.totalResults},
  results: ${o.results},
}""";
}
