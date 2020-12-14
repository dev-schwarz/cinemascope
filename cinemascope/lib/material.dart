import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/app_theme/app_theme.dart';
import 'models/app_theme_data.dart';
import 'stores/data/data_store.dart';
import 'stores/settings_store.dart';
import 'stores/user_store.dart';

export 'package:flutter/material.dart';

export 'components/widgets.dart';
export 'global/app_routes.dart';
export 'global/screen_arguments.dart';

extension AppThemeExtension on BuildContext {
  AppThemeData get appTheme => AppTheme.of(this);

  ThemeData get theme => Theme.of(this);
}

extension AppStoresExtension on BuildContext {
  DataStore get dataStore => Provider.of<DataStore>(this, listen: false);

  UserStore get userStore => Provider.of<UserStore>(this, listen: false);

  SettingsStore get settingsStore => Provider.of<SettingsStore>(this, listen: false);
}
