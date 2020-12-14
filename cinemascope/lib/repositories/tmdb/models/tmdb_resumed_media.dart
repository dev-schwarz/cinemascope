part of '../tmdb_repository.dart';

class TmdbResumedMedia {
  final int id;
  final String name;
  final String description;
  final DateTime dateTime;
  final String imageUrl;
  final TMediaType mediaType;

  TmdbResumedMedia({
    this.id,
    this.name,
    this.description,
    this.dateTime,
    this.imageUrl,
    this.mediaType,
  });

  factory TmdbResumedMedia.fromResumedMedia(ResumedMedia resumedMedia) {
    if (resumedMedia is MovieResumed) {
      return TmdbResumedMedia(
        id: resumedMedia.id,
        name: resumedMedia.title,
        description: resumedMedia.overview,
        dateTime: resumedMedia.releaseDate,
        imageUrl: resumedMedia.backdropPath,
        mediaType: resumedMedia.mediaType,
      );
    } else if (resumedMedia is TvResumed) {
      return TmdbResumedMedia(
        id: resumedMedia.id,
        name: resumedMedia.name,
        description: resumedMedia.overview,
        dateTime: resumedMedia.firstAirDate,
        imageUrl: resumedMedia.backdropPath,
        mediaType: resumedMedia.mediaType,
      );
    } else if (resumedMedia is PersonResumed) {
      return TmdbResumedMedia(
        id: resumedMedia.id,
        name: resumedMedia.name,
        description: resumedMedia.gender.toString(),
        dateTime: null,
        imageUrl: resumedMedia.profilePath,
        mediaType: resumedMedia.mediaType,
      );
    } else {
      return null;
    }
  }
}
