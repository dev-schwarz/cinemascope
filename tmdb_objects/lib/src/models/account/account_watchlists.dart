part of '_account.dart';

@JsonSerializable()
class AccountWatchListMovies extends TResultsObject<MovieResumed> {
  AccountWatchListMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory AccountWatchListMovies.fromJson(Map<String, dynamic> json) =>
      _$AccountWatchListMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$AccountWatchListMoviesToJson(this);

  @override
  AccountWatchListMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountWatchListMovies(
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
class AccountWatchListTvs extends TResultsObject<TvResumed> {
  AccountWatchListTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory AccountWatchListTvs.fromJson(Map<String, dynamic> json) =>
      _$AccountWatchListTvsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountWatchListTvsToJson(this);

  @override
  AccountWatchListTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountWatchListTvs(
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
