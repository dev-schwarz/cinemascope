part of '_tv.dart';

@JsonSerializable()
class TvRecommendations extends TResultsObject<TvResumed> {
  TvRecommendations({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory TvRecommendations.fromJson(Map<String, dynamic> json) =>
      _$TvRecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$TvRecommendationsToJson(this);

  @override
  TvRecommendations mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return TvRecommendations(
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
