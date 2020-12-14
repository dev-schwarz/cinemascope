import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../components/app_drawer/app_drawer.dart';
import '../../material.dart';
import '../../stores/results/results_store.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen(this.store, {Key key}) : super(key: key);

  final TrendingStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: const AppDrawerLeadingButton(),
        title: Text('Trending'),
        actions: [
          const AppBarSearchButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return BigLoadingIndicator(
              iconData: Icons.trending_up,
              title: 'Loading',
              message: 'Trending',
            );
          } else if (store.isLoaded) {
            return ResultsListView<Trending>(
              content: store.results,
              handleRefresh: store.fetchResults,
              loadNextPage: store.fetchResultsNextPage,
            );
          }

          return Container();
        },
      ),
    );
  }
}
