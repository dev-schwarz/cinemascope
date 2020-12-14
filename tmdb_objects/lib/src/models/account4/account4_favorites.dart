part of '_account4.dart';

@JsonSerializable()
class Account4FavoriteMovies extends TResultsObject<MovieResumed> {
  Account4FavoriteMovies({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<MovieResumed> results;

  factory Account4FavoriteMovies.fromJson(Map<String, dynamic> json) =>
      _$Account4FavoriteMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$Account4FavoriteMoviesToJson(this);

  @override
  Account4FavoriteMovies mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Account4FavoriteMovies(
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
class Account4FavoriteTvs extends TResultsObject<TvResumed> {
  Account4FavoriteTvs({
    int page,
    int totalPages,
    int totalResults,
    this.results,
  }) : super(page, totalPages, totalResults);

  final List<TvResumed> results;

  factory Account4FavoriteTvs.fromJson(Map<String, dynamic> json) =>
      _$Account4FavoriteTvsFromJson(json);

  Map<String, dynamic> toJson() => _$Account4FavoriteTvsToJson(this);

  @override
  Account4FavoriteTvs mergeResults(TResultsObject other) {
    if (!checkType(other)) return this;

    return Account4FavoriteTvs(
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
