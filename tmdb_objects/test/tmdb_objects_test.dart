import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_objects/tmdb_objects.dart';

void main() async {
  final jsonApiKey = await _loadJsonFromAsset('api_data.json');

  TmdbObjects api = TmdbObjects(
    jsonApiKey['api_data']['api_key'],
    jsonApiKey['api_data']['read_access_token'],
  );

  await login(api, 'schwarz.junior');

  group('AUTHENTICATION v3', () {
    test('AUTHENTICATION v3 -> create session from v4', () async {
      AuthenticationSessionFromV4 r = await api.authentication.createSessionIdFromV4(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzI0NDksInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1NzgiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.nLFgA3mCMoUHFy4xbE5F3CJTpLfzUvjPlDye9eae0io');
      print(r);
      // Session id: e1bd92f910495860302e00f4a97668a233ab8b66
    });
  });

  group('AUTHENTICATION v4', () {
    test('AUTHENTICATION v4 -> create request token', () async {
      Auth4RequestToken r = await api.auth4.createRequestToken();
      print(r);
      // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzIzNzksInNjb3BlcyI6WyJwZW5kaW5nX3JlcXVlc3RfdG9rZW4iXSwiZXhwIjoxNjA0NjMzMjc5LCJqdGkiOjI1MzI1NzgsImF1ZCI6ImZmZWE0Y2ExMDk5YzZmOTQ1Y2ZlOTEyZTA4MDU2YmUyIiwicmVkaXJlY3RfdG8iOm51bGwsInZlcnNpb24iOjF9.9mF8jhFGom2ubLcQSRK_I9oM2k-F-wrcaB0L6nGd-kc
    });

    test('AUTHENTICATION v4 -> create access token', () async {
      Auth4AccessToken r = await api.auth4.createAccessToken(
        requestToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzIzNzksInNjb3BlcyI6WyJwZW5kaW5nX3JlcXVlc3RfdG9rZW4iXSwiZXhwIjoxNjA0NjMzMjc5LCJqdGkiOjI1MzI1NzgsImF1ZCI6ImZmZWE0Y2ExMDk5YzZmOTQ1Y2ZlOTEyZTA4MDU2YmUyIiwicmVkaXJlY3RfdG8iOm51bGwsInZlcnNpb24iOjF9.9mF8jhFGom2ubLcQSRK_I9oM2k-F-wrcaB0L6nGd-kc',
      );
      print(r);
      // Access token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzI0NDksInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1NzgiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.nLFgA3mCMoUHFy4xbE5F3CJTpLfzUvjPlDye9eae0io
      // Account id: 5eb4bb017ac8290022228128
    });
  });

  group('ACCOUNT v3', () {
    test('ACCOUNT v3 -> get details', () async {
      AccountDetails r = await api.account.getDetails();
      // assert(AccountDetails.fromJson(r.toJson()) == r);
      print(r);
    });

    test('ACCOUNT v3 -> get favorite movies', () async {
      AccountFavoriteMovies r = await api.account.getFavoriteMovies(
        language: pt_BR,
        sortBy: FavoriteMoviesSortBy.createdAt.desc,
      );
      // print(r);
      r.results.forEach((element) {
        print(element.title);
      });
    });

    test('ACCOUNT v3 -> get favorite tv shows', () async {
      AccountFavoriteTvs r = await api.account.getFavoriteTvs();
      print(r);
    });

    test('ACCOUNT v3 -> get watch list movies', () async {
      AccountWatchListMovies r = await api.account.getWatchListMovies();
      print(r);
    });

    test('ACCOUNT v3 -> get watch list tvs', () async {
      AccountWatchListTvs r = await api.account.getWatchListTvs();
      print(r);
    });

    test('ACCOUNT v3 -> get rated movies', () async {
      AccountRatedMovies r = await api.account.getRatedMovies();
      print(r);
    });

    test('ACCOUNT v3 ->get rated tvs', () async {
      AccountRatedTvs r = await api.account.getRatedTvs();
      print(r);
    });

    test('ACCOUNT v3 -> mark as favorite', () async {
      AccountMarkAsFavorite r = await api.account.markAsFavorite('114', 'movie', false);
      print(r);
    });

    test('ACCOUNT v3 -> add to watchlist', () async {
      AccountAddToWatchlist r = await api.account.addToWatchlist('114', 'movie', true);
      print(r);
    });
  });

  group('ACCOUNT v4', () {
    test('ACCOUNT v4 -> get lists', () async {
      Account4Lists r = await api.account4.getLists();
      // TODO: Erro no assert
//      assert(Account4Lists.fromJson(r.toJson()) == r);
      print(r);
    });

    test('ACCOUNT v4 -> get favorite movies', () async {
      Account4FavoriteMovies r = await api.account4.getFavoriteMovies(
        language: pt_BR,
        // sortBy: MovieSortBy.createdAt.asc,
        // sortBy: MovieSortBy.title,
      );
      print(r);
    });

    test('ACCOUNT v4 -> get favorite tvs', () async {
      Account4FavoriteTvs r = await api.account4.getFavoriteTvs(
        language: pt_BR,
        //sortBy: TvSortBy.name,
      );
      print(r);
    });

    test('ACCOUNT v4 -> get watch list movies', () async {
      Account4WatchListMovies r = await api.account4.getWatchListMovies(
        language: pt_BR,
        //sortBy: MovieSortBy.title,
      );
      print(r);
    });

    test('ACCOUNT v4 -> get watch list tvs', () async {
      Account4WatchListTvs r = await api.account4.getWatchListTvs(
        language: pt_BR,
        //sortBy: TvSortBy.name,
      );
      print(r);
    });

    test('ACCOUNT v4 -> get movie recommendations', () async {
      MovieRecommendations r = await api.account4.getMovieRecommendations();
      print(r);
    });
  });

  group('CONFIGURATION', () {
    test('CONFIGURATION -> get countries', () async {
      ConfigurationCountries r = await api.configuration.getCountries();
      print(r);
    });

    test('CONFIGURATION -> get languages', () async {
      ConfigurationLanguages r = await api.configuration.getLanguages();
      print(r);
    });
  });

  group('DISCOVER', () {
    test('DISCOVER -> get discover movie', () async {
      DiscoverMovie r = await api.discover.movieDiscover(
          // primaryReleaseYear: 2009,
          // sortBy: DiscoverMovieSortBy.popularity.desc,
          );
      print(r);
    });

    test('DISCOVER -> get discover tv', () async {
      DiscoverTv r = await api.discover.tvDiscover();
      print(r);
    });
  });

  group('LIST v4', () {
    test('LIST v4 -> get list', () async {
      List4 r = await api.list4.getList(
        145091,
        sortBy: List4SortBy.originalOrder,
      );
      print(r);
    });

    test('LIST v4 -> add items to list', () async {
      final listId = 145091;
      final List<List4ListItem> items = [
        List4ListItem(mediaId: 619592, mediaType: TMediaType.movie),
        List4ListItem(mediaId: 31910, mediaType: TMediaType.tv),
      ];
      List4AddItems r = await api.list4.addItems(listId, items);
      print(r);
    });

    test('LIST v4 -> remove items from list', () async {
      final listId = 145091;
      final List<List4ListItem> items = [
        List4ListItem(mediaId: 619592, mediaType: TMediaType.movie),
//        List4ListItem(mediaId: 31910, mediaType: MediaType.tv),
      ];
      List4RemoveItems r = await api.list4.removeItems(listId, items);
      print(r);
    });

    test('LIST v4 -> check item status', () async {
      final listId = 7054344;
//      final listId = 132516;
      List4CheckItemStatus r = await api.list4.checkItemStatus(listId, 562, TMediaType.movie);
      print(r.success);
      print(r);
    });

    test('LIST v4 -> create list', () async {
      final listName = 'List Test A';
      List4Create r = await api.list4.create(
        listName,
        'en',
        public: false,
        description: 'Minha lista de testes A.',
      );
      print(r.success);
      print(r);
    });
  });

  group('MOVIE', () {
    test('MOVIE -> get details', () async {
      // Movie r = await api.movie.getDetails(419704);
      // Movie r = await api.movie.getDetails(559622);
      Movie r = await api.movie.getDetails(
        385103,
        language: en_US,
        imageLanguages: ['pt', null],
      );
      print(r.images);
    });

    test('MOVIE -> get account states', () async {
      //AccountStates r = await api.movie.getAccountStates(419704);
      TAccountStates r = await api.movie.getAccountStates(547016);
      print(r);
      //print(r.toJson());
      assert(TAccountStates.fromJson(r.toJson()) == r);
    });

    test('MOVIE -> get credits', () async {
      MovieCredits r = await api.movie.getCredits(419704);
      print(r);
    });

    test('MOVIE -> get recommendations', () async {
      MovieRecommendations r = await api.movie.getRecommendations(
        419704,
        language: 'pt-BR',
      );
//      expect(r, MovieRecommendations.fromJson(r.toJson()));
      print(r);
    });

    test('MOVIE -> rate', () async {
      // RateMovie r = await api.movie.rateMovie(419704, 6.5);
      RateMovie r = await api.movie.rateMovie(85853, 6.5);
      print('success: ${r.isSuccess}');
      print(r);
    });

    test('MOVIE -> delete rating', () async {
      DeleteMovieRating r = await api.movie.deleteMovieRating(419704);
      print('success: ${r.isSuccess}');
      print(r);
    });

    test('MOVIE -> get popular', () async {
      PopularMovies r = await api.movie.getPopular();
      print(r);
    });

    test('MOVIE -> get top rated', () async {
      TopRatedMovies r = await api.movie.getTopRated();
      print(r);
    });
  });

  group('PEOPLE', () {
    test('PEOPLE -> get details', () async {
//      Person r = await api.people.getDetails(510);
      Person r = await api.people.getDetails(6384);
      print(r);
    });
  });

  group('SEARCH', () {
    test('SEARCH -> companies', () async {
      SearchCompanies r = await api.search.searchCompanies('Paramount');
//      assert(SearchCompanies.fromJson(r.toJson()) == r);
      print(r);
    });

    test('SEARCH -> multi search', () async {
      String query;
//      query = 'natalie portman';
//       query = 'courtney cox';
      query = 'batman';
      SearchMulti r = await api.search.multiSearch(query);
      assert(SearchMulti.fromJson(r.toJson()) == r);
      print(r);
    });
  });

  group('TRENDING', () {
    test('TRENDING -> get trending', () async {
      Trending r = await api.trending.getTrending(
        TTrendingMediaType.all,
        TTrendingTimeWindow.day,
      );
      print(r);
    });
  });

  group('TV', () {
    test('TV -> get details', () async {
      Tv r = await api.tv.getDetails(67198, imageLanguages: ['en']);
      print(r.seasons);
    });

    test('TV -> get account states', () async {
//      AccountStates r = await api.tv.getAccountStates(85853);
      TAccountStates r = await api.tv.getAccountStates(75006);
      print(r);
      //print(r.toJson());
      assert(TAccountStates.fromJson(r.toJson()) == r);
    });

    test('TV -> get recommendations', () async {
      TvRecommendations r = await api.tv.getRecommendations(
        1668,
        language: 'pt-BR',
      );
//      expect(r, MovieRecommendations.fromJson(r.toJson()));
      print(r);
    });

    test('TV -> rate', () async {
      RateTv r = await api.tv.rateTv(67198, 7.5);
      print('success: ${r.isSuccess}');
      print(r);
    });

    test('TV -> delete rating', () async {
      DeleteTvRating r = await api.tv.deleteTvRating(67198);
      print('success: ${r.isSuccess}');
      print(r);
    });

    test('TV -> get popular', () async {
      PopularTvs r = await api.tv.getPopular();
      print(r);
    });

    test('TV -> get top rated', () async {
      TopRatedTvs r = await api.tv.getTopRated();
      print(r);
    });
  });

  group('TV SEASON', () {
    test('TV SEASON -> get details', () async {
      TvSeason r = await api.tvSeason.getDetails(71712, 1, imageLanguages: ['es']);
      print(r.episodes);
    });
  });

  group('TV EPISODE', () {
    test('TV EPISODE -> get details', () async {
      TvEpisode r = await api.tvEpisode.getDetails(71712, 2, 1);
      print(r.images);
    });
  });
}

const en_US = 'en-US';
const pt_BR = 'pt-BR';

Future<Map> _loadJsonFromAsset(String jsonAssetFile) async {
  return jsonDecode(await File('assets/sensitive/$jsonAssetFile').readAsString());
}

Future<void> login(TmdbObjects api, String user) async {
  final jsonLoginData = (await _loadJsonFromAsset('tmdb_login_data.json'))['tmdb_login_data'];
  final jsonUserLoginData = jsonLoginData[user];
  api.loginAll(
    jsonUserLoginData['session_id'],
    jsonUserLoginData['account_id'],
    jsonUserLoginData['access_token'],
  );
}
