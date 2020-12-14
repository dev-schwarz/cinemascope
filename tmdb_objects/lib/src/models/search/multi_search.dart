part of '_search.dart';

@JsonSerializable()
class SearchMulti<T extends ResumedMedia> extends TResultsObject<T> {
  SearchMulti({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  @ResumedMediaConverter()
  final List<T> results;

  factory SearchMulti.fromJson(Map<String, dynamic> json) => _$SearchMultiFromJson<T>(json);

  Map<String, dynamic> toJson() => _$SearchMultiToJson<T>(this);

  @override
  SearchMulti mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return SearchMulti(
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
