part of '../objects.dart';

class ApiAuthentication {
  ApiAuthentication(this._api);

  final _TmdbObjectsBase _api;

  String sessionId;

  void setUserData(String sessionId) {
    this.sessionId = sessionId;
    _api.authentication.setUserData(sessionId);
  }

  Future<AuthenticationRequestToken> createRequestToken() async {
    Map json = await _api.authentication.createRequestToken();
    return AuthenticationRequestToken.fromJson(json);
  }

  Future<AuthenticationSessionId> createSessionId(String requestToken) async {
    Map json = await _api.authentication.createSession(requestToken);
    return AuthenticationSessionId.fromJson(json);
  }

  Future<AuthenticationSessionFromV4> createSessionIdFromV4(String accessToken) async {
    Map json = await _api.authentication.createSessionFromV4(accessToken);
    return AuthenticationSessionFromV4.fromJson(json);
  }
}
