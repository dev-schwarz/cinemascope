// import 'package:flutter/material.dart';
// import 'package:tmdb_objects/tmdb_objects.dart';

// import '../../helpers/media_tile_maker_mixin.dart';
// import '../indicators/loading_next_page_indicator.dart';

// class ResultsGridView<T extends TResultsObject> extends StatelessWidget with MediaTileMakerMixin {
//   const ResultsGridView({
//     Key key,
//     @required this.content,
//     this.loadNextPage,
//     this.handleRefresh,
//     this.scrollController,
//   })  : assert(content != null),
//         super(key: key);

//   final TResultsObject content;
//   final Future Function() loadNextPage;
//   final Future Function() handleRefresh;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     final gridView = GridView.builder(
//       primary: false,
//       shrinkWrap: false,
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: content.results.length + (content.hasNextPage ? 1 : 0),
//       gridDelegate: null,
//       itemBuilder: (context, index) {
//         if (index < content.results.length) {
//           return makeMediaTile(context, content.results[index]);
//         } else {
//           if (loadNextPage != null) {
//             loadNextPage();
//           }
//           return LoadingNextPageIndicator();
//         }
//       },
//     );

//     return handleRefresh != null
//         ? RefreshIndicator(child: gridView, onRefresh: handleRefresh)
//         : gridView;
//   }
// }
