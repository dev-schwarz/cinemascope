part of 'buttons.dart';

class MediaFavoriteButton extends StatelessWidget {
  const MediaFavoriteButton({
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
        final isFavorite =
            mediaStore.hasAccountStatesData ? mediaStore.accountStates.favorite : false;

        return _MediaButton(
          onTap: mediaStore.hasAccountStatesData ? () => mediaStore.setFavorite(!isFavorite) : null,
          iconData: isFavorite ? Icons.favorite : Icons.favorite_border,
          label: 'Favorite',
          tooltip: 'Favorite',
          iconColor: isFavorite ? const Color(0xffd50000) : null,
        );
      },
    );
  }
}
