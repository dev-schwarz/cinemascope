part of '_movie.dart';

@ToString()
@JsonSerializable()
class Movie extends Equatable {
  final int id;
  final String imdbId;
  final String title;
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
  final String tagline;
  final int budget;
  final int revenue;
  final int runtime;
  @JsonKey(name: 'status', fromJson: TMediaStatus.fromJson, toJson: TMediaStatus.toJson)
  final TMediaStatus mediaStatus;
  final String homepage;
  final bool video;
  final bool adult;
  final List<TGenre> genres;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;
  final VideoResults videos;
  final Credits credits;
  final MovieImages images;
  final ReleaseDateResults releaseDates;

  Movie({
    this.id,
    this.imdbId,
    this.title,
    this.releaseDate,
    this.overview,
    this.originalTitle,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.tagline,
    this.budget,
    this.revenue,
    this.runtime,
    this.mediaStatus,
    this.homepage,
    this.video,
    this.adult,
    this.genres,
    this.productionCompanies,
    this.productionCountries,
    this.spokenLanguages,
    this.videos,
    this.credits,
    this.images,
    this.releaseDates,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object> get props => [
        id,
        imdbId,
        title,
        releaseDate,
        overview,
        originalTitle,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        tagline,
        budget,
        revenue,
        runtime,
        mediaStatus,
        homepage,
        video,
        adult,
        genres,
        productionCompanies,
        productionCountries,
        spokenLanguages,
        videos,
        credits,
        images,
        releaseDates,
      ];

  @override
  String toString() => _$MovieToString(this);
}
