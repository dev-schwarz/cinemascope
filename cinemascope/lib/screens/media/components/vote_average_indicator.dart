import 'dart:math' as math;

import 'package:flutter/material.dart';

class VoteAverageIndicator extends StatelessWidget {
  const VoteAverageIndicator({
    Key key,
    this.value,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final double value;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      _IndicatorAnimated(value: value, widgetSize: 70.0),
    ];

    if (leading != null) {
      children.insert(0, Expanded(child: leading));
    } else if (trailing != null) {
      children.add(Expanded(child: trailing));
    }

    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: Row(
        children: children,
        // children: <Widget>[
        //   Expanded(child: leading),
        //   _IndicatorAnimated(value: value, widgetSize: 70.0),
        // ],
      ),
    );
  }
}

class _IndicatorAnimated extends StatefulWidget {
  const _IndicatorAnimated({
    Key key,
    @required this.value,
    this.widgetSize = 70.0,
  })  : assert(value != null && value >= 0.0 && value <= 1.0),
        assert(widgetSize != null),
        super(key: key);

  final double value;
  final double widgetSize;

  @override
  _IndicatorAnimatedState createState() => _IndicatorAnimatedState();
}

class _IndicatorAnimatedState extends State<_IndicatorAnimated>
    with SingleTickerProviderStateMixin<_IndicatorAnimated>, AutomaticKeepAliveClientMixin {
  double get value => widget.value;

  double get widgetSize => widget.widgetSize;

  Animation<double> _animation;
  AnimationController _controller;
  double _currentValue = 0.0;

  bool _hasValue;

  Color _indicatorLineColor;
  Color _indicatorLineBackgroundColor;

  TextStyle _valueTextStyle;
  TextStyle _percentTextStyle;

  @override
  void initState() {
    super.initState();

    _hasValue = value > 0.0;

    _indicatorLineColor = _getIndicatorLineColor;
    _indicatorLineBackgroundColor = _getIndicatorLineBackgroundColor;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (1200 * value).toInt()),
    );

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _valueTextStyle = Theme.of(context).textTheme.headline6.copyWith(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.bold,
        );
    _percentTextStyle = Theme.of(context).textTheme.bodyText2.copyWith(
          color: const Color(0xffbdbdbd),
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        );
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _animation = Tween<double>(
      begin: 0.0,
      end: value,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentValue = _animation.value;
        });
      });

    final valueText = !_hasValue ? 'NR' : '${(_currentValue * 100.0).toInt()}';

    final textRowChildren = <Widget>[
      if (_hasValue) Text(' ', style: _percentTextStyle),
      Text(valueText, style: _valueTextStyle),
      if (_hasValue) Text('%', style: _percentTextStyle),
    ];

    return CustomPaint(
      painter: _IndicatorPainter(
        value: _currentValue,
        widgetSize: widgetSize,
        indicatorLineColor: _indicatorLineColor,
        indicatorLineBackgroundColor: _indicatorLineBackgroundColor,
      ),
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: textRowChildren,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Color get _getIndicatorLineColor {
    if (value == 0.0) return const Color(0xff666666);
    if (value <= 0.3) return const Color(0xffdb2360);
    if (value < 0.7) return const Color(0xffd2d531);
    return const Color(0xff21d07a);
  }

  Color get _getIndicatorLineBackgroundColor {
    if (value == 0.0) return const Color(0xff9e9e9e);
    if (value <= 0.3) return const Color(0xff571435);
    if (value < 0.7) return const Color(0xff423d0f);
    return const Color(0xff204529);
  }
}

class _IndicatorPainter extends CustomPainter {
  const _IndicatorPainter({
    @required this.value,
    @required this.widgetSize,
    @required this.indicatorLineColor,
    @required this.indicatorLineBackgroundColor,
  })  : assert(value != null),
        assert(widgetSize != null);

  final double value;
  final double widgetSize;
  final Color indicatorLineColor;
  final Color indicatorLineBackgroundColor;

  static const _strokeWidth = 4.5;
  static const _circleMargin = 0.84;
  static const _arcStartAngle = -(math.pi / 2.0);
  static const _arcSweepAngle = math.pi * 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    final circleIndicatorSize = widgetSize * _circleMargin;
    // Radius of the indicator line.
    final circleIndicatorLineRadius = circleIndicatorSize / 2.0;
    // Radius of the background circle color of the widget.
    final backgroundCircleRadius = widgetSize / 2.0;
    // Position to start drawing the circle.
    final center = Offset(backgroundCircleRadius, backgroundCircleRadius);

    // drawing the background circle color of the widget.
    final backgroundCirclePaint = Paint()
      ..color = const Color(0xff081c22)
      ..style = PaintingStyle.fill
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(center, backgroundCircleRadius, backgroundCirclePaint);

    // draw the background color of the indicator line.
    final indicatorLineBackgroundPaint = Paint()
      ..color = indicatorLineBackgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(center, circleIndicatorLineRadius, indicatorLineBackgroundPaint);

    // draw the indicator line.
    final indicatorLinePaint = Paint()
      ..color = indicatorLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: circleIndicatorLineRadius),
      _arcStartAngle,
      _arcSweepAngle * value,
      false,
      indicatorLinePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
