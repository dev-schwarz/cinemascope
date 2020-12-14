part of '_common.dart';

enum MediaRatingType { rate, unrate }

// statusCode descriptions:
//  1 - Success.
// 12 - The item/record was updated successfully.
// 13 - The item/record was deleted successfully.
const _rateResponseCodes = <MediaRatingType, List<int>>{
  MediaRatingType.rate: <int>[1, 12],
  MediaRatingType.unrate: <int>[13],
};

@ToString()
abstract class MediaRatingObject extends Equatable {
  final int statusCode;
  final String statusMessage;
  @JsonKey(ignore: true)
  final MediaRatingType ratingType;
  @JsonKey(ignore: true)
  final TMediaType mediaType;

  MediaRatingObject(
    this.statusCode,
    this.statusMessage,
    this.ratingType,
    this.mediaType,
  );

  Map<String, dynamic> toJson();

  bool get isSuccess => _rateResponseCodes[ratingType].contains(statusCode);

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        ratingType,
        mediaType,
      ];

  @override
  String toString() => _$MediaRatingObjectToString(this);
}
