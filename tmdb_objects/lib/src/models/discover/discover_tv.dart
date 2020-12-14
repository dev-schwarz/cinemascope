part of '_discover.dart';

@JsonSerializable()
class DiscoverTv extends TResultsObject<TvResumed> {
  DiscoverTv({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory DiscoverTv.fromJson(Map<String, dynamic> json) => _$DiscoverTvFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverTvToJson(this);

  @override
  DiscoverTv mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return DiscoverTv(
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
