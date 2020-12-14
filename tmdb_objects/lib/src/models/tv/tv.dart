part of '_tv.dart';

@ToString()
@JsonSerializable()
class Tv extends Equatable {
  final int id;
  final String name;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime firstAirDate;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime lastAirDate;
  final String overview;
  final String originalName;
  final String originalLanguage;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String posterPath;
  final String backdropPath;
  final String homepage;
  final String status;
  final String type;
  final bool inProduction;
  final TvEpisode lastEpisodeToAir;
  final List<String> originCountry;
  final List<TGenre> genres;
  final List<TvCreatedBy> createdBy;
  final List<int> episodeRunTime;
  final List<String> languages;
  final List<ProductionCompany> networks;
  final List<ProductionCompany> productionCompanies;
  final List<TvSeason> seasons;
  final Credits credits;
  final VideoResults videos;
  final TvImages images;

  Tv({
    this.id,
    this.name,
    this.numberOfSeasons,
    this.numberOfEpisodes,
    this.firstAirDate,
    this.lastAirDate,
    this.overview,
    this.originalName,
    this.originalLanguage,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.homepage,
    this.status,
    this.type,
    this.inProduction,
    this.lastEpisodeToAir,
    this.originCountry,
    this.genres,
    this.createdBy,
    this.episodeRunTime,
    this.languages,
    this.networks,
    this.productionCompanies,
    this.seasons,
    this.credits,
    this.videos,
    this.images,
  });

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);

  Map<String, dynamic> toJson() => _$TvToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        numberOfSeasons,
        numberOfEpisodes,
        firstAirDate,
        lastAirDate,
        overview,
        originalName,
        originalLanguage,
        voteCount,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        homepage,
        status,
        type,
        inProduction,
        lastEpisodeToAir,
        originCountry,
        genres,
        createdBy,
        episodeRunTime,
        languages,
        networks,
        productionCompanies,
        seasons,
        credits,
        videos,
        images,
      ];

  @override
  String toString() => _$TvToString(this);
}
