import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../global/constants.dart';
import '../../../material.dart';
import '../components/library_app_bar_title.dart';

class FavoriteTvsScreen extends StatelessWidget {
  const FavoriteTvsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesStore = context.dataStore.favoritesStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: kAppAppBarTitleSpacing,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: 'Favorite Tvs',
              listSize: favoritesStore.hasFavoriteTvs ? favoritesStore.favoriteTvs.totalResults : 0,
            );
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              final sortOrder = favoritesStore.favoriteTvsSortBy.orderString;

              return IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 20.0,
                  color: Colors.yellowAccent,
                ),
                visualDensity: VisualDensity.compact,
                tooltip: 'Switch to "$sortOrder" order',
                onPressed: favoritesStore.toggleFavoriteTvsSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !favoritesStore.hasFavoriteTvs
              ? BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsListView<AccountFavoriteTvs>(
                  content: favoritesStore.favoriteTvs,
                );
        },
      ),
    );
  }
}
