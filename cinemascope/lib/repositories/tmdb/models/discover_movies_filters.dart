part of '../tmdb_repository.dart';

class DiscoverMovieFilters {
  DiscoverMovieFilters._({
    this.sortIndex,
    this.sortOrderIndex,
    this.primaryReleaseYear,
    this.year,
    this.releaseDateGte,
    this.releaseDateLte,
    this.voteCountGte,
    this.voteCountLte,
    this.voteAverageGte,
    this.voteAverageLte,
  });

  factory DiscoverMovieFilters() => DiscoverMovieFilters._(
        sortIndex: DiscoverMovieSortBy.popularity.index,
        sortOrderIndex: SortOrder.desc.index,
        // sortOrderIndex: DiscoverMovieSortBy.popularity.desc.order.index,
      );

  DiscoverMovieFilters copyWith({
    int sortIndex,
    int sortOrderIndex,
    int primaryReleaseYear,
    int year,
    String releaseDateGte,
    String releaseDateLte,
    int voteCountGte,
    int voteCountLte,
    num voteAverageGte,
    num voteAverageLte,
  }) {
    return DiscoverMovieFilters._(
      sortIndex: sortIndex ?? this.sortIndex,
      sortOrderIndex: sortOrderIndex ?? this.sortOrderIndex,
      primaryReleaseYear: primaryReleaseYear ?? this.primaryReleaseYear,
      year: year ?? this.year,
      releaseDateGte: releaseDateGte ?? this.releaseDateGte,
      releaseDateLte: releaseDateLte ?? this.releaseDateLte,
      voteCountGte: voteCountGte ?? this.voteCountGte,
      voteCountLte: voteCountLte ?? this.voteCountLte,
      voteAverageGte: voteAverageGte ?? this.voteAverageGte,
      voteAverageLte: voteAverageLte ?? this.voteAverageLte,
    );
  }

  DiscoverMovieSortBy get sortBy {
    return DiscoverMovieSortBy.values[sortIndex]..order = SortOrder.values[sortOrderIndex];
  }

  final int sortIndex;
  final int sortOrderIndex;
  final int primaryReleaseYear;
  final int year;
  final String releaseDateGte;
  final String releaseDateLte;
  final int voteCountGte;
  final int voteCountLte;
  final num voteAverageGte;
  final num voteAverageLte;
}
