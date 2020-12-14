part of '_tv.dart';

@JsonSerializable()
class PopularTvs extends TResultsObject<TvResumed> {
  PopularTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory PopularTvs.fromJson(Map<String, dynamic> json) => _$PopularTvsFromJson(json);

  Map<String, dynamic> toJson() => _$PopularTvsToJson(this);

  @override
  PopularTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return PopularTvs(
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
