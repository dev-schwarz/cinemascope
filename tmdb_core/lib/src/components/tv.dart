part of '../core.dart';

class CoreTv {
  static const _startPoint = 'tv';

  CoreTv(this._core);

  final TmdbCore _core;

  /// Get the primary TV show details by id.
  Future<Map> getDetails(
    int id, {
    String language,
    List<String> append,
    List<String> includeImageLanguages,
  }) {
    _checkNotNull(id, 'id');

    if ((includeImageLanguages?.isNotEmpty ?? false) &&
        (append == null || !append.contains('images'))) {
      append = <String>[if (append != null) ...append, 'images'];
    }

    _Params params = _Params();
    params['language'] = language;
    params['append_to_response'] = append;
    params['include_image_language'] = includeImageLanguages;
    return _core._query3('$_startPoint/$id', params: params);
  }

  /// Get the following account states for a session.
  /// - Tv rating.
  /// - If it belongs to your watchlist.
  /// - if it belongs to your favorite list.
  Future<Map> getAccountStates(int id, {String language}) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('');
    params['language'] = language;
    return _core._query3(
      '$_startPoint/$id/account_states',
      params: params,
    );
  }

  /// Get the list of TV show recommendations for this item.
  Future<Map> getRecommendations(int id, {String language, int page}) {
    _checkNotNull(id, 'id');
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    return _core._query3('$_startPoint/$id/recommendations', params: params);
  }

  /// Rate a tv show.
  ///
  /// A valid session or guest session ID is required.
  ///
  /// The [value] of rate to submit is expected to be between
  /// 0.5 and 10.0, and must be a multiple of 0.50.
  Future<Map> rateTv(int id, double value) {
    _checkNotNull(id, 'id');
    _checkNotNull(value, 'value');
    _Params params = _Params.withSession('');
    params['value'] = value;
    return _core._query3(
      '$_startPoint/$id/rating',
      params: params,
      method: _QueryMethod.POST,
    );
  }

  /// Remove your rating for a tv show.
  ///
  /// A valid session or guest session ID is required.
  Future<Map> deleteRating(int id) {
    _checkNotNull(id, 'id');
    _Params params = _Params.withSession('');
    return _core._query3(
      '$_startPoint/$id/rating',
      params: params,
      method: _QueryMethod.DELETE,
    );
  }

  /// Get a list of the current popular tv shows on TMDb.
  /// This list updates daily.
  Future<Map> getPopular({String language, int page, String region}) {
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    params['region'] = region;
    return _core._query3('$_startPoint/popular', params: params);
  }

  /// Get the top rated tv shows on TMDb.
  Future<Map> getTopRated({String language, int page, String region}) {
    _Params params = _Params();
    params['language'] = language;
    params['page'] = page;
    params['region'] = region;
    return _core._query3('$_startPoint/top_rated', params: params);
  }
}
