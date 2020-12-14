part of '_movie.dart';

@JsonSerializable()
class MovieRecommendations extends TResultsObject<MovieResumed> {
  MovieRecommendations({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory MovieRecommendations.fromJson(Map<String, dynamic> json) =>
      _$MovieRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRecommendationsToJson(this);

  @override
  MovieRecommendations mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return MovieRecommendations(
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
