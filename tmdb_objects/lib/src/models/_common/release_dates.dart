part of '_common.dart';

@ToString()
@JsonSerializable()
class ReleaseDateResults extends Equatable {
  final List<ReleaseDate> results;

  ReleaseDateResults({this.results});

  factory ReleaseDateResults.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDateResultsToJson(this);

  @override
  List<Object> get props => [results];

  @override
  String toString() => _$ReleaseDateResultsToString(this);
}

@ToString()
@JsonSerializable()
class ReleaseDate extends Equatable {
  final String iso_3166_1;
  final List<ReleaseDateItem> releaseDates;

  ReleaseDate({this.iso_3166_1, this.releaseDates});

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => _$ReleaseDateFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDateToJson(this);

  @override
  List<Object> get props => [iso_3166_1, releaseDates];

  @override
  String toString() => _$ReleaseDateToString(this);
}

@ToString()
@JsonSerializable()
class ReleaseDateItem extends Equatable {
  final String certification;
  final String iso_639_1;
  final String note;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime releaseDate;
  final int type;

  ReleaseDateItem({this.certification, this.iso_639_1, this.note, this.releaseDate, this.type});

  factory ReleaseDateItem.fromJson(Map<String, dynamic> json) => _$ReleaseDateItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseDateItemToJson(this);

  @override
  List<Object> get props => [certification, iso_639_1, note, releaseDate, type];

  @override
  String toString() => _$ReleaseDateItemToString(this);
}
