part of '_movie.dart';

@JsonSerializable()
class PopularMovies extends TResultsObject<MovieResumed> {
  PopularMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory PopularMovies.fromJson(Map<String, dynamic> json) => _$PopularMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);

  @override
  PopularMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return PopularMovies(
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
