import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../models/tmdb_user.dart';
import '../repositories/tmdb/tmdb_repository.dart';
import 'login_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore() {
    _loginStore = LoginStore(clearLoginData: false);
    _disposers = [
      reaction((_) => _loginStore.loginStep, (step) {
        if (step == LoginStep.loggedIn || step == LoginStep.loginPerformed) {
          login();
        }
      }),
    ];
  }

  final TmdbRepository _repository = TmdbRepository();

  LoginStore get loginStore => _loginStore;
  LoginStore _loginStore;

  @observable
  TmdbUser user;

  @action
  void setUser(TmdbUser value) => user = value;

  @computed
  bool get isLoggedIn => user != null && user.isLoggedIn;

  @action
  void loginFakeUser() {
    _loginStore.performFakeLogin();
  }

  Future<void> login() async {
    if (_disposers != null) {
      _disposers.forEach((d) => d());
      _disposers = null;
    }

    final AccountDetails accountDetails = await _repository.api.account.getDetails();
    setUser(_mapAccountDetailsToUser(accountDetails, _loginStore.userCredentials));
  }

  TmdbUser _mapAccountDetailsToUser(
      AccountDetails accountDetails, TmdbUserCredentials credentials) {
    return TmdbUser(
      id: accountDetails.id,
      name: accountDetails.name,
      username: accountDetails.username,
      credentials: credentials,
    );
  }

  List<ReactionDisposer> _disposers;
}
