part of '_tv.dart';

@JsonSerializable()
class TopRatedTvs extends TResultsObject<TvResumed> {
  TopRatedTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory TopRatedTvs.fromJson(Map<String, dynamic> json) => _$TopRatedTvsFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedTvsToJson(this);

  @override
  TopRatedTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return TopRatedTvs(
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
