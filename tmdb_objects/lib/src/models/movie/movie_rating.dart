part of '_movie.dart';

@ToString()
@JsonSerializable()
class RateMovie extends MediaRatingObject {
  RateMovie({int statusCode, String statusMessage})
      : super(
          statusCode,
          statusMessage,
          MediaRatingType.rate,
          TMediaType.movie,
        );

  factory RateMovie.fromJson(Map<String, dynamic> json) => _$RateMovieFromJson(json);

  Map<String, dynamic> toJson() => _$RateMovieToJson(this);

  @override
  String toString() => _$RateMovieToString(this);
}

@ToString()
@JsonSerializable()
class DeleteMovieRating extends MediaRatingObject {
  DeleteMovieRating({int statusCode, String statusMessage})
      : super(
          statusCode,
          statusMessage,
          MediaRatingType.unrate,
          TMediaType.movie,
        );

  factory DeleteMovieRating.fromJson(Map<String, dynamic> json) =>
      _$DeleteMovieRatingFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMovieRatingToJson(this);

  @override
  String toString() => _$DeleteMovieRatingToString(this);
}
