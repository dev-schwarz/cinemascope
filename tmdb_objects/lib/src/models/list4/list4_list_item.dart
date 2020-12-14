part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4ChangeListResults extends Equatable {
  final int mediaId;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;
  final bool success;

  List4ChangeListResults({
    this.mediaId,
    this.mediaType,
    this.success,
  });

  factory List4ChangeListResults.fromJson(Map<String, dynamic> json) =>
      _$List4ChangeListResultsFromJson(json);

  Map<String, dynamic> toJson() => _$List4ChangeListResultsToJson(this);

  @override
  List<Object> get props => [
        mediaId,
        mediaType,
        success,
      ];

  @override
  String toString() => _$List4ChangeListResultsToString(this);
}

@ToString()
@JsonSerializable()
class List4ListItem extends Equatable {
  final int mediaId;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;

  const List4ListItem({this.mediaId, this.mediaType});

  factory List4ListItem.fromJson(Map<String, dynamic> json) => _$List4ListItemFromJson(json);

  Map<String, dynamic> toJson() => _$List4ListItemToJson(this);

  @override
  List<Object> get props => [mediaId, mediaType];

  @override
  String toString() => _$List4ListItemToString(this);
}
