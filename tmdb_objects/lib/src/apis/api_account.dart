part of '../objects.dart';

class ApiAccount {
  ApiAccount(this._api);

  final _TmdbObjectsBase _api;

  Future<AccountDetails> getDetails() async {
    Map json = await _api.account.getDetails();
    return AccountDetails.fromJson(json);
  }

  Future<AccountFavoriteMovies> getFavoriteMovies({
    int page,
    String language,
    FavoriteMoviesSortBy sortBy,
  }) async {
    Map json = await _api.account.getFavoriteMovies(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountFavoriteMovies.fromJson(json);
  }

  Future<AccountFavoriteTvs> getFavoriteTvs({
    int page,
    String language,
    FavoriteTvsSortBy sortBy,
  }) async {
    Map json = await _api.account.getFavoriteTvs(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountFavoriteTvs.fromJson(json);
  }

  Future<AccountWatchListMovies> getWatchListMovies({
    int page,
    String language,
    WatchListMoviesSortBy sortBy,
  }) async {
    Map json = await _api.account.getWatchListMovies(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountWatchListMovies.fromJson(json);
  }

  Future<AccountWatchListTvs> getWatchListTvs({
    int page,
    String language,
    WatchListTvsSortBy sortBy,
  }) async {
    Map json = await _api.account.getWatchListTvs(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountWatchListTvs.fromJson(json);
  }

  Future<AccountRatedMovies> getRatedMovies({
    int page,
    String language,
    FavoriteMoviesSortBy sortBy,
  }) async {
    Map json = await _api.account.getRatedMovies(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountRatedMovies.fromJson(json);
  }

  Future<AccountRatedTvs> getRatedTvs({
    int page,
    String language,
    FavoriteTvsSortBy sortBy,
  }) async {
    Map json = await _api.account.getRatedTvs(
      page: page,
      language: language,
      sortBy: sortBy?.toString(),
    );
    return AccountRatedTvs.fromJson(json);
  }

  Future<AccountMarkAsFavorite> markAsFavorite(
      String mediaId, String mediaType, bool favorite) async {
    Map json = await _api.account.markAsFavorite(mediaId, mediaType, favorite);
    return AccountMarkAsFavorite.fromJson(json);
  }

  Future<AccountAddToWatchlist> addToWatchlist(
      String mediaId, String mediaType, bool watchlist) async {
    Map json = await _api.account.addToWatchlist(mediaId, mediaType, watchlist);
    return AccountAddToWatchlist.fromJson(json);
  }
}
