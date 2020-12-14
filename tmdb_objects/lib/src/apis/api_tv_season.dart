part of '../objects.dart';

class ApiTvSeason {
  ApiTvSeason(this._api);

  final _TmdbObjectsBase _api;

  /// Get the TV season details by id.
  Future<TvSeason> getDetails(
    int tvId,
    int seasonNumber, {
    String language,
    List<String> imageLanguages,
  }) async {
    Map json = await _api.tvSeason.getDetails(
      tvId,
      seasonNumber,
      language: language,
      append: ['credits', 'videos', 'images'],
      includeImageLanguages: imageLanguages,
    );
    return TvSeason.fromJson(json);
  }
}
