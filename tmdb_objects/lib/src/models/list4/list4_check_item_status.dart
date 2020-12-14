part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4CheckItemStatus extends Equatable {
  List4CheckItemStatus({
    this.statusCode,
    this.statusMessage,
    this.success,
    this.id,
    this.mediaId,
    this.mediaType,
  });

  final int statusCode;
  final String statusMessage;
  final bool success;
  final int id;
  final int mediaId;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;

  factory List4CheckItemStatus.fromJson(Map<String, dynamic> json) =>
      _$List4CheckItemStatusFromJson(json);

  Map<String, dynamic> toJson() => _$List4CheckItemStatusToJson(this);

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        success,
        id,
        mediaId,
        mediaType,
      ];

  @override
  String toString() => _$List4CheckItemStatusToString(this);
}
