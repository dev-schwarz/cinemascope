part of '../objects.dart';

class ApiTvEpisode {
  ApiTvEpisode(this._api);

  final _TmdbObjectsBase _api;

  /// Get the TV episode details by id.
  Future<TvEpisode> getDetails(
    int tvId,
    int seasonNumber,
    int episodeNumber, {
    String language,
    List<String> imageLanguages,
  }) async {
    Map json = await _api.tvEpisode.getDetails(
      tvId,
      seasonNumber,
      episodeNumber,
      language: language,
      append: ['credits', 'videos', 'images'],
      includeImageLanguages: imageLanguages,
    );
    return TvEpisode.fromJson(json);
  }
}
