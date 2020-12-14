part of '_common.dart';

@ToString()
abstract class ResumedMedia extends Equatable {
  final int id;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;

  ResumedMedia(this.id, this.mediaType);

  Map<String, dynamic> toJson();

  @override
  String toString() => _$ResumedMediaToString(this);
}
