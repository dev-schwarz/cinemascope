part of '_movie.dart';

@ToString()
@JsonSerializable()
class MovieCredits extends Credits {
  MovieCredits({
    List<Cast> cast,
    List<Crew> crew,
  }) : super(cast: cast, crew: crew);

  factory MovieCredits.fromJson(Map<String, dynamic> json) => _$MovieCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsToJson(this);

  @override
  List<Object> get props => super.props;

  @override
  String toString() => _$MovieCreditsToString(this);
}
