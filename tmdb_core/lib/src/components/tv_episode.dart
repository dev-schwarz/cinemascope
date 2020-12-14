part of '../core.dart';

class CoreTvEpisode {
  static const _startPoint = 'tv';

  CoreTvEpisode(this._core);

  final TmdbCore _core;

  /// Get the TV episode details by id.
  Future<Map> getDetails(
    int tvId,
    int seasonNumber,
    int episodeNumber, {
    String language,
    List<String> append,
    List<String> includeImageLanguages,
  }) {
    _checkNotNull(tvId, 'tv_id');
    _checkNotNull(seasonNumber, 'season_number');
    _checkNotNull(episodeNumber, 'episode_number');

    if ((includeImageLanguages?.isNotEmpty ?? false) &&
        (append == null || !append.contains('images'))) {
      append = <String>[if (append != null) ...append, 'images'];
    }

    _Params params = _Params();
    params['language'] = language;
    params['append_to_response'] = append;
    params['include_image_language'] = includeImageLanguages;
    return _core._query3(
      '$_startPoint/$tvId/season/$seasonNumber/episode/$episodeNumber',
      params: params,
    );
  }
}
