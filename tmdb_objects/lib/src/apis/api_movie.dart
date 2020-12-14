part of '../objects.dart';

class ApiMovie {
  ApiMovie(this._api);

  final _TmdbObjectsBase _api;

  /// Get the primary information about a movie.
  Future<Movie> getDetails(int id, {String language, List<String> imageLanguages}) async {
    Map json = await _api.movies.getDetails(
      id,
      language: language,
      append: ['credits', 'videos', 'release_dates', 'images'],
      includeImageLanguages: imageLanguages,
    );
    return Movie.fromJson(json);
  }

  /// Get the following account states of a movie.
  Future<TAccountStates> getAccountStates(int id, {String language}) async {
    Map json = await _api.movies.getAccountStates(id, language: language);
    return TAccountStates.fromJson(json);
  }

  /// Get the cast and crew for a movie.
  Future<MovieCredits> getCredits(int id) async {
    Map json = await _api.movies.getCredits(id);
    return MovieCredits.fromJson(json);
  }

  /// Get a list of recommended movies for a movie.
  Future<MovieRecommendations> getRecommendations(int id, {int page, String language}) async {
    Map json = await _api.movies.getRecommendations(
      id,
      page: page,
      language: language,
    );
    return MovieRecommendations.fromJson(json);
  }

  /// Rate a movie.
  ///
  /// A valid session or guest session ID is required.
  ///
  /// The [value] of rate to submit is expected to be between
  /// 0.5 and 10.0, and must be a multiple of 0.50.
  Future<RateMovie> rateMovie(int id, double value) async {
    Map json = await _api.movies.rateMovie(id, value);
    return RateMovie.fromJson(json);
  }

  /// Remove your rating for a movie.
  ///
  /// A valid session or guest session ID is required.
  Future<DeleteMovieRating> deleteMovieRating(int id) async {
    Map json = await _api.movies.deleteRating(id);
    return DeleteMovieRating.fromJson(json);
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  Future<PopularMovies> getPopular({int page, String language, String region}) async {
    Map json = await _api.movies.getPopular(
      page: page,
      language: language,
      region: region,
    );
    return PopularMovies.fromJson(json);
  }

  /// Get the top rated movies on TMDb.
  Future<TopRatedMovies> getTopRated({int page, String language, String region}) async {
    Map json = await _api.movies.getTopRated(
      page: page,
      language: language,
      region: region,
    );
    return TopRatedMovies.fromJson(json);
  }
}
