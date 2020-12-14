part of '_configuration.dart';

@ToString()
@JsonSerializable()
class ConfigurationCountries extends Equatable {
  final List<ConfigurationCountry> results;

  ConfigurationCountries({
    this.results,
  });

  factory ConfigurationCountries.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationCountriesToJson(this);

  @override
  List<Object> get props => [
        results,
      ];

  @override
  String toString() => _$ConfigurationCountriesToString(this);
}

@ToString()
@JsonSerializable()
class ConfigurationCountry extends Equatable {
  ConfigurationCountry({
    this.iso_3166_1,
    this.englishName,
  });

  final String iso_3166_1;
  final String englishName;

  factory ConfigurationCountry.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationCountryToJson(this);

  @override
  List<Object> get props => [
        iso_3166_1,
        englishName,
      ];

  @override
  String toString() => _$ConfigurationCountryToString(this);
}
