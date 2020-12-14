import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../global/utils.dart';
import '../../../material.dart';

class LibrarySectionButtons extends StatelessWidget {
  const LibrarySectionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final buttonWidth =
            (constraints.biggest.width / 2.0) - ((2 - 1) * _buttonHorizontalSpacer.width);

        return Column(
          mainAxisAlignment:
              _centerScreenContent ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: _makeButtons(context, buttonWidth),
        );
      },
    );
  }

  List<Widget> _makeButtons(BuildContext context, double buttonWidth) {
    final favoritesStore = context.dataStore.favoritesStore;
    final watchListsStore = context.dataStore.watchListsStore;
    final iconColor = context.appTheme.bigButtonTheme.iconColor;

    final favoriteMovies = Observer(
      builder: (_) {
        return _LibrarySectionButton(
          iconData: Icons.favorite,
          iconColor: iconColor,
          label: 'Favorite Movies',
          hintText: favoritesStore.hasFavoriteMovies
              ? favoritesStore.favoriteMovies.totalResults.toString()
              : '',
          width: buttonWidth,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.LIBRARY_FAVORITE_MOVIES);
          },
        );
      },
    );

    final favoriteTvs = Observer(
      builder: (_) {
        return _LibrarySectionButton(
          iconData: Icons.favorite,
          iconColor: iconColor,
          label: 'Favorite Tvs',
          hintText: favoritesStore.hasFavoriteTvs
              ? favoritesStore.favoriteTvs.totalResults.toString()
              : '',
          width: buttonWidth,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.LIBRARY_FAVORITE_TVS);
          },
        );
      },
    );

    final watchListMovies = Observer(
      builder: (_) {
        return _LibrarySectionButton(
          iconData: Icons.watch_later,
          iconColor: iconColor,
          label: 'Movies to watch',
          hintText: watchListsStore.hasWatchListMovies
              ? watchListsStore.watchListMovies.totalResults.toString()
              : '',
          width: buttonWidth,
          onTap: () {},
        );
      },
    );

    final watchListTvs = Observer(
      builder: (_) {
        return _LibrarySectionButton(
          iconData: Icons.watch_later,
          iconColor: iconColor,
          label: 'Tvs to watch',
          hintText: watchListsStore.hasWatchListTvs
              ? watchListsStore.watchListTvs.totalResults.toString()
              : '',
          width: buttonWidth,
          onTap: () {},
        );
      },
    );

    final favoriteButtons = ListUtils.intersperse(
      _buttonHorizontalSpacer,
      [favoriteMovies, favoriteTvs],
    ).toList();

    final watchListButtons = ListUtils.intersperse(
      _buttonHorizontalSpacer,
      [watchListMovies, watchListTvs],
    ).toList();

    final buttons = ListUtils.intersperse(
      _buttonVerticalSpacer,
      [favoriteButtons, watchListButtons].map((buttonsRow) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttonsRow,
        );
      }).toList(),
    ).toList();

    return buttons;
  }

  static const _buttonHorizontalSpacer = const SizedBox(width: 4.0);
  static const _buttonVerticalSpacer = const SizedBox(height: 16.0);
  static const _centerScreenContent = false;
}

class _LibrarySectionButton extends StatelessWidget {
  const _LibrarySectionButton({
    Key key,
    @required this.onTap,
    @required this.iconData,
    @required this.label,
    @required this.width,
    this.iconColor,
    this.hintText,
  })  : assert(iconData != null),
        assert(label != null),
        assert(width != null),
        super(key: key);

  final VoidCallback onTap;
  final IconData iconData;
  final String label;
  final double width;
  final Color iconColor;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final textColor = context.appTheme.bigButtonTheme.textColor;

    return Container(
      width: width,
      height: width / 1.5,
      child: RaisedButton(
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
        ),
        onPressed: onTap,
        elevation: 3.0,
        color: context.appTheme.bigButtonTheme.backgroundColor,
        textColor: textColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: width / 6.0,
                  color: iconColor,
                ),
                const SizedBox(height: 10.0),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: hintText != null ? _makeCircularWidget(context, textColor) : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeCircularWidget(BuildContext context, Color textColor) {
    return CircleAvatar(
      backgroundColor: context.appTheme.bigButtonTheme.hintBackgroundColor,
      radius: 14.0,
      child: Text(
        hintText,
        style: context.appTheme.bigButtonTheme.hintTextStyle,
      ),
    );
  }
}
