import 'package:flutter/material.dart';

class LoadingNextPageIndicator extends StatelessWidget {
  final Color color;

  const LoadingNextPageIndicator({
    Key key,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 40.0,
      width: 40.0,
      alignment: const Alignment(0.0, 0.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
