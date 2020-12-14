part of '../core.dart';

class CoreConfiguration {
  static const _startPoint = 'configuration';

  CoreConfiguration(this._core);

  final TmdbCore _core;

  Future<Map> getCountries() {
    _Params params = _Params();
    return _core._query3(
      '$_startPoint/countries',
      params: params,
    );
  }

  Future<dynamic> getLanguages() {
    _Params params = _Params();
    return _core._query3(
      '$_startPoint/languages',
      params: params,
    );
  }
}
