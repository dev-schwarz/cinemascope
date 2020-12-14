part of '_people.dart';

@ToString()
abstract class PersonKnownForObject extends Equatable {
  final int id;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;

  PersonKnownForObject(this.id, this.mediaType);

  Map<String, dynamic> toJson();

  @override
  String toString() => _$PersonKnownForObjectToString(this);
}

class _ConverterPersonKnownFor<T extends PersonKnownForObject> implements JsonConverter<T, Object> {
  const _ConverterPersonKnownFor();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      TMediaType mediaType;
      if (json.containsKey('media_type')) {
        if (json['media_type'] == 'movie') {
          mediaType = TMediaType.movie;
        } else if (json['media_type'] == 'tv') {
          mediaType = TMediaType.tv;
        }
      } else {
        if (json.containsKey('title')) {
          mediaType = TMediaType.movie;
        } else if (json.containsKey('name')) {
          mediaType = TMediaType.tv;
        }
      }

      print('_ConverterPersonKnownFor: $mediaType');

      if (mediaType == TMediaType.movie) {
        return PersonKnownForMovie.fromJson(json) as T;
      } else if (mediaType == TMediaType.tv) {
        return PersonKnownForTv.fromJson(json) as T;
      }
    }

    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}

@ToString()
@JsonSerializable()
class PersonKnownForMovie extends PersonKnownForObject {
  final String title;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime releaseDate;
  final String overview;
  final String originalTitle;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final bool video;
  final bool adult;
  final List<int> genreIds;

  // popularity

  PersonKnownForMovie({
    int id,
    this.title,
    this.releaseDate,
    this.overview,
    this.originalTitle,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.video,
    this.adult,
    this.genreIds,
  }) : super(id, TMediaType.movie);

  factory PersonKnownForMovie.fromJson(Map<String, dynamic> json) =>
      _$PersonKnownForMovieFromJson(json);

  Map<String, dynamic> toJson() => _$PersonKnownForMovieToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        title,
        releaseDate,
        overview,
        originalTitle,
        originalLanguage,
        voteCount,
        voteAverage,
        posterPath,
        backdropPath,
        video,
        adult,
        genreIds,
      ];

  @override
  String toString() => _$PersonKnownForMovieToString(this);
}

@ToString()
@JsonSerializable()
class PersonKnownForTv extends PersonKnownForObject {
  final String name;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime firstAirDate;
  final String overview;
  final String originalName;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final List<String> originCountry;
  final List<int> genreIds;

  PersonKnownForTv({
    int id,
    this.name,
    this.firstAirDate,
    this.overview,
    this.originalName,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.originCountry,
    this.genreIds,
  }) : super(id, TMediaType.tv);

  factory PersonKnownForTv.fromJson(Map<String, dynamic> json) => _$PersonKnownForTvFromJson(json);

  Map<String, dynamic> toJson() => _$PersonKnownForTvToJson(this);

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
        posterPath,
        backdropPath,
        originCountry,
        genreIds,
      ];

  @override
  String toString() => _$PersonKnownForTvToString(this);
}
