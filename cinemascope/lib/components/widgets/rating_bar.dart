import 'dart:async';

import 'package:flutter/material.dart';

typedef void RatingBarChanged(double);

class RatingBar extends StatefulWidget {
  const RatingBar({
    Key key,
    this.value = 0.0,
    this.starCount = 5,
    this.isReadOnly = false,
    this.size = 25.0,
    this.spacing = 0.0,
    this.allowHalfRating = true,
    this.defaultIconData = Icons.star_border,
    this.halfIconData = Icons.star_half,
    this.filledIconData = Icons.star,
    this.color,
    this.borderColor,
    this.onChanged,
  })  : assert(value != null),
        assert(starCount != null),
        assert(isReadOnly != null),
        assert(size != null),
        assert(spacing != null),
        assert(allowHalfRating != null),
        assert(defaultIconData != null),
        assert(halfIconData != null),
        assert(filledIconData != null),
        super(key: key);

  final double value;
  final int starCount;
  final bool isReadOnly;
  final double size;
  final double spacing;
  final bool allowHalfRating;
  final IconData defaultIconData;
  final IconData halfIconData;
  final IconData filledIconData;
  final Color color;
  final Color borderColor;
  final RatingBarChanged onChanged;

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  // half star value starts from this number
  static const double _halfStarThreshold = 0.53;

  // tracks for user tapping on this widget
  bool isWidgetTapped = false;
  double currentRating;
  Timer debounceTimer;

  @override
  void initState() {
    super.initState();
    currentRating = widget.value;
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    debounceTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: widget.spacing,
        children: List<Widget>.generate(widget.starCount, (index) => _buildStar(index)),
      ),
    );
  }

  Widget _buildStar(int index) {
    final Color primaryColor = Theme.of(context).primaryColor;

    Icon icon;

    if (index >= currentRating) {
      icon = Icon(
        widget.defaultIconData,
        color: widget.borderColor ?? primaryColor,
        size: widget.size,
      );
    } else if (index > (currentRating - (widget.allowHalfRating ? _halfStarThreshold : 1.0)) &&
        index < currentRating) {
      icon = Icon(
        widget.halfIconData,
        color: widget.borderColor ?? primaryColor,
        size: widget.size,
      );
    } else {
      icon = Icon(
        widget.filledIconData,
        color: widget.borderColor ?? primaryColor,
        size: widget.size,
      );
    }

    final Widget star = widget.isReadOnly
        ? icon
        : GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onHorizontalDragUpdate: _onHorizontalDragUpdate,
            child: icon,
          );

    return star;
  }

  void _onTapDown(TapDownDetails details) {
    final RenderBox box = context.findRenderObject();
    final Offset pos = box.globalToLocal(details.globalPosition);
    final double i = ((pos.dx - widget.spacing) / widget.size);
    double newRating = widget.allowHalfRating ? i : i.round().toDouble();

    if (newRating > widget.starCount) {
      newRating = widget.starCount.toDouble();
    }
    if (newRating < 0.0) {
      newRating = 0.0;
    }

    newRating = _normalizeRating(newRating);

    setState(() {
      currentRating = newRating;
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onChanged != null) widget.onChanged(currentRating);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final RenderBox box = context.findRenderObject();
    final Offset pos = box.globalToLocal(details.globalPosition);
    final double i = pos.dx / widget.size;
    double newRating = widget.allowHalfRating ? i : i.round().toDouble();

    if (newRating > widget.starCount) {
      newRating = widget.starCount.toDouble();
    }
    if (newRating < 0.0) {
      newRating = 0.0;
    }

    setState(() {
      currentRating = newRating;
    });

    debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 100), () {
      if (widget.onChanged != null) {
        currentRating = _normalizeRating(newRating);
        widget.onChanged(currentRating);
      }
    });
  }

  double _normalizeRating(double newRating) {
    double k = newRating - newRating.floor();
    if (k != 0) {
      // half stars
      if (k >= _halfStarThreshold) {
        newRating = newRating.floor() + 1.0;
      } else {
        newRating = newRating.floor() + 0.5;
      }
      // newRating = newRating.floor() + (k >= _halfStarThreshold ? 1.0 : 0.5);
    }
    return newRating;
  }
}
