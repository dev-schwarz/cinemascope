import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../global/constants.dart';
import '../../../material.dart';
import '../components/library_app_bar_title.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({Key key}) : super(key: key);

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
              title: 'Favorite Movies',
              listSize:
                  favoritesStore.hasFavoriteMovies ? favoritesStore.favoriteMovies.totalResults : 0,
            );
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              final sortOrder = favoritesStore.favoriteMoviesSortBy.orderString;

              return IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 20.0,
                  color: Colors.yellowAccent,
                ),
                visualDensity: VisualDensity.compact,
                tooltip: 'Switch to "$sortOrder" order',
                onPressed: favoritesStore.toggleFavoriteMoviesSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !favoritesStore.hasFavoriteMovies
              ? BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsListView<AccountFavoriteMovies>(
                  content: favoritesStore.favoriteMovies,
                );
        },
      ),
    );
  }
}
