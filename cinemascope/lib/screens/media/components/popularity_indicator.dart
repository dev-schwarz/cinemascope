import 'package:flutter/material.dart';

enum PopularitySentiment {
  veryDissatisfied,
  dissatisfied,
  neutral,
  satisfied,
  verySatisfied,
}

class PopularityIndicator extends StatelessWidget {
  const PopularityIndicator({
    Key key,
    this.sentiment,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final PopularitySentiment sentiment;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      _Indicator(sentiment: sentiment, widgetSize: 55.0),
    ];

    if (leading != null) {
      children.insert(
          0,
          Expanded(
            child: leading,
          ));
    } else if (trailing != null) {
      children.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: trailing,
        ),
      ));
    }

    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: Row(
        children: children,
      ),
    );
  }
}

const _sentimentIcons = const <IconData>[
  Icons.sentiment_very_dissatisfied,
  Icons.sentiment_dissatisfied,
  Icons.sentiment_neutral,
  Icons.sentiment_satisfied,
  Icons.sentiment_very_satisfied,
];

final _sentimentColors = <Color>[
  Colors.red,
  Colors.orange,
  Colors.grey,
  Colors.green,
  Colors.greenAccent[400],
];

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key key,
    @required this.sentiment,
    this.widgetSize = 70.0,
  }) : super(key: key);

  final PopularitySentiment sentiment;
  final double widgetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        _sentimentIcons[sentiment.index],
        size: widgetSize,
        color: _sentimentColors[sentiment.index],
      ),
    );
  }
}
