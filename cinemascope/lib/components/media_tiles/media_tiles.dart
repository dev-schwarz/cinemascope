import 'package:tmdb_objects/tmdb_objects.dart';

import '../../global/constants.dart';
import '../../material.dart';
import '../../repositories/tmdb/tmdb_repository.dart';
import '../../stores/media/media_store.dart';
import '../helpers/tmdb_helper_mixin.dart';

part 'movie_tile.dart';
part 'person_tile.dart';
part 'tv_tile.dart';

abstract class _MediaTileBase extends StatelessWidget with TmdbHelperMixin {
  const _MediaTileBase({
    Key key,
    @required this.resumedMedia,
  })  : assert(resumedMedia != null),
        super(key: key);

  final TmdbResumedMedia resumedMedia;

  static const _mediaDescriptionMaxLines = 6;

  @override
  Widget build(BuildContext context) {
    final mediaTypeIcon = getMediaTypeIcon(resumedMedia.mediaType);

    final bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          resumedMedia?.dateTime?.year?.toString() ?? '',
          style: context.appTheme.mediaTileTheme.bottomTextStyle,
        ),
        const SizedBox(width: 16.0),
      ],
    );

    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // title
        _MediaTileTitle(
          title: resumedMedia.name,
          iconData: mediaTypeIcon,
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: IndentedText(
            resumedMedia.description,
            textAlign: TextAlign.justify,
            maxLines: _mediaDescriptionMaxLines,
            overflow: TextOverflow.ellipsis,
            style: context.appTheme.mediaTileTheme.descriptionTextStyle,
          ),
        ),
        bottomRow,
        const SizedBox(height: 6.0),
      ],
    );

    return Container(
      // height: 180.0,
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          onTap: () => navigateToMediaDetails(context),
          child: Row(
            children: <Widget>[
              Expanded(
                child: leftColumn,
              ),
              const SizedBox(width: 18.0),
              _MediaTilePoster(
                imageUrl: resumedMedia.imageUrl,
                alternativeIcon: mediaTypeIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateToMediaDetails(BuildContext context);
}

class _MediaTilePoster extends StatelessWidget {
  const _MediaTilePoster({
    Key key,
    @required this.imageUrl,
    this.alternativeIcon = Icons.play_arrow,
  }) : super(key: key);

  final String imageUrl;
  final IconData alternativeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: AspectRatio(
        aspectRatio: kAppTmdbPosterAspectRatio,
        child: Container(
          decoration: BoxDecoration(
            color: context.appTheme.mediaTileTheme.posterBackgroundColor,
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child:
              imageUrl == null ? Icon(alternativeIcon, size: kAppAlternativeMediaIconSize) : null,
        ),
      ),
    );
  }
}

class _MediaTileTitle extends StatelessWidget {
  const _MediaTileTitle({
    Key key,
    @required this.title,
    @required this.iconData,
  })  : assert(title != null),
        assert(iconData != null),
        super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 18.0,
          color: context.appTheme.mediaTileTheme.mediaIconColor,
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTheme.mediaTileTheme.titleTextStyle,
          ),
        ),
      ],
    );
  }
}
