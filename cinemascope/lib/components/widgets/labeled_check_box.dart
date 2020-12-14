import 'package:flutter/material.dart';

class LabeledCheckBox extends StatelessWidget {
  const LabeledCheckBox({
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
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                checkColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
