import '../../../material.dart';

class DiscoverSetupContents extends StatelessWidget {
  const DiscoverSetupContents({
    Key key,
    @required this.title,
    @required this.onCancel,
    @required this.onApply,
    @required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final VoidCallback onCancel;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _makeChildren,
        ),
      ),
    );
  }

  List<Widget> get _makeChildren => children
      .map(
        (child) => Padding(
          padding: (child is DiscoverSetupFieldTitle) ? _fieldTitlePadding : _defaultPadding,
          child: child,
        ),
      )
      .toList();

  static const _kSetupDialogColor = Colors.white60;
  static const _fieldTitlePadding = const EdgeInsets.fromLTRB(7.0, 0.0, 4.0, 0.0);
  static const _defaultPadding = const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0);
}

class DiscoverSetupFieldTitle extends StatelessWidget {
  const DiscoverSetupFieldTitle({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, bottom: 4.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            '$title  ',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
