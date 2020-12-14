part of 'media_tiles.dart';

class PersonTile extends _MediaTileBase {
  PersonTile(this.personResumed, {Key key})
      : super(
          key: key,
          resumedMedia: TmdbResumedMedia(
            id: personResumed.id,
            name: personResumed.name,
            description: personResumed.gender.toString(),
            imageUrl: TmdbConfig.makeProfileUrl(personResumed.profilePath),
            mediaType: personResumed.mediaType,
          ),
        );

  final PersonResumed personResumed;

  @override
  navigateToMediaDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.PERSON_DETAILS,
      arguments: PersonScreenArguments(
        personStore: PersonStore(
          id: resumedMedia.id,
          dataStore: context.dataStore,
        ),
      ),
    );
  }
}
