import 'package:provider/provider.dart';

import '../material.dart';
import '../models/app_route_data.dart';
import '../screens/assignments/assignments_screen.dart';
import '../screens/discover/movies/discover_movies_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/initial/initial_screen.dart';
import '../screens/library/library_screen.dart';
import '../screens/library/screens/favorite_movies_screen.dart';
import '../screens/library/screens/favorite_tvs_screen.dart';
import '../screens/library/screens/user_list_screen.dart';
import '../screens/library/screens/watch_list_movies_screen.dart';
import '../screens/library/screens/watch_list_tvs_screen.dart';
import '../screens/media/screens/movie_screen.dart';
import '../screens/media/screens/person_screen.dart';
import '../screens/media/screens/tv_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/trending/trending_screen.dart';
import '../stores/media/media_store.dart';

class AppRoutes {
  const AppRoutes._();

  static const String INITIAL = '/';
  static const String LOGIN = '/login';

  static const String HOME = '/home';
  static const String HOME_TRENDING = '/home-trending';
  static const String HOME_DISCOVER = '/home-discover';
  static const String HOME_ASSIGNMENTS = '/home-assignments';
  static const String HOME_LIBRARY = '/home-library';

  static const String SEARCH = '/search';

  static const String MOVIE_DETAILS = '/movie-details';
  static const String TV_DETAILS = '/tv-details';
  static const String TV_SEASON_DETAILS = '/tv-season-details';
  static const String TV_EPISODE_DETAILS = '/tv-episode-details';
  static const String PERSON_DETAILS = '/person-details';
  static const String MOVIE_RECOMMENDATIONS = '/movie-recommendations';
  static const String TV_RECOMMENDATIONS = '/tv-recommendations';

  static const String LIBRARY_FAVORITE_MOVIES = '/library-favorite-movies';
  static const String LIBRARY_FAVORITE_TVS = '/library-favorite-tvs';
  static const String LIBRARY_WATCH_LIST_MOVIES = '/library-watch-ist-movies';
  static const String LIBRARY_WATCH_LIST_TVS = '/library-watch-list-tvs';
  static const String LIBRARY_USER_LIST = '/library-user-list';

  static const String APP_SETTINGS = '/app-settings';
  static const String APP_ABOUT = '/app-about';

  static final routes = <String, WidgetBuilder>{
    ...Map.fromEntries(
      [
        initialRoute,
        AppRouteData(
          name: AppRoutes.LOGIN,
          // builder: (_) => const LoginScreen(),
        ),
        AppRouteData(
          name: AppRoutes.HOME,
          builder: (_) => const HomeScreen(),
        ),
        AppRouteData(
          name: AppRoutes.SEARCH,
          builder: (_) => const SearchScreen(),
        ),
        ..._homeRoutes,
        ..._libraryRoutes,
        ..._mediaRoutes,
        ..._appDrawerRoutes,
      ].map((entry) => MapEntry(entry.name, entry.builder)),
    ),
  };

  static final initialRoute = AppRouteData(
    name: AppRoutes.INITIAL,
    builder: (_) => const InitialScreen(),
  );

  static final _appDrawerRoutes = <AppRouteData>[
    AppRouteData(
      name: AppRoutes.APP_SETTINGS,
      // builder: (_) => const SettingsScreen(),
    ),
    AppRouteData(
      name: AppRoutes.APP_ABOUT,
      // builder: (_) => const AboutScreen(),
    ),
  ];

  static final _homeRoutes = <AppRouteData>[
    AppRouteData(
      name: AppRoutes.HOME_TRENDING,
      builder: (context) {
        final args = ModalRoute.of(context).settings.arguments as HomeTrendingScreenArguments;
        return TrendingScreen(args.trendingStore);
      },
    ),
    AppRouteData(
      name: AppRoutes.HOME_DISCOVER,
      builder: (_) => const DiscoverMoviesScreen(),
    ),
    AppRouteData(
      name: AppRoutes.HOME_ASSIGNMENTS,
      builder: (_) => const AssignmentsScreen(),
    ),
    AppRouteData(
      name: AppRoutes.HOME_LIBRARY,
      builder: (_) => const LibraryScreen(),
    ),
  ];

  static final _libraryRoutes = <AppRouteData>[
    AppRouteData(
      name: AppRoutes.LIBRARY_FAVORITE_MOVIES,
      builder: (_) => const FavoriteMoviesScreen(),
    ),
    AppRouteData(
      name: AppRoutes.LIBRARY_FAVORITE_TVS,
      builder: (_) => const FavoriteTvsScreen(),
    ),
    AppRouteData(
      name: AppRoutes.LIBRARY_WATCH_LIST_MOVIES,
      builder: (_) => const WatchListMoviesScreen(),
    ),
    AppRouteData(
      name: AppRoutes.LIBRARY_WATCH_LIST_TVS,
      builder: (_) => const WatchListTvsScreen(),
    ),
    AppRouteData(
      name: AppRoutes.LIBRARY_USER_LIST,
      builder: (context) {
        final args = ModalRoute.of(context).settings.arguments as UserListScreenArguments;
        return UserListScreen(args.list);
      },
    ),
  ];

  static final _mediaRoutes = <AppRouteData>[
    AppRouteData(
      name: AppRoutes.MOVIE_DETAILS,
      builder: (context) {
        final args = ModalRoute.of(context).settings.arguments as MovieScreenArguments;
        return Provider<MediaStore>(
          create: (_) => args.movieStore,
          child: MovieScreen(args.movieStore),
        );
      },
    ),
    AppRouteData(
      name: AppRoutes.PERSON_DETAILS,
      builder: (context) {
        final args = ModalRoute.of(context).settings.arguments as PersonScreenArguments;
        return Provider<MediaStore>(
          create: (_) => args.personStore,
          child: PersonScreen(args.personStore),
        );
      },
    ),
    AppRouteData(
      name: AppRoutes.TV_DETAILS,
      builder: (context) {
        final args = ModalRoute.of(context).settings.arguments as TvScreenArguments;
        return Provider<MediaStore>(
          create: (_) => args.tvStore,
          child: TvScreen(args.tvStore),
        );
      },
    ),
    AppRouteData(
      name: AppRoutes.TV_SEASON_DETAILS,
      // builder: (context) {
      //   final args = ModalRoute.of(context).settings.arguments as TvSeasonScreenArguments;
      //   return TvSeasonScreen(args.tvSeasonStore);
      // },
    ),
    AppRouteData(
      name: AppRoutes.TV_EPISODE_DETAILS,
      // builder: (context) {
      //   final args = ModalRoute.of(context).settings.arguments as TvEpisodeScreenArguments;
      //   return TvEpisodeScreen(args.tvEpisodeStore);
      // },
    ),
    AppRouteData(
      name: AppRoutes.MOVIE_RECOMMENDATIONS,
      // builder: (context) {
      //   final args = ModalRoute.of(context).settings.arguments as RecommendationsScreenArguments;
      //   return MovieRecommendationsScreen(
      //     MovieRecommendationsStore(resumedMedia: args.resumedMedia),
      //   );
      // },
    ),
    AppRouteData(
      name: AppRoutes.TV_RECOMMENDATIONS,
      // builder: (context) {
      //   final args = ModalRoute.of(context).settings.arguments as RecommendationsScreenArguments;
      //   return TvRecommendationsScreen(
      //     TvRecommendationsStore(resumedMedia: args.resumedMedia),
      //   );
      // },
    ),
  ];
}
