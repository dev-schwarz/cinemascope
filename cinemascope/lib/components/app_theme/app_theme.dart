import 'package:flutter/material.dart';

import '../../global/themes.dart';
import '../../models/app_theme_data.dart';

class AppTheme extends StatelessWidget {
  const AppTheme(this.child, {Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AppTheme(
      context: context,
      appTheme: appThemeData,
      darkAppTheme: appThemeDataDark,
      child: child,
    );
  }

  static AppThemeData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AppTheme>()._currentAppThemeData;
}

class _AppTheme extends InheritedWidget {
  const _AppTheme({
    Key key,
    @required BuildContext context,
    @required Widget child,
    @required AppThemeData appTheme,
    @required AppThemeData darkAppTheme,
  })  : assert(context != null),
        assert(child != null),
        _context = context,
        _appTheme = appTheme,
        _darkAppTheme = darkAppTheme,
        super(key: key, child: child);

  final BuildContext _context;
  final AppThemeData _appTheme;
  final AppThemeData _darkAppTheme;

  Brightness get _brightness => Theme.of(_context).brightness;

  AppThemeData get _currentAppThemeData =>
      _brightness == Brightness.dark ? _darkAppTheme : _appTheme;

  @override
  bool updateShouldNotify(covariant _AppTheme old) => _brightness != old._brightness;
}
