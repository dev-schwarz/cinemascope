part of '_tv.dart';

@ToString()
@JsonSerializable()
class TvSeason extends Equatable {
  final int id;
  final String sId;
  final int seasonNumber;
  final String name;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime airDate;
  final int episodeCount;
  final String overview;
  final String posterPath;
  final List<TvEpisode> episodes;
  final TvImages images;

  TvSeason({
    this.id,
    this.sId,
    this.seasonNumber,
    this.name,
    this.airDate,
    this.episodeCount,
    this.overview,
    this.posterPath,
    this.episodes,
    this.images,
  });

  factory TvSeason.fromJson(Map<String, dynamic> json) => _$TvSeasonFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonToJson(this);

  @override
  List<Object> get props => [
        id,
        sId,
        seasonNumber,
        name,
        airDate,
        episodeCount,
        overview,
        posterPath,
        episodes,
        images,
      ];

  @override
  String toString() => _$TvSeasonToString(this);
}
