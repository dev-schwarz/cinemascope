part of '../core.dart';

class CoreAccount {
  static const _startPoint = 'account';

  CoreAccount(this._core);

  final TmdbCore _core;

  Future<Map> getDetails() {
    _Params params = _Params.withSession('');
    return _core._query3(
      _startPoint,
      https: true,
      params: params,
    );
  }

  /// Get the list of movies you have marked as a favorite.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  Future<Map> getFavoriteMovies({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /favorite/movies',
      https: true,
      params: params,
    );
  }

  /// Get the list of TV shows you have marked as a favorite.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  Future<Map> getFavoriteTvs({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /favorite/tv',
      https: true,
      params: params,
    );
  }

  Future<Map> getWatchListMovies({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /watchlist/movies',
      https: true,
      params: params,
    );
  }

  Future<Map> getWatchListTvs({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /watchlist/tv',
      https: true,
      params: params,
    );
  }

  Future<Map> getRatedMovies({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /rated/movies',
      https: true,
      params: params,
    );
  }

  Future<Map> getRatedTvs({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /rated/tv',
      https: true,
      params: params,
    );
  }

  Future<Map> getRatedTvEpisodes({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query3(
      '$_startPoint/ /rated/tv/episodes',
      https: true,
      params: params,
    );
  }

  Future<Map> markAsFavorite(String mediaId, String mediaType, bool favorite) {
    _checkNotNull(mediaId, 'media_id');
    _checkNotNull(mediaType, 'media_type');
    _checkNotNull(favorite, 'favorite');
    _Params params = _Params.withSession('');
    params['media_id'] = mediaId;
    params['media_type'] = mediaType;
    params['favorite'] = favorite;
    return _core._query3(
      '$_startPoint/ /favorite',
      method: _QueryMethod.POST,
      https: true,
      params: params,
    );
  }

  Future<Map> addToWatchlist(String mediaId, String mediaType, bool watchlist) {
    _checkNotNull(mediaId, 'media_id');
    _checkNotNull(mediaType, 'media_type');
    _checkNotNull(watchlist, 'watchlist');
    _Params params = _Params.withSession('');
    params['media_id'] = mediaId;
    params['media_type'] = mediaType;
    params['watchlist'] = watchlist;
    return _core._query3(
      '$_startPoint/ /watchlist',
      method: _QueryMethod.POST,
      https: true,
      params: params,
    );
  }
}
