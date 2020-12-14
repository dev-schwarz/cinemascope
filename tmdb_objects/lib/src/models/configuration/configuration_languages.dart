part of '_configuration.dart';

@ToString()
@JsonSerializable()
class ConfigurationLanguages extends Equatable {
  final List<ConfigurationLanguage> results;

  ConfigurationLanguages({
    this.results,
  });

  factory ConfigurationLanguages.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationLanguagesToJson(this);

  @override
  List<Object> get props => [results];

  @override
  String toString() => _$ConfigurationLanguagesToString(this);
}

@ToString()
@JsonSerializable()
class ConfigurationLanguage extends Equatable {
  final String iso_639_1;
  final String name;
  final String englishName;

  ConfigurationLanguage({
    this.iso_639_1,
    this.name,
    this.englishName,
  });

  factory ConfigurationLanguage.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationLanguageToJson(this);

  @override
  List<Object> get props => [
        iso_639_1,
        name,
        englishName,
      ];

  @override
  String toString() => _$ConfigurationLanguageToString(this);
}
