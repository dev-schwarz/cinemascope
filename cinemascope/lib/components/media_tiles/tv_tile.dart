part of 'media_tiles.dart';

class TvTile extends _MediaTileBase {
  TvTile(this.tvResumed, {Key key})
      : super(
          key: key,
          resumedMedia: TmdbResumedMedia(
            id: tvResumed.id,
            name: tvResumed.name,
            description: tvResumed.overview,
            dateTime: tvResumed.firstAirDate,
            imageUrl: TmdbConfig.makePosterUrl(tvResumed.posterPath),
            mediaType: tvResumed.mediaType,
          ),
        );

  final TvResumed tvResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.TV_DETAILS,
      arguments: TvScreenArguments(
        tvStore: TvStore(
          id: resumedMedia.id,
          dataStore: context.dataStore,
        ),
      ),
    );
  }
}
