library tmdb_objects.objects;

import 'package:tmdb_core/tmdb_core.dart' show TmdbPure;

import 'models/models.dart';

part 'apis/api_account.dart';
part 'apis/api_account4.dart';
part 'apis/api_auth4.dart';
part 'apis/api_authentication.dart';
part 'apis/api_configuration.dart';
part 'apis/api_discover.dart';
part 'apis/api_list4.dart';
part 'apis/api_movie.dart';
part 'apis/api_people.dart';
part 'apis/api_search.dart';
part 'apis/api_trending.dart';
part 'apis/api_tv.dart';
part 'apis/api_tv_episode.dart';
part 'apis/api_tv_season.dart';

class _TmdbObjectsBase extends TmdbPure {
  _TmdbObjectsBase(String apiKey, String readAccessToken, {bool https = false})
      : super(apiKey, readAccessToken, https: https) {
    _account = ApiAccount(this);
    _account4 = ApiAccount4(this);
    _auth4 = ApiAuth4(this);
    _authentication = ApiAuthentication(this);
    _configuration = ApiConfiguration(this);
    _discover = ApiDiscover(this);
    _list4 = ApiList4(this);
    _movie = ApiMovie(this);
    _people = ApiPeople(this);
    _search = ApiSearch(this);
    _trending = ApiTrending(this);
    _tv = ApiTv(this);
    _tvSeason = ApiTvSeason(this);
    _tvEpisode = ApiTvEpisode(this);
  }

  ApiAccount _account;

  ApiAccount4 _account4;

  ApiAuth4 _auth4;

  ApiAuthentication _authentication;

  ApiConfiguration _configuration;

  ApiDiscover _discover;

  ApiList4 _list4;

  ApiMovie _movie;

  ApiPeople _people;

  ApiSearch _search;

  ApiTrending _trending;

  ApiTv _tv;

  ApiTvEpisode _tvEpisode;

  ApiTvSeason _tvSeason;
}

class TmdbObjects {
  TmdbObjects(String apiKey, String readAccessToken, {bool https = false})
      : _api = _TmdbObjectsBase(apiKey, readAccessToken, https: https);

  final _TmdbObjectsBase _api;

  ApiAccount get account => _api._account;

  ApiAccount4 get account4 => _api._account4;

  ApiAuth4 get auth4 => _api._auth4;

  ApiAuthentication get authentication => _api._authentication;

  ApiConfiguration get configuration => _api._configuration;

  ApiDiscover get discover => _api._discover;

  ApiList4 get list4 => _api._list4;

  ApiMovie get movie => _api._movie;

  ApiPeople get people => _api._people;

  ApiSearch get search => _api._search;

  ApiTrending get trending => _api._trending;

  ApiTv get tv => _api._tv;

  ApiTvSeason get tvSeason => _api._tvSeason;

  ApiTvEpisode get tvEpisode => _api._tvEpisode;

  void loginAll(String sessionId, String accountId, String accessToken) {
    login3(sessionId);
    login4(accountId, accessToken);
  }

  void login3(String sessionId) {
    _api.authentication.setUserData(sessionId);
  }

  void login4(String accountId, String accessToken) {
    _api.auth4.setUserData(accountId, accessToken);
  }

  void logoutAll() {
    logout3();
    logout4();
  }

  void logout3() {
    _api.authentication.setUserData(null);
  }

  void logout4() {
    _api.auth4.setUserData(null, null);
  }
}
