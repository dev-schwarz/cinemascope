part of '_tv.dart';

@ToString()
@JsonSerializable()
class RateTv extends MediaRatingObject {
  RateTv({int statusCode, String statusMessage})
      : super(
          statusCode,
          statusMessage,
          MediaRatingType.rate,
          TMediaType.tv,
        );

  factory RateTv.fromJson(Map<String, dynamic> json) => _$RateTvFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RateTvToJson(this);

  @override
  String toString() => _$RateTvToString(this);
}

@ToString()
@JsonSerializable()
class DeleteTvRating extends MediaRatingObject {
  DeleteTvRating({int statusCode, String statusMessage})
      : super(
          statusCode,
          statusMessage,
          MediaRatingType.unrate,
          TMediaType.tv,
        );

  factory DeleteTvRating.fromJson(Map<String, dynamic> json) => _$DeleteTvRatingFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTvRatingToJson(this);

  @override
  String toString() => _$DeleteTvRatingToString(this);
}
