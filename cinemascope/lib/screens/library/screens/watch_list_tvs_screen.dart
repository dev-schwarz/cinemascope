import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../global/constants.dart';
import '../../../material.dart';
import '../components/library_app_bar_title.dart';

class WatchListTvsScreen extends StatelessWidget {
  const WatchListTvsScreen({Key key}) : super(key: key);

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
              title: 'Tvs to watch',
              listSize:
                  watchListsStore.hasWatchListTvs ? watchListsStore.watchListTvs.totalResults : 0,
            );
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              final sortOrder = watchListsStore.watchListTvsSortBy.orderString;

              return IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 20.0,
                  color: Colors.yellowAccent,
                ),
                visualDensity: VisualDensity.compact,
                tooltip: 'Switch to "$sortOrder" order',
                onPressed: watchListsStore.toggleWatchListTvsSortBy,
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !watchListsStore.hasWatchListTvs
              ? BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsListView<AccountWatchListTvs>(
                  content: watchListsStore.watchListTvs,
                );
        },
      ),
    );
  }
}
