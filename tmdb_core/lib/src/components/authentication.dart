part of '../core.dart';

class CoreAuthentication {
  static const _startPoint = 'authentication';

  CoreAuthentication(this._core);

  final TmdbCore _core;

  String sessionId;

  void setUserData(String sessionId) {
    this.sessionId = sessionId;
  }

  Future<Map> createRequestToken() async {
    Map resp = await _core._query3('$_startPoint/token/new', https: true);
    if (resp != null && resp['success']) {
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't create a new request token.", resp));
    }
  }

  Future<Map> createSession(String requestToken) async {
    _checkNotNull(requestToken, 'request_token');
    _Params params = _Params();
    params['request_token'] = requestToken;
    Map resp = await _core._query3(
      '$_startPoint/session/new',
      method: _QueryMethod.POST,
      https: true,
      params: params,
    );
    if (resp != null && resp['success']) {
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't obtain a new session ID", resp));
    }
  }

  Future<Map> createSessionFromV4(String accessToken) async {
    _Params params = _Params();
    params['access_token'] = accessToken;
    Map resp = await _core._query3(
      '$_startPoint/session/convert/4',
      method: _QueryMethod.POST,
      https: true,
      params: params,
    );
    if (resp != null && resp['success']) {
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't create a new session ID from v4 access token.", resp));
    }
  }
}
