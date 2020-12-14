part of '../objects.dart';

class ApiSearch {
  ApiSearch(this._api);

  final _TmdbObjectsBase _api;

  /// Search for companies.
  Future<SearchCompanies> searchCompanies(String query, {int page}) async {
    Map json = await _api.search.searchCompany(query, page: page);
    return SearchCompanies.fromJson(json);
  }

  /// Search multiple models in a single request.
  ///
  /// Multi search currently supports searching for movies, tv shows and
  /// people in a single request.
  Future<SearchMulti> multiSearch(
    String query, {
    int page,
    String language,
    String region,
    bool includeAdult,
  }) async {
    Map json = await _api.search.multiSearch(
      query,
      page: page,
      language: language,
      region: region,
      includeAdult: includeAdult,
    );
    return SearchMulti.fromJson(json);
  }
}
