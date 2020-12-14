import '../../../../material.dart';

class MediaButtonBar extends StatelessWidget {
  const MediaButtonBar({
    Key key,
    @required this.buttons,
  })  : assert(buttons != null),
        super(key: key);

  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.biggest.width / buttons.length;

        return Container(
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            children: buttons
                .map((button) => SizedBox(
                      width: width,
                      child: button,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
