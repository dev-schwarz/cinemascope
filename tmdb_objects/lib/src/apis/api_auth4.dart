part of '../objects.dart';

class ApiAuth4 {
  ApiAuth4(this._api);

  final _TmdbObjectsBase _api;

  String accountId;
  String accessToken;

  void setUserData(String accountId, String accessToken) {
    this.accountId = accountId;
    this.accessToken = accessToken;
    _api.auth4.setUserData(accountId, accessToken);
  }

  Future<Auth4RequestToken> createRequestToken({String redirectTo}) async {
    Map json = await _api.auth4.createRequestToken(redirectTo: redirectTo);
    return Auth4RequestToken.fromJson(json);
  }

  Future<Auth4AccessToken> createAccessToken({String requestToken}) async {
    Map json = await _api.auth4.createAccessToken(requestToken);
    return Auth4AccessToken.fromJson(json);
  }

  Future<Auth4DeleteAccessToken> deleteAccessToken(String accessToken) async {
    Map json = await _api.auth4.deleteAccessToken(accessToken);
    return Auth4DeleteAccessToken.fromJson(json);
  }
}
