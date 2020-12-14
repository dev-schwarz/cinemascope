part of '../tmdb_repository.dart';

class AccountService {
  AccountService(TmdbObjects api)
      : _apiAccount = api.account,
        _apiAccount4 = api.account4;

  final ApiAccount _apiAccount;
  final ApiAccount4 _apiAccount4;

  Future<AccountDetails> getDetails() async {
    return await _apiAccount.getDetails();
  }

  Future<MovieRecommendations> getMovieRecommendations({
    MovieRecommendationsSortBy sortBy,
  }) async {
    return await _performMovieRecommendations(sortBy: sortBy);
  }

  Future<MovieRecommendations> getMovieRecommendationsNextPage(
    MovieRecommendations recommendations, {
    MovieRecommendationsSortBy sortBy,
  }) async {
    return recommendations.mergeResults(
      await _performMovieRecommendations(
        page: recommendations.page + 1,
        sortBy: sortBy,
      ),
    );
  }

  Future<TvRecommendations> getTvRecommendations({
    TvRecommendationsSortBy sortBy,
  }) async {
    return await _performTvRecommendations(sortBy: sortBy);
  }

  Future<TvRecommendations> getTvRecommendationsNextPage(
    TvRecommendations recommendations, {
    TvRecommendationsSortBy sortBy,
  }) async {
    return recommendations.mergeResults(
      await _performTvRecommendations(
        page: recommendations.page + 1,
        sortBy: sortBy,
      ),
    );
  }

  Future<MovieRecommendations> _performMovieRecommendations(
      {int page = 1, MovieRecommendationsSortBy sortBy}) async {
    return await _apiAccount4.getMovieRecommendations(
      page: page,
      language: TmdbConfig.language.language,
      sortBy: sortBy,
    );
  }

  Future<TvRecommendations> _performTvRecommendations(
      {int page = 1, TvRecommendationsSortBy sortBy}) async {
    return await _apiAccount4.getTvRecommendations(
      page: page,
      language: TmdbConfig.language.language,
      sortBy: sortBy,
    );
  }

  Future<AccountMarkAsFavorite> changeFavorite(
      int mediaId, TMediaType mediaType, bool toFavorite) async {
    return await _apiAccount.markAsFavorite(
      mediaId.toString(),
      mediaType.toString(),
      toFavorite,
    );
  }

  Future<AccountAddToWatchlist> changeWatchList(
      int mediaId, TMediaType mediaType, bool toWatchList) async {
    return await _apiAccount.addToWatchlist(
      mediaId.toString(),
      mediaType.toString(),
      toWatchList,
    );
  }

  Future<Account4Lists> getLists() async {
    Account4Lists result = Account4Lists();
    do {
      result = result.mergeResults(
        await _apiAccount4.getLists(
          page: (result.page ?? 0) + 1,
          language: TmdbConfig.language.language,
        ),
      );
    } while (result.hasNextPage);
    return result;
  }
}
