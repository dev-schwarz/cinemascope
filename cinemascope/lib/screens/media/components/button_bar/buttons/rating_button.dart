part of 'buttons.dart';

class MediaRatingButton extends StatelessWidget {
  const MediaRatingButton({
    Key key,
    @required this.mediaStore,
    this.onChanged,
  })  : assert(mediaStore != null),
        super(key: key);

  final MediaStore mediaStore;
  final void Function(bool, double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final isRated =
            mediaStore.hasAccountStatesData ? mediaStore.accountStates.rated.isRated : false;
        final ratingValue =
            mediaStore.hasAccountStatesData ? mediaStore.accountStates.rated.value : 0.0;

        return _MediaButton(
          onTap: mediaStore.hasAccountStatesData
              ? () => _openRatingModalDialog(context, isRated, ratingValue)
              : null,
          iconData: Icons.star,
          label: 'Rate',
          tooltip: 'Rate',
          iconColor: isRated ? Colors.amber : null,
        );
      },
    );
  }

  void _openRatingModalDialog(BuildContext context, bool isRated, double ratingValue) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topRight: const Radius.circular(20.0),
          topLeft: const Radius.circular(20.0),
        ),
      ),
      builder: (_) {
        return _RatingDialog(
          isRated: isRated,
          rating: ratingValue,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onClear: () {
            Navigator.of(context).pop();
            mediaStore.setRating(0.0, true);
          },
          onRate: (value) {
            Navigator.of(context).pop();
            mediaStore.setRating(value, false);
          },
          onRateChanged: (value) {
            if (onChanged != null) {
              onChanged(false, value);
            }
          },
        );
      },
    );
  }
}

class _RatingDialog extends StatefulWidget {
  const _RatingDialog({
    Key key,
    this.isRated,
    this.rating,
    this.onCancel,
    this.onClear,
    this.onRateChanged,
    this.onRate,
  }) : super(key: key);

  final bool isRated;
  final double rating;
  final VoidCallback onCancel;
  final VoidCallback onClear;
  final void Function(double) onRateChanged;
  final void Function(double) onRate;

  @override
  __RatingDialogState createState() => __RatingDialogState();
}

class __RatingDialogState extends State<_RatingDialog> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.isRated ? widget.rating : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final ratingBar = _RatingBar(
      value: _normalizeRating(_value / 2.0),
      color: Colors.amber,
      borderColor: Colors.amber,
      size: 40.0,
      onChanged: (value) {
        final normalized = _normalizeRating(value * 2.0);
        setState(() {
          _value = normalized;
        });
        widget.onRateChanged(normalized);
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Rate',
              style: context.theme.textTheme.headline6,
            ),
          ),
          _divider,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ratingBar,
          ),
          _divider,
          ButtonBar(
            children: [
              FlatButton(
                child: Text('CANCEL'),
                textColor: Colors.grey,
                onPressed: widget.onCancel,
              ),
              FlatButton(
                child: Text('CLEAR'),
                textColor: Colors.redAccent[200],
                onPressed: widget.isRated ? widget.onClear : null,
              ),
              FlatButton(
                child: Text('RATE'),
                textColor: Colors.blueAccent[200],
                onPressed: _canRate ? () => widget.onRate(_value) : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _divider => const Divider(color: Colors.white, thickness: 0.5);

  bool get _canRate => _value > 0.0 && (widget.rating != _value);

  static double _normalizeRating(double rating) {
    double k = rating - rating.floor();
    if (k != 0) {
      // has decimal
      if (k >= 0.3 && k <= 0.7) {
        rating = rating.floor() + 0.5;
      } else {
        rating = rating.floor() + 1.0;
      }
    }
    return rating;
  }
}

class _RatingBar extends StatefulWidget {
  const _RatingBar({
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
  __RatingBarState createState() => __RatingBarState();
}

class __RatingBarState extends State<_RatingBar> {
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
