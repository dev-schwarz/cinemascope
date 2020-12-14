import 'package:flutter/material.dart';

class RoundedDialog extends StatelessWidget {
  const RoundedDialog({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
        side: const BorderSide(width: 2.0, color: Colors.grey),
      ),
      child: child,
    );
  }
}
