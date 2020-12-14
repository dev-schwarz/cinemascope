part of '_common.dart';

@ToString()
@JsonSerializable()
class MovieImages extends Equatable {
  final List<MediaImage> posters;
  final List<MediaImage> backdrops;

  MovieImages({
    this.posters,
    this.backdrops,
  });

  factory MovieImages.fromJson(Map<String, dynamic> json) => _$MovieImagesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImagesToJson(this);

  @override
  List<Object> get props => [
        posters,
        backdrops,
      ];

  @override
  String toString() => _$MovieImagesToString(this);
}

@ToString()
@JsonSerializable()
class TvImages extends Equatable {
  final List<MediaImage> posters;
  final List<MediaImage> backdrops;
  final List<MediaImage> stills;

  TvImages({
    this.posters,
    this.backdrops,
    this.stills,
  });

  factory TvImages.fromJson(Map<String, dynamic> json) => _$TvImagesFromJson(json);

  Map<String, dynamic> toJson() => _$TvImagesToJson(this);

  @override
  List<Object> get props => [
        posters,
        backdrops,
        stills,
      ];

  @override
  String toString() => _$TvImagesToString(this);
}

@ToString()
@JsonSerializable()
class PersonImages extends Equatable {
  final List<MediaImage> profiles;

  PersonImages({this.profiles});

  factory PersonImages.fromJson(Map<String, dynamic> json) => _$PersonImagesFromJson(json);

  Map<String, dynamic> toJson() => _$PersonImagesToJson(this);

  @override
  List<Object> get props => [profiles];

  @override
  String toString() => _$PersonImagesToString(this);
}

@ToString()
@JsonSerializable()
class MediaImage extends Equatable {
  final int height;
  final int width;
  final double aspectRatio;
  final String iso_639_1;
  final int voteCount;
  final double voteAverage;
  final String filePath;

  MediaImage({
    this.height,
    this.width,
    this.aspectRatio,
    this.iso_639_1,
    this.voteCount,
    this.voteAverage,
    this.filePath,
  });

  factory MediaImage.fromJson(Map<String, dynamic> json) => _$MediaImageFromJson(json);

  Map<String, dynamic> toJson() => _$MediaImageToJson(this);

  @override
  List<Object> get props => [
        height,
        width,
        aspectRatio,
        iso_639_1,
        voteCount,
        voteAverage,
        filePath,
      ];

  @override
  String toString() => _$MediaImageToString(this);
}
