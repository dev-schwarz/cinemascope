part of '_people.dart';

@ToString()
@JsonSerializable()
class PersonResumed<T extends PersonKnownForObject> extends ResumedMedia {
  final String name;
  @JsonKey(fromJson: TPersonGender.fromJson, toJson: TPersonGender.toJson)
  final TPersonGender gender;
  final String knownForDepartment;
  final double popularity;
  final String profilePath;
  final bool adult;

  // FIXME: Os resultados são objetos do tipo ResumedMedia, que podem ser (MovieResumed, TvResumed ou PersonResumed).
  // A propriedade knownFor, de PersonResumed, retorna o seu JSON em formatos diferentes quando buscados no MultiSearch e no Trending.
  // Por este motivo, esta propriedade está desabilitada, até que se encontre uma solução.
  @_ConverterPersonKnownFor()
  @JsonKey(ignore: true)
  final List<T> knownFor;

  PersonResumed({
    int id,
    this.name,
    this.gender,
    this.knownForDepartment,
    this.popularity,
    this.profilePath,
    this.adult,
    this.knownFor,
  }) : super(id, TMediaType.person);

  factory PersonResumed.fromJson(Map<String, dynamic> json) => _$PersonResumedFromJson<T>(json);

  Map<String, dynamic> toJson() => _$PersonResumedToJson<T>(this);

  @override
  List<Object> get props => [
        id,
        mediaType,
        name,
        gender,
        knownForDepartment,
        popularity,
        profilePath,
        adult,
        knownFor,
      ];

  @override
  String toString() => _$PersonResumedToString(this);
}
