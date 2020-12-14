library tmdb_core.pure;

import 'package:http/http.dart' as http;

import 'core.dart';

class _TmdbPure extends TmdbCore {
  _TmdbPure(String apiKey, String readAccessToken, {bool https = false})
      : super(apiKey, readAccessToken, https: https);

  @override
  Future<String> handleRequest(http.Request request) async {
    http.Response response = await http.Response.fromStream(await request.send());
    return await handleResponse(response);
  }
}

class TmdbPure {
  TmdbPure(String apiKey, String readAccessToken, {bool https = true})
      : _api = _TmdbPure(apiKey, readAccessToken, https: https);

  final _TmdbPure _api;

  CoreAccount get account => _api.account;

  CoreAccount4 get account4 => _api.account4;

  CoreAuthentication get authentication => _api.authentication;

  CoreAuth4 get auth4 => _api.auth4;

  CoreCompanies get companies => _api.companies;

  CoreConfiguration get configuration => _api.configuration;

  CoreDiscover get discover => _api.discover;

  CoreList4 get list4 => _api.list4;

  CoreMovies get movies => _api.movies;

  CoreTrending get trending => _api.trending;

  CorePeople get people => _api.people;

  CoreSearch get search => _api.search;

  CoreTv get tv => _api.tv;

  CoreTvSeason get tvSeason => _api.tvSeason;

  CoreTvEpisode get tvEpisode => _api.tvEpisode;
}
