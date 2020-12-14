part of '_account.dart';

@JsonSerializable()
class AccountRatedMovies extends TResultsObject<MovieResumed> {
  AccountRatedMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory AccountRatedMovies.fromJson(Map<String, dynamic> json) =>
      _$AccountRatedMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRatedMoviesToJson(this);

  @override
  AccountRatedMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountRatedMovies(
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
class AccountRatedTvs extends TResultsObject<TvResumed> {
  AccountRatedTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory AccountRatedTvs.fromJson(Map<String, dynamic> json) => _$AccountRatedTvsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRatedTvsToJson(this);

  @override
  AccountRatedTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountRatedTvs(
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
