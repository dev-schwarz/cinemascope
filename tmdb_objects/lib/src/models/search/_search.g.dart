// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMulti<T> _$SearchMultiFromJson<T extends ResumedMedia>(
    Map<String, dynamic> json) {
  return SearchMulti<T>(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map(ResumedMediaConverter<T>().fromJson)
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchMultiToJson<T extends ResumedMedia>(
        SearchMulti<T> instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results':
          instance.results?.map(ResumedMediaConverter<T>().toJson)?.toList(),
    };

SearchCompanies _$SearchCompaniesFromJson(Map<String, dynamic> json) {
  return SearchCompanies(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : SearchCompaniesItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchCompaniesToJson(SearchCompanies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

SearchCompaniesItem _$SearchCompaniesItemFromJson(Map<String, dynamic> json) {
  return SearchCompaniesItem(
    id: json['id'] as int,
    name: json['name'] as String,
    logoPath: json['logo_path'] as String,
  );
}

Map<String, dynamic> _$SearchCompaniesItemToJson(
        SearchCompaniesItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$SearchCompaniesItemToString(SearchCompaniesItem o) {
  return """SearchCompaniesItem{
  id: ${o.id},
  name: ${o.name},
  logoPath: ${o.logoPath},
}""";
}
