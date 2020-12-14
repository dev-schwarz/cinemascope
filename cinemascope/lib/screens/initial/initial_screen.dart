import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../material.dart';

part 'components/logo.dart';
part 'components/splash.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (context.userStore.isLoggedIn) {
          return const _Splash();
        } else {
          return _Logo(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      child: Text('Fake Login on TMDb'),
                      elevation: 10.0,
                      onPressed: context.userStore.loginFakeUser,
                    ),
                    RaisedButton(
                      child: Text('Login on TMDb'),
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
