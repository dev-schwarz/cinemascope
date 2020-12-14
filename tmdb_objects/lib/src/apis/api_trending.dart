part of '../objects.dart';

class ApiTrending {
  ApiTrending(this._api);

  final _TmdbObjectsBase _api;

  /// Get the daily or weekly trending items.
  ///
  /// The daily trending list tracks items over the period of a day while
  /// items have a 24 hour half life.
  ///
  /// The weekly list tracks items over a 7 day period, with a 7 day half
  /// life.
  Future<Trending> getTrending(
    TTrendingMediaType mediaType,
    TTrendingTimeWindow timeWindow, {
    int page,
    String language,
  }) async {
    Map json = await _api.trending.getTrending(
      mediaType.toString(),
      timeWindow.toString(),
      page: page,
      language: language,
    );
    return Trending.fromJson(json);
  }
}
