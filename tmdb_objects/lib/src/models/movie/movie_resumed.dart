part of '_movie.dart';

@ToString()
@JsonSerializable()
class MovieResumed extends ResumedMedia {
  final String title;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime releaseDate;
  final String overview;
  final String originalTitle;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final bool video;
  final bool adult;
  final List<int> genreIds;
  final double rating;

  MovieResumed({
    int id,
    this.title,
    this.releaseDate,
    this.overview,
    this.originalTitle,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.video,
    this.adult,
    this.genreIds,
    this.rating,
  }) : super(id, TMediaType.movie);

  factory MovieResumed.fromJson(Map<String, dynamic> json) => _$MovieResumedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieResumedToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        title,
        releaseDate,
        overview,
        originalTitle,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        video,
        adult,
        genreIds,
        rating,
      ];

  @override
  String toString() => _$MovieResumedToString(this);
}
