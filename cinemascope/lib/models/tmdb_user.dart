class TmdbUser {
  TmdbUser({this.id, this.name, this.username, this.credentials});

  final int id;
  final String name;
  final String username;
  final TmdbUserCredentials credentials;

  bool get isLoggedIn => credentials != null && credentials.loginDataOk;
}

class TmdbUserCredentials {
  TmdbUserCredentials({this.sessionId, this.accountId, this.accessToken});

  final String sessionId;
  final String accountId;
  final String accessToken;

  bool get loginDataOk =>
      (sessionId?.isNotEmpty ?? false) &&
      (accountId?.isNotEmpty ?? false) &&
      (accessToken?.isNotEmpty ?? false);
}
