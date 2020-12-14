import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_core/tmdb_core.dart';

void main() async {
  final jsonApiKey = await _loadJsonFromAsset('api_data.json');

  TmdbPure api = TmdbPure(
    jsonApiKey['api_data']['api_key'],
    jsonApiKey['api_data']['read_access_token'],
  );

  // await _login(api, 'schwarz.junior');
  await _login(api, 'schwarz.junior');

  group('AUTHENTICATION v3', () {
    test('AUTHENTICATION v3 -> create session from v4', () async {
      Map r = await api.authentication.createSessionFromV4(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2Mjk4NTcsInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1MTUiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.zwGRTKRnVhvQLpPz0MMzQBVxZ3qsdcMDatdRTj1iA7U');
      print(r);
    });
  });

  group('AUTHENTICATION v4', () {
    test('AUTHENTICATION v4 -> create request token', () async {
      Map r = await api.auth4.createRequestToken();
      print(r);
      // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2Mjk3MTgsInNjb3BlcyI6WyJwZW5kaW5nX3JlcXVlc3RfdG9rZW4iXSwiZXhwIjoxNjA0NjMwNjE4LCJqdGkiOjI1MzI1MTUsImF1ZCI6ImZmZWE0Y2ExMDk5YzZmOTQ1Y2ZlOTEyZTA4MDU2YmUyIiwicmVkaXJlY3RfdG8iOm51bGwsInZlcnNpb24iOjF9.YzR1AaS8hg98sJpYE-SvGstGkQZ-09Dh5s25v8kOKwU
    });

    test('AUTHENTICATION v4 -> create access token', () async {
      Map r = await api.auth4.createAccessToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2Mjk3MTgsInNjb3BlcyI6WyJwZW5kaW5nX3JlcXVlc3RfdG9rZW4iXSwiZXhwIjoxNjA0NjMwNjE4LCJqdGkiOjI1MzI1MTUsImF1ZCI6ImZmZWE0Y2ExMDk5YzZmOTQ1Y2ZlOTEyZTA4MDU2YmUyIiwicmVkaXJlY3RfdG8iOm51bGwsInZlcnNpb24iOjF9.YzR1AaS8hg98sJpYE-SvGstGkQZ-09Dh5s25v8kOKwU');
      print(r);
      // Access token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2Mjk4NTcsInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1MTUiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.zwGRTKRnVhvQLpPz0MMzQBVxZ3qsdcMDatdRTj1iA7U
      // Account id: 5eb4bb017ac8290022228128
    });
  });

  group('ACCOUNT v3', () {
    test('ACCOUNT v3 -> get account details', () async {
      Map r = await api.account.getDetails();
      print(r);
    });

    test('ACCOUNT v3 -> get favorite movies', () async {
      Map r = await api.account.getFavoriteMovies();
      print(r);
    });

    test('ACCOUNT v3 -> get favorite tv shows', () async {
      Map r = await api.account.getFavoriteTvs();
      print(r);
    });

    test('ACCOUNT v3 -> get account movie watchlist', () async {
      Map r = await api.account.getWatchListMovies(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v3 -> get account tv watchlist', () async {
      Map r = await api.account.getWatchListTvs(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v3 -> get account rated movies', () async {
      Map r = await api.account.getRatedMovies(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v3 -> get account rated tv shows', () async {
      Map r = await api.account.getRatedTvs(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v3 -> get account rated tv show episodes', () async {
      Map r = await api.account.getRatedTvEpisodes(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v3 -> account mark as favorite', () async {
//      Map r = await api.account.markAsFavorite('114', 'movie', true);
      Map r = await api.account.markAsFavorite('85853', 'tv', false);
      print(r);
//      Map r2 = await api.account.getFavoriteTvs();
//      print(r2);
    });

    test('ACCOUNT v3 -> account add to watchlist', () async {
      Map r = await api.account.addToWatchlist('744', 'movie', true);
//      Map r = await api.account.addToWatchlist('1668', 'tv', false);
      print(r);
    });
  });

  group('ACCOUNT v4', () {
    test('ACCOUNT v4 -> -get account lists', () async {
      Map r = await api.account4.getLists(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v4 -> -get account favorite movies', () async {
      Map r = await api.account4.getFavoriteMovies(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v4 -> -get account favorite tvs', () async {
      Map r = await api.account4.getFavoriteTvs(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v4 -> -get account movie recommendations', () async {
      Map r = await api.account4.getMovieRecommendations(
        language: pt_BR,
        // sortBy: 'title.asc',
      );
      print(r);
    });

    test('ACCOUNT v4 -> -get account tv recommendations', () async {
      Map r = await api.account4.getTvRecommendations();
      print(r);
    });

    test('ACCOUNT v4 -> -get account movie watchlist', () async {
      Map r = await api.account4.getMovieWatchList(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v4 -> -get account tv watchlist', () async {
      Map r = await api.account4.getTvWatchList(language: pt_BR);
      print(r);
    });

    test('ACCOUNT v4 -> -get account rated movies', () async {
      Map r = await api.account4.getRatedMovies();
      print(r);
    });

    test('ACCOUNT v4 -> -get account rated tvs', () async {
      Map r = await api.account4.getRatedTvs(language: pt_BR);
      print(r);
    });
  });

  group('COMPANIES', () {
    test('COMPANIES -> get details', () async {
      Map r = await api.companies.getDetails(4);
      print(r);
    });

    test('COMPANIES -> get alternative names', () async {
      Map r = await api.companies.getAlternativeNames(4);
      print(r);
    });

    test('COMPANIES -> get images', () async {
      Map r = await api.companies.getImages(4);
      print(r);
    });
  });

  group('CONFIGURATION', () {
    test('CONFIGURATION -> get countries', () async {
      Map r = await api.configuration.getCountries();
      print(r);
    });

    test('CONFIGURATION -> get languages', () async {
      Map r = await api.configuration.getLanguages();
      print(r);
    });
  });

  group('DISCOVER', () {
    test('DISCOVER -> get discover movies', () async {
      Map r = await api.discover.movieDiscover(
        primaryReleaseDateGte: '2014-09-15',
        primaryReleaseDateLte: '2014-10-22',
        sortBy: 'popularity.desc',
      );
      print(r);
    });

    test('DISCOVER -> get discover tvs', () async {
      Map r = await api.discover.tvDiscover();
      print(r);
    });
  });

  group('LIST v4', () {
    test('LIST v4 -> get list', () async {
      Map r = await api.list4.getList(144724);
      print(r);
    });

    test('LIST v4 -> create list', () async {
      Map r = await api.list4.createList('Minha lista de testes nova', 'pt',
          description: 'Lista de testes da api', iso_3166_1: 'BR', public: false);
      print(r);
    });

    test('LIST v4 -> update list', () async {
      // 145091
      // 145094
      Map r = await api.list4.updateList(
        145094,
//        name: 'Minha lista de testes nova',
        description: 'Minha lista de testes nova (updated)',
        public: true,
      );
      print(r);
    });

    test('LIST v4 -> clear list', () async {
      Map r = await api.list4.clearList(145094);
      print(r);
    });

    test('LIST v4 -> delete list', () async {
      Map r = await api.list4.deleteList(145094);
      print(r);
    });

    test('LIST v4 -> add items to list', () async {
      Map r = await api.list4.addItems(145091, <Map>[
//        {'media_type': 'movie', 'media_id': 473033},
//        {'media_type': 'movie', 'media_id': 122917},
        {'media_type': 'tv', 'media_id': 67198},
      ]);
      print(r);
    });

    test('LIST v4 -> update list items', () async {
      Map r = await api.list4.updateItems(145091, <Map>[
        {
          'media_type': 'movie',
          'media_id': 473033,
          'comment': 'Incrível atuação de Adam Sandler',
        },
        {
          'media_type': 'tv',
          'media_id': 67198,
          'comment': 'Adoro esta série!!!',
        },
      ]);
      print(r);
    });

    test('LIST v4 -> remove items from a list', () async {
      Map r = await api.list4.removeItems(145091, <Map>[
        {'media_type': 'movie', 'media_id': 122917},
        {'media_type': 'tv', 'media_id': 67198},
      ]);
      print(r);
    });

    test('LIST v4 -> check item status from a list', () async {
      // listId: 7054482 (Comedy)
      // mediaId: 1824 (50 First Dates)
      Map r = await api.list4.checkItemStatus(7054482, 1824, 'movie');
//      Map r = await api.list4.checkItemStatus(145091, 473033, 'movie');
//      Map r = await api.list4.checkItemStatus(145091, 122917, 'movie');
//      Map r = await api.list4.checkItemStatus(145091, 67198, 'tv');
      print(r);
    });
  });

  group('MOVIES', () {
    test('MOVIES -> get details', () async {
      Map r = await api.movies.getDetails(
        550,
        // language: pt_BR,
        // append: ['images'],
        // append: [ 'credits', 'images','videos'],
        includeImageLanguages: ['pt', 'es'],
      );
      // print(r);
      print(r['videos']);
      print(r['images']);
    });

    test('MOVIES -> get account states', () async {
//      Map r = await api.movies.getAccountStates(547016, language: pt_BR);
      Map r = await api.movies.getAccountStates(361743, language: pt_BR);
      print(r);
    });

    test('MOVIES -> get credits', () async {
      Map r = await api.movies.getCredits(512);
      print(r);
    });

    test('MOVIES -> get recommendations', () async {
      Map r = await api.movies.getRecommendations(512);
      print(r);
    });

    test('MOVIES -> rate', () async {
      Map r = await api.movies.rateMovie(512, 5.0);
      print(r);
    });

    test('MOVIES -> delete rating', () async {
      Map r = await api.movies.deleteRating(512);
      print(r);
    });

    test('MOVIES -> get popular', () async {
      Map r = await api.movies.getPopular();
      print(r);
    });

    test('MOVIES -> get top rated', () async {
      Map r = await api.movies.getTopRated();
      print(r);
    });
  });

  group('TRENDING', () {
    test('TRENDING -> get trending', () async {
      Map r = await api.trending.getTrending('all', 'day');
      print(r);
    });
  });

  group('PEOPLE', () {
    test('PEOPLE -> get details', () async {
      Map r = await api.people.getDetails(
        19292,
        language: pt_BR,
        append: ['credits'],
      );
      print(r);
    });
  });

  group('SEARCH', () {
    test('SEARCH -> companies', () async {
      Map r = await api.search.searchCompany('Paramount');
      print(r);
    });

    test('SEARCH -> multi search', () async {
      Map r = await api.search.multiSearch('Natalie');
      print(r);
    });
  });

  group('TV', () {
    test('TV -> get details', () async {
      Map r = await api.tv.getDetails(
        67198,
        language: pt_BR,
//        append: ['credits'],
      );
      print(r);
    });

    test('TV -> get account states', () async {
      Map r = await api.tv.getAccountStates(1668, language: pt_BR);
      print(r);
    });

    test('TV -> get recommendations', () async {
      Map r = await api.tv.getRecommendations(1668);
      print(r);
    });

    test('TV -> get popular', () async {
      Map r = await api.tv.getPopular();
      print(r);
    });

    test('TV -> get top rated', () async {
      Map r = await api.tv.getTopRated();
      print(r);
    });
  });

  group('TV SEASON', () {
    test('TV SEASON -> get details', () async {
      Map r = await api.tvSeason.getDetails(
        67198,
        1,
        language: pt_BR,
//        append: ['credits'],
      );
      print(r);
    });
  });

  group('TV EPISODE', () {
    test('TV EPISODE -> get details', () async {
      Map r = await api.tvEpisode.getDetails(
        67198,
        1,
        1,
        language: pt_BR,
//        append: ['credits'],
      );
      print(r);
    });
  });
}

const en_US = 'en-US';
const pt_BR = 'pt-BR';

Future<Map> _loadJsonFromAsset(String assetFile) async {
  return jsonDecode(await File('assets/sensitive/$assetFile').readAsString());
}

Future<void> _login(TmdbPure api, String user) async {
  final jsonLoginData = (await _loadJsonFromAsset('tmdb_login_data.json'))['tmdb_login_data'];
  final jsonUserLoginData = jsonLoginData[user];
  api.authentication.setUserData(
    jsonUserLoginData['session_id'],
  );
  api.auth4.setUserData(
    jsonUserLoginData['account_id'],
    jsonUserLoginData['access_token'],
  );
}
