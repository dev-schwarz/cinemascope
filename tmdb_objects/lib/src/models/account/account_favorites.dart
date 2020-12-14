part of '_account.dart';

@JsonSerializable()
class AccountFavoriteMovies extends TResultsObject<MovieResumed> {
  AccountFavoriteMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory AccountFavoriteMovies.fromJson(Map<String, dynamic> json) =>
      _$AccountFavoriteMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$AccountFavoriteMoviesToJson(this);

  @override
  AccountFavoriteMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountFavoriteMovies(
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
class AccountFavoriteTvs extends TResultsObject<TvResumed> {
  AccountFavoriteTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory AccountFavoriteTvs.fromJson(Map<String, dynamic> json) =>
      _$AccountFavoriteTvsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountFavoriteTvsToJson(this);

  @override
  AccountFavoriteTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return AccountFavoriteTvs(
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
