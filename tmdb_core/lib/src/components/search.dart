part of '../core.dart';

class CoreSearch {
  static const _startPoint = 'search';

  CoreSearch(this._core);

  final TmdbCore _core;

  /// Search for companies.
  Future<Map> searchCompany(String query, {int page}) {
    _checkNotNull(query, 'query');
    _Params params = _Params();
    params['query'] = query;
    params['page'] = page;
    return _core._query3('$_startPoint/company', params: params);
  }

  /// Search multiple models in a single request.
  ///
  /// Multi search currently supports searching for movies, tv shows and
  /// people in a single request.
  Future<Map> multiSearch(
    String query, {
    int page,
    String language,
    String region,
    bool includeAdult,
  }) {
    _checkNotNull(query, 'query');
    _Params params = _Params();
    params['query'] = query;
    params['page'] = page;
    params['language'] = language;
    params['region'] = region;
    params['include_adult'] = includeAdult;
    return _core._query3('$_startPoint/multi', params: params);
  }
}
