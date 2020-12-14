part of '../core.dart';

class CoreTrending {
  static const _startPoint = 'trending';

  CoreTrending(this._core);

  final TmdbCore _core;

  /// Get the daily or weekly trending items.
  ///
  /// The daily trending list tracks items over the period of a day while
  /// items have a 24 hour half life.
  ///
  /// The weekly list tracks items over a 7 day period, with a 7 day half
  /// life.
  ///
  /// ----
  /// ***[mediaType] allowed values:***
  /// - all
  /// - movie
  /// - tv
  /// - person
  ///
  /// ***[timeWindow] allowed values:***
  /// - day
  /// - week
  Future<Map> getTrending(String mediaType, String timeWindow, {int page, String language}) {
    _checkNotNull(mediaType, 'media_type');
    _checkNotNull(timeWindow, 'time_window');
    _Params params = _Params();
    params['media_type'] = mediaType;
    params['time_window'] = timeWindow;
    params['page'] = page;
    params['language'] = language;
    return _core._query3('$_startPoint/$mediaType/$timeWindow', params: params);
  }
}
