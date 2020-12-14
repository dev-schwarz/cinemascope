part of '_discover.dart';

@JsonSerializable()
class DiscoverMovie extends TResultsObject<MovieResumed> {
  DiscoverMovie({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory DiscoverMovie.fromJson(Map<String, dynamic> json) => _$DiscoverMovieFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverMovieToJson(this);

  @override
  DiscoverMovie mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return DiscoverMovie(
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
