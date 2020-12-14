part of '../core.dart';

class CoreAuth4 {
  static const _startPoint = 'auth';

  CoreAuth4(this._core);

  final TmdbCore _core;

  String accountId;
  String accessToken;

  void setUserData(String accountId, String accessToken) {
    this.accountId = accountId;
    this.accessToken = accessToken;
  }

  /// This method generates a new request token that you can ask a user to approve.
  ///
  /// This is the first step in getting permission from a user to read and write
  /// data on their behalf.
  Future<Map> createRequestToken({String redirectTo}) async {
    _Params params = _Params();
    params['redirect_to'] = redirectTo;

    Map resp = await _core._query4(
      '$_startPoint/request_token',
      method: _QueryMethod.POST,
      accessTokenType: _AccessTokenType.read,
      params: params,
    );

    if (resp != null && resp['success']) {
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't create a new request token", resp));
    }
  }

  /// This method will finish the user authentication flow and issue an official
  /// user access token.
  ///
  /// The [requestToken] parameter is sent along in the request to TMDb.
  Future<Map> createAccessToken(String requestToken) async {
    _checkNotNull(requestToken, 'request_token');
    _Params params = _Params();
    params['request_token'] = requestToken;

    Map resp = await _core._query4(
      '$_startPoint/access_token',
      method: _QueryMethod.POST,
      accessTokenType: _AccessTokenType.read,
      params: params,
    );

    if (resp != null && resp['success']) {
      accountId = resp['account_id'] as String;
      accessToken = resp['access_token'] as String;
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't create a new access token", resp));
    }
  }

  Future<Map> deleteAccessToken(String accessToken) async {
    _checkNotNull(accessToken, 'access_token');
    _Params params = _Params();
    params['access_token'] = accessToken;

    Map resp = await _core._query4(
      '$_startPoint/access_token',
      method: _QueryMethod.DELETE,
      accessTokenType: _AccessTokenType.read,
      params: params,
    );

    if (_responseSuccess(resp)) {
      return resp;
    } else {
      throw Exception(_makeMessage("Couldn't delete the access token", resp));
    }
  }
}
