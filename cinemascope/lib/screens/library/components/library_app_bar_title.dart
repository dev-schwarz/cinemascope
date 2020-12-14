import '../../../material.dart';

class LibraryAppBarTitle extends StatelessWidget {
  const LibraryAppBarTitle({
    Key key,
    this.title,
    this.listSize,
  }) : super(key: key);

  final String title;
  final int listSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        if (listSize > 0)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$listSize',
                style: context.theme.textTheme.subtitle1.copyWith(
                  color: Colors.white.withAlpha(200),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0, top: 2.0),
                child: Text(
                  'ITEMS',
                  style: context.theme.textTheme.subtitle1.copyWith(
                    color: Colors.white70,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
