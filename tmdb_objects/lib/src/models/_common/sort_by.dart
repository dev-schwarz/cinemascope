part of '_common.dart';

/// Sort by values for [MovieRecommendations].
class MovieRecommendationsSortBy extends SortBy {
  MovieRecommendationsSortBy._(int index)
      : super(index, const <String>[
          null,
          'created_at',
          'release_date',
          'title',
          'vote_average',
        ]);

  static MovieRecommendationsSortBy get none => MovieRecommendationsSortBy._(0);

  static MovieRecommendationsSortBy get createdAt => MovieRecommendationsSortBy._(1);

  static MovieRecommendationsSortBy get releaseDate => MovieRecommendationsSortBy._(2);

  static MovieRecommendationsSortBy get title => MovieRecommendationsSortBy._(3);

  static MovieRecommendationsSortBy get voteAverage => MovieRecommendationsSortBy._(4);

  static List<MovieRecommendationsSortBy> values = <MovieRecommendationsSortBy>[
    none,
    createdAt,
    releaseDate,
    title,
    voteAverage,
  ];

  @override
  MovieRecommendationsSortBy copy() {
    return MovieRecommendationsSortBy._(index)..order = order;
  }
}

/// Sort by values for [TvRecommendations].
class TvRecommendationsSortBy extends SortBy {
  TvRecommendationsSortBy._(int index)
      : super(index, const <String>[
          null,
          'first_air_date',
          'name',
          'vote_average',
          'release_date',
          'title',
        ]);

  static TvRecommendationsSortBy get none => TvRecommendationsSortBy._(0);

  static TvRecommendationsSortBy get firstAirDate => TvRecommendationsSortBy._(1);

  static TvRecommendationsSortBy get name => TvRecommendationsSortBy._(2);

  static TvRecommendationsSortBy get voteAverage => TvRecommendationsSortBy._(3);

  static TvRecommendationsSortBy get releaseDate => TvRecommendationsSortBy._(4);

  static TvRecommendationsSortBy get title => TvRecommendationsSortBy._(5);

  static List<TvRecommendationsSortBy> values = <TvRecommendationsSortBy>[
    none,
    firstAirDate,
    name,
    voteAverage,
    releaseDate,
    title,
  ];

  @override
  TvRecommendationsSortBy copy() {
    return TvRecommendationsSortBy._(index)..order = order;
  }
}

/// Sort by values for [DiscoverMovie].
class DiscoverMovieSortBy extends SortBy {
  DiscoverMovieSortBy._(int index)
      : super(index, const <String>[
          null,
          'popularity',
          'release_date',
          'revenue',
          'primary_release_date',
          'original_title',
          'vote_average',
          'vote_count',
        ]);

  static DiscoverMovieSortBy get none => DiscoverMovieSortBy._(0);

  static DiscoverMovieSortBy get popularity => DiscoverMovieSortBy._(1);

  static DiscoverMovieSortBy get releaseDate => DiscoverMovieSortBy._(2);

  static DiscoverMovieSortBy get revenue => DiscoverMovieSortBy._(3);

  static DiscoverMovieSortBy get primaryReleaseDate => DiscoverMovieSortBy._(4);

  static DiscoverMovieSortBy get originalTitle => DiscoverMovieSortBy._(5);

  static DiscoverMovieSortBy get voteAverage => DiscoverMovieSortBy._(6);

  static DiscoverMovieSortBy get voteCount => DiscoverMovieSortBy._(7);

  static List<DiscoverMovieSortBy> values = <DiscoverMovieSortBy>[
    none,
    popularity,
    releaseDate,
    revenue,
    primaryReleaseDate,
    originalTitle,
    voteAverage,
    voteCount,
  ];

  @override
  DiscoverMovieSortBy copy() {
    return DiscoverMovieSortBy._(index)..order = order;
  }
}

/// Sort by values for [DiscoverTv].
class DiscoverTvSortBy extends SortBy {
  DiscoverTvSortBy._(int index)
      : super(index, const <String>[
          null,
          'vote_average',
          'first_air_date',
          'popularity',
        ]);

  static DiscoverTvSortBy get none => DiscoverTvSortBy._(0);

  static DiscoverTvSortBy get voteAverage => DiscoverTvSortBy._(1);

  static DiscoverTvSortBy get firstAirDate => DiscoverTvSortBy._(2);

  static DiscoverTvSortBy get popularity => DiscoverTvSortBy._(3);

  static List<DiscoverTvSortBy> values = <DiscoverTvSortBy>[
    none,
    voteAverage,
    firstAirDate,
    popularity,
  ];

  @override
  DiscoverTvSortBy copy() {
    return DiscoverTvSortBy._(index)..order = order;
  }
}

/// Sort by values for [Account4FavoriteMovies] and [Account4WatchListMovies].
class Account4MovieSortBy extends SortBy {
  Account4MovieSortBy._(int index)
      : super(index, const <String>[
          null,
          'created_at',
          'release_date',
          'title',
          'vote_average',
        ]);

  static Account4MovieSortBy get none => Account4MovieSortBy._(0);

  static Account4MovieSortBy get createdAt => Account4MovieSortBy._(1);

