part of '_account4.dart';

@JsonSerializable()
class Account4WatchListMovies extends TResultsObject<MovieResumed> {
  Account4WatchListMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory Account4WatchListMovies.fromJson(Map<String, dynamic> json) =>
      _$Account4WatchListMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$Account4WatchListMoviesToJson(this);

  @override
  Account4WatchListMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Account4WatchListMovies(
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

@JsonSerializable()
class Account4WatchListTvs extends TResultsObject<TvResumed> {
  Account4WatchListTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory Account4WatchListTvs.fromJson(Map<String, dynamic> json) =>
      _$Account4WatchListTvsFromJson(json);

  Map<String, dynamic> toJson() => _$Account4WatchListTvsToJson(this);

  @override
  Account4WatchListTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Account4WatchListTvs(
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
