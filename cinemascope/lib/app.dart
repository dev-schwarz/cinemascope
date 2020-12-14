import 'package:provider/provider.dart';

import 'global/themes.dart';
import 'material.dart';
import 'stores/data/data_store.dart';
import 'stores/settings_store.dart';
import 'stores/user_store.dart';

class CinemascopeApp extends StatelessWidget {
  const CinemascopeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => UserStore(),
          lazy: false,
        ),
        Provider(
          create: (_) => DataStore(),
        ),
        Provider(
          create: (_) => SettingsStore(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinemascope',
        theme: theme.copyWith(
          textTheme: theme.textTheme.apply(
            fontFamily: 'SourceSansPro',
          ),
        ),
        darkTheme: darkTheme.copyWith(
          textTheme: darkTheme.textTheme.apply(
            fontFamily: 'SourceSansPro',
          ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.initialRoute.name,
        onGenerateRoute: _getCurrentRoute,
        builder: (_, child) => AppTheme(child),
      ),
    );
  }

  MaterialPageRoute _getCurrentRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: AppRoutes.routes[settings.name],
      settings: settings,
    );
  }

  // Widget _searchButton(BuildContext context) => IconButton(
  //       icon: const Icon(Icons.search),
  //       onPressed: () => Navigator.of(context).pushNamed(AppRoutes.SEARCH),
  //     );
}
