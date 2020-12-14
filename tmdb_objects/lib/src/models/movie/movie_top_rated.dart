part of '_movie.dart';

@JsonSerializable()
class TopRatedMovies extends TResultsObject<MovieResumed> {
  TopRatedMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory TopRatedMovies.fromJson(Map<String, dynamic> json) => _$TopRatedMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesToJson(this);

  @override
  TopRatedMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return TopRatedMovies(
      page: other.page,
      totalPages: other.totalPages,
      totalResults: other.totalResults,
      results: [
        if (results != null) ...results,
        ...other.results,
      ],
    );
  }
}
