library tmdb_core.core;

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

part 'components/account.dart';
part 'components/account4.dart';
part 'components/auth4.dart';
part 'components/authentication.dart';
part 'components/companies.dart';
part 'components/configuration.dart';
part 'components/discover.dart';
part 'components/list4.dart';
part 'components/movies.dart';
part 'components/people.dart';
part 'components/search.dart';
part 'components/trending.dart';
part 'components/tv.dart';
part 'components/tv_episode.dart';
part 'components/tv_season.dart';
part 'params.dart';
part 'query_method.dart';
part 'utils.dart';

abstract class TmdbCore {
  TmdbCore(
    this._apiKey,
    this._readAccessToken, {
    bool https = false,
  }) : this._apiUriHttps = https {
    _account = CoreAccount(this);
    _account4 = CoreAccount4(this);
    _authentication = CoreAuthentication(this);
    _auth4 = CoreAuth4(this);
    _companies = CoreCompanies(this);
    _configuration = CoreConfiguration(this);
    _discover = CoreDiscover(this);
    _list4 = CoreList4(this);
    _movies = CoreMovies(this);
    _trending = CoreTrending(this);
    _people = CorePeople(this);
    _search = CoreSearch(this);
    _tv = CoreTv(this);
    _tvSeason = CoreTvSeason(this);
    _tvEpisode = CoreTvEpisode(this);
  }

  final String _apiKey;
  final String _readAccessToken;
  final bool _apiUriHttps;

  static const _apiUriHost = 'api.themoviedb.org';

  CoreAccount get account => _account;
  CoreAccount _account;

  CoreAccount4 get account4 => _account4;
  CoreAccount4 _account4;

  CoreAuthentication get authentication => _authentication;
  CoreAuthentication _authentication;

  CoreAuth4 get auth4 => _auth4;
  CoreAuth4 _auth4;

  CoreCompanies get companies => _companies;
  CoreCompanies _companies;

  CoreConfiguration get configuration => _configuration;
  CoreConfiguration _configuration;

  CoreDiscover get discover => _discover;
  CoreDiscover _discover;

  CoreList4 get list4 => _list4;
  CoreList4 _list4;

  CoreMovies get movies => _movies;
  CoreMovies _movies;

  CoreTrending get trending => _trending;
  CoreTrending _trending;

  CorePeople get people => _people;
  CorePeople _people;

  CoreSearch get search => _search;
  CoreSearch _search;

  CoreTv get tv => _tv;
  CoreTv _tv;

  CoreTvSeason get tvSeason => _tvSeason;
  CoreTvSeason _tvSeason;

  CoreTvEpisode get tvEpisode => _tvEpisode;
  CoreTvEpisode _tvEpisode;

  Future<Map<String, dynamic>> _query3(
    String endPoint, {
    _QueryMethod method = _QueryMethod.GET,
    bool https = false,
    _Params params,
  }) async {
    String query = 'api_key=$_apiKey';

    if (params != null && params.needsSession) {
      if (_authentication?.sessionId != null) {
        query += '&session_id=${_authentication.sessionId}';
      } else {
        throw StateError('Can\'t use this method without having a session ID.');
      }
    }

    if ((params != null && params.isNotEmpty) &&
        [_QueryMethod.GET, _QueryMethod.HEAD, _QueryMethod.DELETE].contains(method)) {
      query += '&${params.toString()}';
    }

    Uri uri = Uri(
      scheme: _apiUriHttps || https ? 'https' : 'http',
      host: _apiUriHost,
      path: '3/$endPoint',
      query: query,
    );

    http.Request request = http.Request(method.toString(), uri);
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json;charset=utf-8';

    if ((params != null && params.isNotEmpty) &&
        [_QueryMethod.POST, _QueryMethod.PUT, _QueryMethod.DELETE].contains(method)) {
      request.body = params?.toJson();
    }

    try {
      String response = await handleRequest(request);
      final jsonDecoded = jsonDecode(response);
      return (jsonDecoded is! Map) ? <String, dynamic>{'results': jsonDecoded} : jsonDecoded;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> _query4(
    String endPoint, {
    _QueryMethod method = _QueryMethod.GET,
    _AccessTokenType accessTokenType = _AccessTokenType.user,
    bool https = true,
    _Params params,
  }) async {
    String path = '4';
    String query = '';

    if (params != null && params.needsSession) {
      if (_auth4?.accountId != null) {
        path += '/${params.sessionFragment}';
      } else {
        throw StateError('Can\'t use this method without having an account ID.');
      }
    }

    if (endPoint != null && endPoint.isNotEmpty) {
      path += '/$endPoint';
    }

    if ((params != null && params.isNotEmpty) &&
        [_QueryMethod.GET, _QueryMethod.HEAD, _QueryMethod.DELETE].contains(method)) {
      query += params.toString();
    }

    Uri uri = Uri(
      scheme: _apiUriHttps ?? https ? 'https' : 'http',
      host: _apiUriHost,
      path: path,
      query: query,
    );

    http.Request request = http.Request(method.toString(), uri);
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json;charset=utf-8';
    request.headers['Authorization'] = 'Bearer '
        '${accessTokenType == _AccessTokenType.user ? _auth4.accessToken : _readAccessToken}';

    if ((params != null && params.isNotEmpty) &&
        [_QueryMethod.POST, _QueryMethod.PUT, _QueryMethod.DELETE].contains(method)) {
      request.body = params?.toJson();
    }

    try {
      String response = await handleRequest(request);
      return jsonDecode(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> handleRequest(http.Request request);

  Future<String> handleResponse(http.Response response) async {
    if (response.statusCode == 429) {
      int retryAfter = response.headers.containsKey('retry-after')
          ? int.parse(response.headers['retry-after'])
          : 10;
      final Duration delay = Duration(milliseconds: 500 + 1000 * retryAfter);
      http.Request oldRequest = response.request as http.Request;
      http.Request request = http.Request(oldRequest.method, oldRequest.url);
      request.headers.addAll(oldRequest.headers);
      request.body = oldRequest.body;
      return await Future.delayed(delay, () => handleRequest(request));
    } else {
      return response.body;
    }
  }
}
