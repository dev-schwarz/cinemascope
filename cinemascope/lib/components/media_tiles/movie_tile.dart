part of 'media_tiles.dart';

class MovieTile extends _MediaTileBase {
  MovieTile(this.movieResumed, {Key key})
      : super(
          key: key,
          resumedMedia: TmdbResumedMedia(
            id: movieResumed.id,
            name: movieResumed.title,
            description: movieResumed.overview,
            dateTime: movieResumed.releaseDate,
            imageUrl: TmdbConfig.makePosterUrl(movieResumed.posterPath),
            mediaType: movieResumed.mediaType,
          ),
        );

  final MovieResumed movieResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MOVIE_DETAILS,
      arguments: MovieScreenArguments(
        movieStore: MovieStore(
          id: resumedMedia.id,
          dataStore: context.dataStore,
        ),
      ),
    );
  }
}
