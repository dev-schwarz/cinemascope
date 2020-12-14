part of '_tv.dart';

@ToString()
@JsonSerializable()
class TvEpisode extends Equatable {
  final int id;
  final int seasonNumber;
  final int episodeNumber;
  final String name;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime airDate;
  final String productionCode;
  final String overview;
  final int voteCount;
  final double voteAverage;
  final String stillPath;
  final List<TvCrew> crew;
  final List<TvGuestStar> guestStars;
  final TvImages images;

  TvEpisode({
    this.id,
    this.seasonNumber,
    this.episodeNumber,
    this.name,
    this.airDate,
    this.productionCode,
    this.overview,
    this.voteCount,
    this.voteAverage,
    this.stillPath,
    this.crew,
    this.guestStars,
    this.images,
  });

  factory TvEpisode.fromJson(Map<String, dynamic> json) => _$TvEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$TvEpisodeToJson(this);

  @override
  List<Object> get props => [
        id,
        seasonNumber,
        episodeNumber,
        name,
        airDate,
        productionCode,
        overview,
        voteCount,
        voteAverage,
        stillPath,
        crew,
        guestStars,
        images,
      ];

  @override
  String toString() => _$TvEpisodeToString(this);
}
