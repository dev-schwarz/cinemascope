import 'package:flutter/material.dart';

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    Key key,
    @required this.label,
    this.padding = const EdgeInsets.all(16.0),
    this.value = false,
    this.onChanged,
  })  : assert(label != null),
        super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            const SizedBox(width: 24.0, height: 24.0),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
