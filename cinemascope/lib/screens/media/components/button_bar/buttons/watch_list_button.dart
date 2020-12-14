part of 'buttons.dart';

class MediaWatchListButton extends StatelessWidget {
  const MediaWatchListButton({
    Key key,
    @required this.mediaStore,
    this.onChanged,
  })  : assert(mediaStore != null),
        super(key: key);

  final MediaStore mediaStore;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final onWatchList =
            mediaStore.hasAccountStatesData ? mediaStore.accountStates.watchList : false;

        return _MediaButton(
          onTap:
              mediaStore.hasAccountStatesData ? () => mediaStore.setWatchList(!onWatchList) : null,
          iconData: Icons.watch_later,
          label: 'Watch List',
          tooltip: 'Watch List',
          iconColor: onWatchList ? Colors.indigo[300] : null,
        );
      },
    );
  }
}
