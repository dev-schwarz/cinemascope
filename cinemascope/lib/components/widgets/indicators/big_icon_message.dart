import 'package:flutter/material.dart';

class BigIconMessage extends StatelessWidget {
  final IconData iconData;
  final String message;

  const BigIconMessage({Key key, this.iconData, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 120.0,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 15.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
