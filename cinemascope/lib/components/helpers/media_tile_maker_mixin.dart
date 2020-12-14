import 'package:flutter/material.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

import '../media_tiles/media_tiles.dart';

mixin MediaTileMakerMixin {
  Widget makeMediaTile(BuildContext context, ResumedMedia resumedMedia) {
    if (resumedMedia is MovieResumed) {
      return MovieTile(resumedMedia);
    } else if (resumedMedia is TvResumed) {
      return TvTile(resumedMedia);
    } else if (resumedMedia is PersonResumed) {
      return PersonTile(resumedMedia);
    }

    return Container(
      height: 100.0,
      child: Text(
        'Unknown media type',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
