import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../global/constants.dart';
import 'color_loader_indicator.dart';

class BigLoadingIndicator extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool showTitle;
  final bool horizontal;
  final String message;
  final Color color;

  const BigLoadingIndicator({
    Key key,
    this.iconData = Icons.sync,
    this.title,
    this.showTitle = true,
    this.horizontal = true,
    this.message,
    this.color = kAppLoadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final i18n = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (showTitle)
          Text(
            // title ?? i18n.fetching,
            title ?? 'Fetching',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5.copyWith(color: color),
          ),
        const SizedBox(height: 10.0),
        _makeMessage(context),
        const SizedBox(height: 50.0),
        Center(
          // child: CircularProgressIndicator(
          //   valueColor: AlwaysStoppedAnimation<Color>(color),
          //   strokeWidth: 3.0,
          // ),
          child: ColorLoaderIndicator(
            radius: 20.0,
            dotRadius: 10.0,
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }

  Widget _makeMessage(BuildContext context) {
    final messageChildren = <Widget>[
      Icon(iconData, color: color, size: 100.0),
    ];

    if (message != null) {
      final messagePadding = horizontal ? EdgeInsets.only(left: 8.0) : EdgeInsets.only(top: 16.0);
      messageChildren.add(
        Padding(
          padding: messagePadding,
          child: Text(
            message,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(color: color),
          ),
        ),
      );
    }

    return horizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: messageChildren,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: messageChildren,
          );
  }
}
