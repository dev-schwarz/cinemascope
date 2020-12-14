part of '../core.dart';

class CoreAccount4 {
  static const _startPoint = 'account';

  CoreAccount4(this._core);

  final TmdbCore _core;

  /// Get all of the lists you've created.
  Future<Map> getLists({int page, String language}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    return _core._query4(
      'lists',
      accessTokenType: _AccessTokenType.user,
      params: params,
    );
  }

  /// Get the list of movies you have marked as a favorite.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getFavoriteMovies({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('movie/favorites', params: params);
  }

  /// Get the list of TV shows you have marked as a favorite.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - first_air_date.asc
  /// - first_air_date.desc
  /// - name.asc
  /// - name.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getFavoriteTvs({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('tv/favorites', params: params);
  }

  /// Get a list of your personal movie recommendations.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getMovieRecommendations({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('movie/recommendations', params: params);
  }

  /// Get a list of your personal TV show recommendations.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - first_air_date.asc
  /// - first_air_date.desc
  /// - name.asc
  /// - name.desc
  /// - vote_average.asc
  /// - vote_average.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  Future<Map> getTvRecommendations({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('tv/recommendations', params: params);
  }

  /// Get the list of movies you have added to your watchlist.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getMovieWatchList({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('movie/watchlist', params: params);
  }

  /// Get the list of TV shows you have added to your watchlist.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - first_air_date.asc
  /// - first_air_date.desc
  /// - name.asc
  /// - name.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getTvWatchList({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('tv/watchlist', params: params);
  }

  /// Get the list of movies you have rated.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - created_at.asc
  /// - created_at.desc
  /// - release_date.asc
  /// - release_date.desc
  /// - title.asc
  /// - title.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getRatedMovies({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('movie/rated', params: params);
  }

  /// Get the list of TV shows you have rated.
  ///
  /// ----
  /// ***[sortBy] allowed values:***
  /// - first_air_date.asc
  /// - first_air_date.desc
  /// - name.asc
  /// - name.desc
  /// - vote_average.asc
  /// - vote_average.desc
  Future<Map> getRatedTvs({int page, String language, String sortBy}) {
    _Params params = _Params.withSession('$_startPoint/${_core.auth4.accountId}');
    params['page'] = page;
    params['language'] = language;
    params['sort_by'] = sortBy;
    return _core._query4('tv/rated', params: params);
  }
}