  static Account4MovieSortBy get releaseDate => Account4MovieSortBy._(2);

  static Account4MovieSortBy get title => Account4MovieSortBy._(3);

  static Account4MovieSortBy get voteAverage => Account4MovieSortBy._(4);

  static List<Account4MovieSortBy> values = <Account4MovieSortBy>[
    none,
    createdAt,
    releaseDate,
    title,
    voteAverage,
  ];

  @override
  Account4MovieSortBy copy() {
    return Account4MovieSortBy._(index)..order = order;
  }
}

/// Sort by values for [Account4FavoriteTvs] and [Account4WatchListTvs].
class Account4TvSortBy extends SortBy {
  Account4TvSortBy._(int index)
      : super(index, const <String>[
          null,
          'created_at',
          'first_air_date',
          'name',
          'vote_average',
        ]);

  static Account4TvSortBy get none => Account4TvSortBy._(0);

  static Account4TvSortBy get createdAt => Account4TvSortBy._(1);

  static Account4TvSortBy get firstAirDate => Account4TvSortBy._(2);

  static Account4TvSortBy get name => Account4TvSortBy._(3);

  static Account4TvSortBy get voteAverage => Account4TvSortBy._(4);

  static List<Account4TvSortBy> values = <Account4TvSortBy>[
    none,
    createdAt,
    firstAirDate,
    name,
    voteAverage,
  ];

  @override
  Account4TvSortBy copy() {
    return Account4TvSortBy._(index)..order = order;
  }
}

abstract class FavoritesAndWatchListsSortBy<T> extends SortBy {
  FavoritesAndWatchListsSortBy._(int index)
      : super(index, const <String>[
          null,
          'created_at',
        ]);
}

/// Sort by values for [AccountFavoriteMovies].
class FavoriteMoviesSortBy extends FavoritesAndWatchListsSortBy<FavoriteMoviesSortBy> {
  FavoriteMoviesSortBy._(int index) : super._(index);

  static FavoriteMoviesSortBy get none => FavoriteMoviesSortBy._(0);

  static FavoriteMoviesSortBy get createdAt => FavoriteMoviesSortBy._(1);

  static List<FavoriteMoviesSortBy> values = <FavoriteMoviesSortBy>[
    none,
    createdAt,
  ];

  @override
  FavoriteMoviesSortBy copy() {
    return FavoriteMoviesSortBy._(index)..order = order;
  }
}

/// Sort by values for [AccountFavoriteTvs].
class FavoriteTvsSortBy extends FavoritesAndWatchListsSortBy<FavoriteTvsSortBy> {
  FavoriteTvsSortBy._(int index) : super._(index);

  static FavoriteTvsSortBy get none => FavoriteTvsSortBy._(0);

  static FavoriteTvsSortBy get createdAt => FavoriteTvsSortBy._(1);

  static List<FavoriteTvsSortBy> values = <FavoriteTvsSortBy>[
    none,
    createdAt,
  ];

  @override
  FavoriteTvsSortBy copy() {
    return FavoriteTvsSortBy._(index)..order = order;
  }
}

/// Sort by values for [AccountWatchListMovies].
class WatchListMoviesSortBy extends FavoritesAndWatchListsSortBy<WatchListMoviesSortBy> {
  WatchListMoviesSortBy._(int index) : super._(index);

  static WatchListMoviesSortBy get none => WatchListMoviesSortBy._(0);

  static WatchListMoviesSortBy get createdAt => WatchListMoviesSortBy._(1);

  static List<WatchListMoviesSortBy> values = <WatchListMoviesSortBy>[
    none,
    createdAt,
  ];

  @override
  WatchListMoviesSortBy copy() {
    return WatchListMoviesSortBy._(index)..order = order;
  }
}

/// Sort by values for [AccountWatchListTvs].
class WatchListTvsSortBy extends FavoritesAndWatchListsSortBy<WatchListTvsSortBy> {
  WatchListTvsSortBy._(int index) : super._(index);

  static WatchListTvsSortBy get none => WatchListTvsSortBy._(0);

  static WatchListTvsSortBy get createdAt => WatchListTvsSortBy._(1);

  static List<WatchListTvsSortBy> values = <WatchListTvsSortBy>[
    none,
    createdAt,
  ];

  @override
  WatchListTvsSortBy copy() {
    return WatchListTvsSortBy._(index)..order = order;
  }
}

/// Sort by values for [List4].
class List4SortBy extends SortBy {
  List4SortBy._(int index)
      : super(index, const <String>[
          null,
          'original_order',
          'release_date',
          'title',
          'vote_average',
        ]);

  static List4SortBy get none => List4SortBy._(0);

  static List4SortBy get originalOrder => List4SortBy._(1);

  static List4SortBy get releaseDate => List4SortBy._(2);

  static List4SortBy get title => List4SortBy._(3);

  static List4SortBy get voteAverage => List4SortBy._(4);

  static List<List4SortBy> values = <List4SortBy>[
    none,
    originalOrder,
    releaseDate,
    title,
    voteAverage,
  ];

  @override
  List4SortBy copy() {
    return List4SortBy._(index)..order = order;
  }
}
