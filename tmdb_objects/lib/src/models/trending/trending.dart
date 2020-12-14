part of '_trending.dart';

@JsonSerializable()
class Trending<T extends ResumedMedia> extends TResultsObject<T> {
  Trending({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  @ResumedMediaConverter()
  final List<T> results;

  factory Trending.fromJson(Map<String, dynamic> json) => _$TrendingFromJson<T>(json);

  Map<String, dynamic> toJson() => _$TrendingToJson<T>(this);

  @override
  Trending mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Trending(
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
