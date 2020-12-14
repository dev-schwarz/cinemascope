part of '_common.dart';

@ToString()
@JsonSerializable()
class VideoResults extends Equatable {
  final List<Video> results;

  VideoResults({this.results});

  factory VideoResults.fromJson(Map<String, dynamic> json) => _$VideoResultsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResultsToJson(this);

  @override
  List<Object> get props => [results];

  @override
  String toString() => _$VideoResultsToString(this);
}

@ToString()
@JsonSerializable()
class Video extends Equatable {
  final String id;
  final String iso_639_1;
  final String iso_3166_1;
  final String key;
  final String site;
  final int size;
  @JsonKey(fromJson: TVideoType.fromJson, toJson: TVideoType.toJson)
  final TVideoType type;

  Video({
    this.id,
    this.iso_639_1,
    this.iso_3166_1,
    this.key,
    this.site,
    this.size,
    this.type,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  List<Object> get props => [
        id,
        iso_639_1,
        iso_3166_1,
        key,
        site,
        size,
        type,
      ];

  @override
  String toString() => _$VideoToString(this);
}
