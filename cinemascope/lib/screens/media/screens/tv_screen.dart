import 'package:tmdb_objects/tmdb_objects.dart';

import '../../../components/helpers/tmdb_helper_mixin.dart';
import '../../../components/widgets/media_details/people_cards_grid.dart';
import '../../../global/constants.dart';
import '../../../material.dart';
import '../../../stores/media/media_store.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../components/button_bar/button_bar.dart';
import '../components/button_bar/buttons/buttons.dart';

class TvScreen extends StatefulWidget {
  const TvScreen(this.store, {Key key}) : super(key: key);

  final TvStore store;

  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> with MediaHelperMixin<Tv, TvScreen>, TmdbHelperMixin {
  /// The overview of the tv.
  Widget get _overview {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 0.0),
      child: IndentedText(
        mediaDetails.overview,
        textAlign: TextAlign.justify,
        style: context.theme.textTheme.bodyText1,
      ),
    );
  }

  /// An horizontal card grid with the cast of the tv show.
  Widget get _cast {
    return PeopleCardsGrid(
      data: mediaDetails.credits.cast,
      cardDataBuilder: (Cast cast) => PersonCardData(
        id: cast.id,
        name: cast.name,
        details: cast.character,
        profilePath: cast.profilePath,
      ),
    );
  }

  /// An horizontal card grid with the crew of the tv show.
  Widget get _crew {
    final crew = List<Crew>.from(mediaDetails.credits.crew)
      ..sort((a, b) {
        final valA = kAppPersonDepartmentOrder[a.department] ?? 0;
        final valB = kAppPersonDepartmentOrder[b.department] ?? 0;
        return valA >= valB ? -valA : valB;
      })
      ..toList();

    return PeopleCardsGrid(
      data: crew,
      cardDataBuilder: (Crew crew) => PersonCardData(
        id: crew.id,
        name: crew.name,
        details: crew.department,
        profilePath: crew.profilePath,
      ),
    );
  }

  /// An horizontal card grid with the creators of the tv show.
  Widget get _createdBy {
    return PeopleCardsGrid(
      data: mediaDetails.createdBy,
      cardDataBuilder: (TvCreatedBy createdBy) => PersonCardData(
        id: createdBy.id,
        name: createdBy.name,
        details: createdBy.gender.toString(),
        profilePath: createdBy.profilePath,
      ),
    );
  }

  Widget get _seasons {
    final Color iconColor = Colors.black.withOpacity(0.38);

    return CustomExpansionTile(
      contentPadding: const EdgeInsets.all(16.0),
      decoration: getCustomExpansionTileDecoration(context),
      title: 'Seasons',
      titleStyle: customExpansionTileTitleStyle,
      children: <Widget>[
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: mediaDetails.seasons.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4.0),
          itemBuilder: (context, index) {
            final season = mediaDetails.seasons[index];

            return InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed(
                //   AppRoutes.TV_SEASON_DETAILS,
                //   arguments: TvSeasonScreenArguments(
                //     tvSeasonStore: TvSeasonStore(
                //       tv: mediaDetails,
                //       seasonNumber: season.seasonNumber,
                //       dataStore: context.dtStore,
                //       // libraryStore: Provider.of<LibraryStore>(context, listen: false),
                //     ),
                //   ),
                // );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chevron_right, color: iconColor, size: 22.0),
                  Expanded(
                    child: Text(
                      '${season.seasonNumber.toString().padLeft(2, '0')} - ${season.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTheme.mediaDetailsTheme.linkTextStyle,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget get _recommendationsButton {
    return FlatButton(
      // TODO: Add localizations here!
      child: Text('Show recommendations based on this title'),
      textColor: Colors.blue,
      onPressed: () {
        // Navigator.of(context).pushNamed(
        //   AppRoutes.TV_RECOMMENDATIONS,
        //   arguments: RecommendationsScreenArguments(resumedMedia: resumedMedia),
        // );
      },
    );
  }

  // TODO: Distinct release date by region, like in MovieDetailsScreen!
  String get _releaseDate {
    return resumedMedia?.dateTime?.year.toString() ?? '';
  }

  @override
  List<Widget> buildContents() {
    final items = <Widget>[];

    items.addAll([
      trailingTopVoteAverage(mediaDetails.voteAverage),
      spacer(10.0),
      divider(8.0),
      makeButtonBar(),
      divider(8.0),
      _overview,
      spacer(),
      info('Status:', mediaDetails.status),
      spacer(13.0),
      info('In Production:', mediaDetails.inProduction ? 'Yes' : 'No'),
    ]);

    // [[ recommendations ]]
    items.add(
      _recommendationsButton,
    );

    // [[ created by ]]
    if (mediaDetails.createdBy != null && mediaDetails.createdBy.isNotEmpty) {
      items.addAll([
        divider(),
        sectionTitle('Created By'),
        _createdBy,
      ]);
    }

    if (mediaDetails.credits != null) {
      // [[ cast ]]
      if (mediaDetails.credits.cast != null && mediaDetails.credits.cast.isNotEmpty) {
        items.addAll([
          divider(),
          sectionTitle('Cast'),
          _cast,
        ]);
      }
      // [[ crew ]]
      if (mediaDetails.credits.crew != null && mediaDetails.credits.crew.isNotEmpty) {
        items.addAll([
          divider(),
          sectionTitle('Crew'),
          _crew,
        ]);
      }
    }

    // [[ seasons ]]
    if (mediaDetails.seasons != null && mediaDetails.seasons.isNotEmpty) {
      items.addAll([
        spacer(),
        _seasons,
      ]);
    }

    return items;
  }

  @override
  MediaButtonBar makeButtonBar() {
    return MediaButtonBar(
      buttons: [
        MediaFavoriteButton(mediaStore: mediaStore),
        MediaWatchListButton(mediaStore: mediaStore),
        MediaRatingButton(mediaStore: mediaStore),
      ],
    );
  }

  @override
  MediaSliverDelegate makeHeaderDelegate() {
    return MediaSliverDelegate(
      resumedMedia: resumedMedia,
      title: resumedMedia.name,
      contents: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _releaseDate,
              textAlign: TextAlign.end,
              style: context.appTheme.mediaDetailsTheme.headerBottomTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget makeTopLeadingWidget() {
    final style = context.theme.textTheme.subtitle2.copyWith(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('Seasons:', style: style),
            Text(mediaDetails.numberOfSeasons.toString(), style: style),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Text('Episodes:', style: style),
            Text(
              mediaDetails.numberOfEpisodes.toString(),
              style: style,
            ),
          ],
        ),
      ],
    );
  }

  @override
  MediaStore<Tv> get mediaStore => widget.store;
}
