import 'package:flutter/material.dart';

import '../../../global/app_routes.dart';

class AppBarSearchButton extends StatelessWidget {
  const AppBarSearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      tooltip: 'Search',
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.SEARCH);
      },
    );
  }
}
