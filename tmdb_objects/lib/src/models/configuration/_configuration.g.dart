// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationCountries _$ConfigurationCountriesFromJson(
    Map<String, dynamic> json) {
  return ConfigurationCountries(
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationCountry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfigurationCountriesToJson(
        ConfigurationCountries instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ConfigurationCountry _$ConfigurationCountryFromJson(Map<String, dynamic> json) {
  return ConfigurationCountry(
    iso_3166_1: json['iso_3166_1'] as String,
    englishName: json['english_name'] as String,
  );
}

Map<String, dynamic> _$ConfigurationCountryToJson(
        ConfigurationCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'english_name': instance.englishName,
    };

ConfigurationLanguages _$ConfigurationLanguagesFromJson(
    Map<String, dynamic> json) {
  return ConfigurationLanguages(
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfigurationLanguagesToJson(
        ConfigurationLanguages instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ConfigurationLanguage _$ConfigurationLanguageFromJson(
    Map<String, dynamic> json) {
  return ConfigurationLanguage(
    iso_639_1: json['iso_639_1'] as String,
    name: json['name'] as String,
    englishName: json['english_name'] as String,
  );
}

Map<String, dynamic> _$ConfigurationLanguageToJson(
        ConfigurationLanguage instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'name': instance.name,
      'english_name': instance.englishName,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$ConfigurationCountriesToString(ConfigurationCountries o) {
  return """ConfigurationCountries{
  results: ${o.results},
}""";
}

String _$ConfigurationCountryToString(ConfigurationCountry o) {
  return """ConfigurationCountry{
  iso_3166_1: ${o.iso_3166_1},
  englishName: ${o.englishName},
}""";
}

String _$ConfigurationLanguagesToString(ConfigurationLanguages o) {
  return """ConfigurationLanguages{
  results: ${o.results},
}""";
}

String _$ConfigurationLanguageToString(ConfigurationLanguage o) {
  return """ConfigurationLanguage{
  iso_639_1: ${o.iso_639_1},
  name: ${o.name},
  englishName: ${o.englishName},
}""";
}
