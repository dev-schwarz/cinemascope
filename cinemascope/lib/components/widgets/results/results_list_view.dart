import 'package:flutter/material.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../helpers/media_tile_maker_mixin.dart';
import '../indicators/loading_next_page_indicator.dart';

class ResultsListView<T extends TResultsObject> extends StatelessWidget with MediaTileMakerMixin {
  const ResultsListView({
    Key key,
    @required this.content,
    this.loadNextPage,
    this.handleRefresh,
    this.scrollController,
  })  : assert(content != null),
        super(key: key);

  final TResultsObject content;
  final Future Function() loadNextPage;
  final Future Function() handleRefresh;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final listView = ListView.builder(
      primary: false,
      shrinkWrap: false,
      cacheExtent: 200.0,
      physics: const AlwaysScrollableScrollPhysics(),
      // physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.zero,
      itemExtent: 180.0,
      itemCount: content.results.length + (content.hasNextPage ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < content.results.length) {
          return makeMediaTile(context, content.results[index]);
        } else {
          if (loadNextPage != null) {
            loadNextPage();
          }
          return LoadingNextPageIndicator();
        }
      },
    );

    return handleRefresh != null
        ? RefreshIndicator(child: listView, onRefresh: handleRefresh)
        : listView;
  }
}
