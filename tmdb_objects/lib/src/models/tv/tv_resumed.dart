part of '_tv.dart';

@ToString()
@JsonSerializable()
class TvResumed extends ResumedMedia {
  final String name;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime firstAirDate;
  final String overview;
  final String originalName;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final List<String> originCountry;
  final List<int> genreIds;
  final double rating;

  TvResumed({
    int id,
    this.name,
    this.firstAirDate,
    this.overview,
    this.originalName,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originCountry,
    this.genreIds,
    this.rating,
  }) : super(id, TMediaType.tv);

  factory TvResumed.fromJson(Map<String, dynamic> json) => _$TvResumedFromJson(json);

  Map<String, dynamic> toJson() => _$TvResumedToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        name,
        firstAirDate,
        overview,
        originalName,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originCountry,
        genreIds,
        rating,
      ];

  @override
  String toString() => _$TvResumedToString(this);
}
