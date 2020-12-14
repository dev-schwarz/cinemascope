part of '../objects.dart';

class ApiTv {
  ApiTv(this._api);

  final _TmdbObjectsBase _api;

  /// Get the primary tv show details by id.
  Future<Tv> getDetails(int id, {String language, List<String> imageLanguages}) async {
    Map json = await _api.tv.getDetails(
      id,
      language: language,
      append: ['credits', 'videos', 'images'],
      includeImageLanguages: imageLanguages,
    );
    return Tv.fromJson(json);
  }

  /// Get the following account states of a tv show.
  Future<TAccountStates> getAccountStates(int id, {String language}) async {
    Map json = await _api.tv.getAccountStates(id, language: language);
    return TAccountStates.fromJson(json);
  }

  /// Get a list of recommended tv shows for a tv show.
  Future<TvRecommendations> getRecommendations(int id, {int page, String language}) async {
    Map json = await _api.tv.getRecommendations(
      id,
      page: page,
      language: language,
    );
    return TvRecommendations.fromJson(json);
  }

  /// Rate a tv show.
  ///
  /// A valid session or guest session ID is required.
  ///
  /// The [value] of rate to submit is expected to be between
  /// 0.5 and 10.0, and must be a multiple of 0.50.
  Future<RateTv> rateTv(int id, double value) async {
    Map json = await _api.tv.rateTv(id, value);
    return RateTv.fromJson(json);
  }

  /// Remove your rating for a tv show.
  ///
  /// A valid session or guest session ID is required.
  Future<DeleteTvRating> deleteTvRating(int id) async {
    Map json = await _api.tv.deleteRating(id);
    return DeleteTvRating.fromJson(json);
  }

  /// Get a list of the current popular tv shows on TMDb.
  /// This list updates daily.
  Future<PopularTvs> getPopular({int page, String language, String region}) async {
    Map json = await _api.tv.getPopular(
      page: page,
      language: language,
      region: region,
    );
    return PopularTvs.fromJson(json);
  }

  /// Get the top rated tv shows on TMDb.
  Future<TopRatedTvs> getTopRated({int page, String language, String region}) async {
    Map json = await _api.tv.getTopRated(
      page: page,
      language: language,
      region: region,
    );
    return TopRatedTvs.fromJson(json);
  }
}
