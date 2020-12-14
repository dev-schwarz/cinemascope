import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../components/helpers/tmdb_helper_mixin.dart';
import '../../../global/utils.dart';
import '../../../material.dart';
import '../../../repositories/tmdb/tmdb_repository.dart';
import '../../../stores/media/media_store.dart';
import '../components/button_bar/button_bar.dart';
import '../components/popularity_indicator.dart';
import '../components/vote_average_indicator.dart';
import 'media_sliver_delegate.dart';

mixin MediaHelperMixin<T, E extends StatefulWidget> on State<E> implements TmdbHelperMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  T get mediaDetails => mediaStore.mediaDetails;

  TmdbResumedMedia get resumedMedia => mediaStore.resumedMedia;

  TAccountStates get accountStates => mediaStore.accountStates;

  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();

    _disposers = [
      reaction(
        (_) => mediaStore.mediaAction,
        (MediaItemAction action) {
          if (action is MediaItemActionFavorite) {
            _sendToSnackBar(
              action.favorite ? 'Added to favorites' : 'Removed from favorites',
            );
          } else if (action is MediaItemActionWatchList) {
            _sendToSnackBar(
              action.watchList ? 'Added to watch list' : 'Removed from watch list',
            );
          } else if (action is MediaItemActionRate) {
            _sendToSnackBar(
              action.rated ? 'Item rated' : 'Item rating removed',
            );
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (mediaStore.isFetchingData) {
          return BigLoadingIndicator(
            iconData: getMediaTypeIcon(mediaStore.mediaType),
            title: 'Loading',
            message: 'Loading',
          );
        }

        return SafeArea(
          child: Material(
            child: Scaffold(
              key: _scaffoldKey,
              body: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: makeHeaderDelegate(),
                    pinned: true,
                    floating: true,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(_filteredWidgets),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _sendToSnackBar(String text, {TextAlign textAlign, TextStyle textStyle}) {
    _scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          text,
          textAlign: textAlign ?? TextAlign.center,
          style: textStyle ?? context.theme.textTheme.subtitle1,
        ),
      ));
  }

  List<Widget> get _filteredWidgets => buildContents()..removeWhere((e) => e is! Widget);

  Widget spacer([double height]) => SizedBox(height: height ?? _spacerHeight);

  Widget divider([double height, double thickness = 1.0]) =>
      Divider(height: height ?? _dividerHeight, thickness: thickness);

  Widget info(String label, String text, {int maxLines, String errorText}) {
    if ((text == null || text.isEmpty) && errorText == null) return null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.subtitle1,
          ),
        ),
        Expanded(
          child: Text(
            text ?? errorText,
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
            style: context.theme.textTheme.subtitle1.copyWith(
              color: context.theme.textTheme.bodyText2.color,
              fontStyle: text == null ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget infoWidget(String label, Iterable<String> texts,
      {String separator, int maxLines, String errorText}) {
    // TODO: Implement errorText!
    if ((texts == null || texts.isEmpty) && errorText == null) return null;

    final separatorStyle = context.theme.textTheme.subtitle1.copyWith(
      color: context.theme.textTheme.bodyText2.color,
      fontStyle: FontStyle.normal,
    );
    final textStyle = separatorStyle.copyWith(
      color: const Color(0xff2196f3).withOpacity(separatorStyle.color.opacity),
      decoration: TextDecoration.underline,
    );

    final children = separator != null
        ? ListUtils.intersperse(separator, texts)
            .map((e) => TextSpan(
                text: e,
                style: e == separator
                    ? separatorStyle
                    : textStyle.copyWith(
                        // color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )))
            .toList()
        : texts.map((e) => TextSpan(text: e)).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.subtitle1,
          ),
        ),
        Expanded(
          child: RichText(
            maxLines: maxLines,
            text: TextSpan(
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 6.0),
      child: Text(
        title,
        style: context.theme.textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget trailingTopVoteAverage(double voteAverage) => VoteAverageIndicator(
        value: voteAverage != null ? (voteAverage / 10.0) : 0.0,
        leading: makeTopLeadingWidget(),
      );

  Widget trailingTopPopularityIndicator(PopularitySentiment sentiment) => PopularityIndicator(
        sentiment: sentiment,
        trailing: makeTopLeadingWidget(),
      );

  Widget trailingTopEmpty() => Container(
        height: 70.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: makeTopLeadingWidget(),
      );

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    // for (final d in _disposers) {
    //   d();
    // }
    super.dispose();
  }

  List<Widget> buildContents();

  MediaStore<T> get mediaStore;

  MediaButtonBar makeButtonBar();

  MediaSliverDelegate makeHeaderDelegate();

  Widget makeTopLeadingWidget();

  static const _spacerHeight = 26.0;
  static const _dividerHeight = _spacerHeight * 1.4;
}
