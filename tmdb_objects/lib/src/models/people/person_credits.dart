part of '_people.dart';

@ToString()
@JsonSerializable()
class PersonCredits<T extends PersonCreditsObject> extends Equatable {
  final int id;
  @_ConverterPersonCredits()
  final List<T> cast;
  @_ConverterPersonCredits()
  final List<T> crew;

  PersonCredits({
    this.id,
    this.cast,
    this.crew,
  });

  factory PersonCredits.fromJson(Map<String, dynamic> json) => _$PersonCreditsFromJson<T>(json);

  Map<String, dynamic> toJson() => _$PersonCreditsToJson<T>(this);

  @override
  List<Object> get props => [
        id,
        cast,
        crew,
      ];

  @override
  String toString() => _$PersonCreditsToString(this);
}

class _ConverterPersonCredits<T extends PersonCreditsObject> implements JsonConverter<T, Object> {
  const _ConverterPersonCredits();

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

      if (json.containsKey('character')) {
        // cast
        if (mediaType == TMediaType.movie) {
          return PersonCastMovie.fromJson(json) as T;
        } else if (mediaType == TMediaType.tv) {
          return PersonCastTv.fromJson(json) as T;
        }
      } else if (json.containsKey('job')) {
        // crew
        if (mediaType == TMediaType.movie) {
          return PersonCrewMovie.fromJson(json) as T;
        } else if (mediaType == TMediaType.tv) {
          return PersonCrewTv.fromJson(json) as T;
        }
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
abstract class PersonCreditsObject extends Equatable {
  final int id;
  @JsonKey(fromJson: TMediaType.fromJson, toJson: TMediaType.toJson)
  final TMediaType mediaType;

  PersonCreditsObject(this.id, this.mediaType);

  Map<String, dynamic> toJson();

  @override
  String toString() => _$PersonCreditsObjectToString(this);
}

@ToString()
@JsonSerializable()
class PersonCastMovie extends PersonCreditsObject {
  final String creditId;
  final String title;
  final String character;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime releaseDate;
  final String overview;
  final String originalTitle;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final bool video;
  final bool adult;
  final List<int> genreIds;

  PersonCastMovie({
    int id,
    this.creditId,
    this.title,
    this.character,
    this.releaseDate,
    this.overview,
    this.originalTitle,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.video,
    this.adult,
    this.genreIds,
  }) : super(id, TMediaType.movie);

  factory PersonCastMovie.fromJson(Map<String, dynamic> json) => _$PersonCastMovieFromJson(json);

  Map<String, dynamic> toJson() => _$PersonCastMovieToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        creditId,
        title,
        character,
        releaseDate,
        overview,
        originalTitle,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        video,
        adult,
        genreIds,
      ];

  @override
  String toString() => _$PersonCastMovieToString(this);
}

@ToString()
@JsonSerializable()
class PersonCastTv extends PersonCreditsObject {
  final String creditId;
  final String name;
  final String character;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime firstAirDate;
  final int episodeCount;
  final String overview;
  final String originalName;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final List<String> originCountry;
  final List<int> genreIds;

  PersonCastTv({
    int id,
    this.creditId,
    this.name,
    this.character,
    this.firstAirDate,
    this.episodeCount,
    this.overview,
    this.originalName,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originCountry,
    this.genreIds,
  }) : super(id, TMediaType.tv);

  factory PersonCastTv.fromJson(Map<String, dynamic> json) => _$PersonCastTvFromJson(json);

  Map<String, dynamic> toJson() => _$PersonCastTvToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        creditId,
        name,
        character,
        firstAirDate,
        episodeCount,
        overview,
        originalName,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originCountry,
        genreIds,
      ];

  @override
  String toString() => _$PersonCastTvToString(this);
}

@ToString()
@JsonSerializable()
class PersonCrewMovie extends PersonCreditsObject {
  final String creditId;
  final String title;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime releaseDate;
  final String department;
  final String job;
  final String overview;
  final String originalTitle;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final bool video;
  final bool adult;
  final List<int> genreIds;

  PersonCrewMovie({
    int id,
    this.creditId,
    this.title,
    this.releaseDate,
    this.department,
    this.job,
    this.overview,
    this.originalTitle,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.video,
    this.adult,
    this.genreIds,
  }) : super(id, TMediaType.movie);

  factory PersonCrewMovie.fromJson(Map<String, dynamic> json) => _$PersonCrewMovieFromJson(json);

  Map<String, dynamic> toJson() => _$PersonCrewMovieToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        creditId,
        title,
        releaseDate,
        department,
        job,
        overview,
        originalTitle,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        video,
        adult,
        genreIds,
      ];

  @override
  String toString() => _$PersonCrewMovieToString(this);
}

@ToString()
@JsonSerializable()
class PersonCrewTv extends PersonCreditsObject {
  final String creditId;
  final String name;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime firstAirDate;
  final String department;
  final String job;
  final int episodeCount;
  final String overview;
  final String originalName;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final List<String> originCountry;
  final List<int> genreIds;

  PersonCrewTv({
    int id,
    this.creditId,
    this.name,
    this.firstAirDate,
    this.department,
    this.job,
    this.episodeCount,
    this.overview,
    this.originalName,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originCountry,
    this.genreIds,
  }) : super(id, TMediaType.tv);

  factory PersonCrewTv.fromJson(Map<String, dynamic> json) => _$PersonCrewTvFromJson(json);

  Map<String, dynamic> toJson() => _$PersonCrewTvToJson(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        creditId,
        name,
        firstAirDate,
        department,
        job,
        episodeCount,
        overview,
        originalName,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originCountry,
        genreIds,
      ];

  @override
  String toString() => _$PersonCrewTvToString(this);
}
