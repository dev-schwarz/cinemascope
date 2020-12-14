import 'package:mobx/mobx.dart';

import '../global/prefs_helper.dart';
import '../models/tmdb_user.dart';
import '../repositories/tmdb/tmdb_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore({bool clearLoginData = false}) {
    if (clearLoginData) {
      logout().whenComplete(() {
        _loginCurrentUser();
      });
    } else {
      _loginCurrentUser();
    }
  }

  final TmdbRepository _repository = TmdbRepository();

  String _requestToken;
  String _sessionId;
  String _accountId;
  String _accessToken;

  TmdbUserCredentials userCredentials;

  @observable
  LoginAskPermissionData askPermissionData;

  @observable
  LoginStep loginStep = LoginStep.loadingCurrentUser;

  void _loginCurrentUser() {
    final bool keysOk = PrefsHelper().prefs.getKeys().containsAll([
      PrefsKeys.loginSessionId,
      PrefsKeys.loginAccountId,
      PrefsKeys.loginAccessToken,
    ]);

    if (keysOk) {
      _sessionId = PrefsHelper().load<String>(PrefsKeys.loginSessionId, null);
      _accountId = PrefsHelper().load<String>(PrefsKeys.loginAccountId, null);
      _accessToken = PrefsHelper().load<String>(PrefsKeys.loginAccessToken, null);

      userCredentials = TmdbUserCredentials(
        sessionId: _sessionId,
        accountId: _accountId,
        accessToken: _accessToken,
      );

      _login();
    } else {
      loginStep = LoginStep.pending;
    }
  }

  @action
  void performFakeLogin() {
    userCredentials = TmdbUserCredentials(
      sessionId: _LoginConstants.fakeSessionId,
      accountId: _LoginConstants.fakeAccountId,
      accessToken: _LoginConstants.fakeAccessToken,
    );

    _login();
  }

  @action
  Future<void> createRequestToken() async {
    loginStep = LoginStep.creatingRequestToken;

    final requestToken = await _repository.api.auth4.createRequestToken(
      redirectTo: _LoginConstants.redirectToV4,
    );

    if (requestToken.isSuccess) {
      _requestToken = requestToken.requestToken;
      askPermissionData = LoginAskPermissionData(
        askPermissionUrl: _makeAuthUrl(_LoginConstants.authBaseUrlV4, _requestToken),
      );
      loginStep = LoginStep.askingUserPermission;
    } else {
      loginStep = LoginStep.error;
    }
  }

  @action
  Future<void> createAccessToken() async {
    loginStep = LoginStep.creatingAccessToken;

    final accessToken = await _repository.api.auth4.createAccessToken(
      requestToken: _requestToken,
    );

    if (accessToken.isSuccess) {
      _accountId = accessToken.accountId;
      _accessToken = accessToken.accessToken;
      loginStep = LoginStep.createSessionId;
      _createSessionId().whenComplete(() {
        _login();
      });
    } else {
      loginStep = LoginStep.error;
    }
  }

  Future<void> _createSessionId() async {
    final sessionId = await _repository.api.authentication.createSessionIdFromV4(
      _accessToken,
    );

    if (sessionId.sessionId != null && sessionId.sessionId.isNotEmpty) {
      loginStep = LoginStep.loginPerformed;
      _sessionId = sessionId.sessionId;
      userCredentials = TmdbUserCredentials(
        sessionId: _sessionId,
        accountId: _accountId,
        accessToken: _accessToken,
      );
      await _saveLoginData();
    } else {
      loginStep = LoginStep.error;
    }
  }

  @action
  void _login() {
    _repository.api.loginAll(
      userCredentials.sessionId,
      userCredentials.accountId,
      userCredentials.accessToken,
    );

    loginStep = LoginStep.loggedIn;
  }

  Future<void> logout() async {
    await PrefsHelper().prefs.remove(PrefsKeys.loginSessionId);
    await PrefsHelper().prefs.remove(PrefsKeys.loginAccountId);
    await PrefsHelper().prefs.remove(PrefsKeys.loginAccessToken);
  }

  Future<void> _saveLoginData() async {
    if (userCredentials == null || !userCredentials.loginDataOk) {
      loginStep = LoginStep.error;
      return;
    }

    await PrefsHelper().save<String>(PrefsKeys.loginSessionId, userCredentials.sessionId);
    await PrefsHelper().save<String>(PrefsKeys.loginAccountId, userCredentials.accountId);
    await PrefsHelper().save<String>(PrefsKeys.loginAccessToken, userCredentials.accessToken);
  }

  /// Replace the [_requestTokenPart] of the url by the value of [requestToken].
  String _makeAuthUrl(String url, String requestToken) {
    return url.replaceAll(_LoginConstants.requestTokenPart, requestToken);
  }
}

class LoginAskPermissionData {
  const LoginAskPermissionData({
    this.askPermissionUrl,
    this.permissionGrantedUrl,
  });

  final String askPermissionUrl;
  final String permissionGrantedUrl;
}

enum LoginStep {
  loadingCurrentUser,
  pending,
  creatingRequestToken,
  askingUserPermission,
  creatingAccessToken,
  createSessionId,
  loginPerformed,
  loggedIn,
  error,
}

class _LoginConstants {
  const _LoginConstants._();

  static const redirectToV4 = r'''http://__authorized_v4__.tmdb''';

  static const requestTokenPart = '{{REQUEST_TOKEN}}';

  static const authBaseUrlV4 = 'https://www.themoviedb.org'
      '/auth/access'
      '?request_token=$requestTokenPart';

  static const fakeSessionId = r'''e1bd92f910495860302e00f4a97668a233ab8b66''';
  static const fakeAccountId = r'''5eb4bb017ac8290022228128''';
  static const fakeAccessToken =
      r'''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzI0NDksInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1NzgiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.nLFgA3mCMoUHFy4xbE5F3CJTpLfzUvjPlDye9eae0io''';
}
