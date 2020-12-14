import 'package:flutter/widgets.dart' show WidgetBuilder, required;

class AppRouteData {
  const AppRouteData({
    @required this.name,
    @required this.builder,
  });

  final String name;
  final WidgetBuilder builder;
}
