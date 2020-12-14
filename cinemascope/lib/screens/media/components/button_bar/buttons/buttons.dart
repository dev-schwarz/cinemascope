import 'dart:async';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../material.dart';
import '../../../../../stores/media/media_store.dart';

part 'favorite_button.dart';
part 'rating_button.dart';
part 'watch_list_button.dart';

class _MediaButton extends StatelessWidget {
  const _MediaButton({
    Key key,
    @required this.onTap,
    @required this.iconData,
    @required this.label,
    this.tooltip,
    this.color,
    this.iconColor,
  })  : assert(iconData != null),
        assert(label != null),
        super(key: key);

  final VoidCallback onTap;
  final IconData iconData;
  final String label;
  final String tooltip;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        color ?? context.appTheme.mediaDetailsTheme.actionsBarTheme.buttonColor.withAlpha(140);

    final button = InkWell(
      onTap: onTap,
      splashColor: buttonColor.withOpacity(0.13),
      highlightColor: buttonColor.withOpacity(0.1),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              size: 22.0,
              color: iconColor ?? buttonColor,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTheme.mediaDetailsTheme.actionsBarTheme.buttonTextStyle.copyWith(
                color: buttonColor,
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      height: 60.0,
      child: tooltip == null
          ? button
          : Tooltip(
              message: tooltip,
              child: button,
            ),
    );
  }
}
