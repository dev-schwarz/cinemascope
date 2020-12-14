part of '../objects.dart';

class ApiConfiguration {
  ApiConfiguration(this._api);

  final _TmdbObjectsBase _api;

  Future<ConfigurationCountries> getCountries() async {
    Map json = await _api.configuration.getCountries();
    return ConfigurationCountries.fromJson(json);
  }

  Future<ConfigurationLanguages> getLanguages() async {
    Map json = await _api.configuration.getLanguages();
    return ConfigurationLanguages.fromJson(json);
  }
}
