part of '../objects.dart';

class ApiAccount4 {
  ApiAccount4(this._api);

  final _TmdbObjectsBase _api;

  Future<Account4Lists> getLists({int page, String language}) async {
    Map json = await _api.account4.getLists(
      page: page,
      language: language,
    );
    return Account4Lists.fromJson(json);
  }

  Future<Account4FavoriteMovies> getFavoriteMovies({
    int page,
    String language,
    Account4MovieSortBy sortBy,
  }) async {
    Map json = await _api.account4.getFavoriteMovies(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return Account4FavoriteMovies.fromJson(json);
  }

  Future<Account4FavoriteTvs> getFavoriteTvs({
    int page,
    String language,
    Account4TvSortBy sortBy,
  }) async {
    Map json = await _api.account4.getFavoriteTvs(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return Account4FavoriteTvs.fromJson(json);
  }

  Future<Account4WatchListMovies> getWatchListMovies({
    int page,
    String language,
    Account4MovieSortBy sortBy,
  }) async {
    Map json = await _api.account4.getMovieWatchList(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return Account4WatchListMovies.fromJson(json);
  }

  Future<Account4WatchListTvs> getWatchListTvs({
    int page,
    String language,
    Account4TvSortBy sortBy,
  }) async {
    Map json = await _api.account4.getTvWatchList(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return Account4WatchListTvs.fromJson(json);
  }

  Future<MovieRecommendations> getMovieRecommendations({
    int page,
    String language,
    MovieRecommendationsSortBy sortBy,
  }) async {
    Map json = await _api.account4.getMovieRecommendations(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return MovieRecommendations.fromJson(json);
  }

  Future<TvRecommendations> getTvRecommendations({
    int page,
    String language,
    TvRecommendationsSortBy sortBy,
  }) async {
    Map json = await _api.account4.getTvRecommendations(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return TvRecommendations.fromJson(json);
  }
}
