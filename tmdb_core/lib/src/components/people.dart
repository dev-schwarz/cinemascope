part of '../core.dart';

class CorePeople {
  static const _startPoint = 'person';

  CorePeople(this._core);

  final TmdbCore _core;

  /// Get the primary person details by id.
  Future<Map> getDetails(int id, {String language, List<String> append}) {
    _checkNotNull(id, 'id');
    _Params params = _Params();
    params['language'] = language;
    params['append_to_response'] = append;
    return _core._query3('$_startPoint/$id', params: params);
  }
}
