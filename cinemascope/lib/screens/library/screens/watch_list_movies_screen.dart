import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../global/constants.dart';
import '../../../material.dart';
import '../components/library_app_bar_title.dart';

class WatchListMoviesScreen extends StatelessWidget {
  const WatchListMoviesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchListsStore = context.dataStore.watchListsStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: kAppAppBarTitleSpacing,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: 'Movies to watch',
              listSize: watchListsStore.hasWatchListMovies
                  ? watchListsStore.watchListMovies.totalResults
                  : 0,
            );
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              final sortOrder = watchListsStore.watchListMoviesSortBy.orderString;

              return IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 20.0,
                  color: Colors.yellowAccent,
                ),
                visualDensity: VisualDensity.compact,
                tooltip: 'Switch to "$sortOrder" order',
                onPressed: watchListsStore.toggleWatchListMoviesSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !watchListsStore.hasWatchListMovies
              ? BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsListView<AccountWatchListMovies>(
                  content: watchListsStore.watchListMovies,
                );
        },
      ),
    );
  }
}
