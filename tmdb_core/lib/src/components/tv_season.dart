part of '../core.dart';

class CoreTvSeason {
  static const _startPoint = 'tv';

  CoreTvSeason(this._core);

  final TmdbCore _core;

  /// Get the TV season details by id.
  Future<Map> getDetails(
    int tvId,
    int seasonNumber, {
    String language,
    List<String> append,
    List<String> includeImageLanguages,
  }) {
    _checkNotNull(tvId, 'tv_id');
    _checkNotNull(seasonNumber, 'season_number');

    if ((includeImageLanguages?.isNotEmpty ?? false) &&
        (append == null || !append.contains('images'))) {
      append = <String>[if (append != null) ...append, 'images'];
    }

    _Params params = _Params();
    params['language'] = language;
    params['append_to_response'] = append;
    params['include_image_language'] = includeImageLanguages;
    return _core._query3(
      '$_startPoint/$tvId/season/$seasonNumber',
      params: params,
    );
  }
}
