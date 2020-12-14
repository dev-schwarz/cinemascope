part of '_common.dart';

@ToString()
@JsonSerializable()
class Credits extends Equatable {
  final List<Cast> cast;
  final List<Crew> crew;

  Credits({
    this.cast,
    this.crew,
  });

  factory Credits.fromJson(Map<String, dynamic> json) => _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);

  @override
  List<Object> get props => [
        cast,
        crew,
      ];

  @override
  String toString() => _$CreditsToString(this);
}

@ToString()
@JsonSerializable()
class Cast extends Equatable {
  final int id;
  final int castId;
  final String creditId;
  final String name;
  @JsonKey(fromJson: TPersonGender.fromJson, toJson: TPersonGender.toJson)
  final TPersonGender gender;
  final String character;
  final int order;
  final String profilePath;

  Cast({
    this.id,
    this.castId,
    this.creditId,
    this.name,
    this.gender,
    this.character,
    this.order,
    this.profilePath,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);

  @override
  List<Object> get props => [
        id,
        castId,
        creditId,
        name,
        gender,
        character,
        order,
        profilePath,
      ];

  @override
  String toString() => _$CastToString(this);
}

@ToString()
@JsonSerializable()
class Crew extends Equatable {
  final int id;
  final String creditId;
  final String name;
  @JsonKey(fromJson: TPersonGender.fromJson, toJson: TPersonGender.toJson)
  final TPersonGender gender;
  final String department;
  final String job;
  final String profilePath;

  Crew({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.department,
    this.job,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);

  @override
  List<Object> get props => [
        id,
        creditId,
        name,
        gender,
        department,
        job,
        profilePath,
      ];

  @override
  String toString() => _$CrewToString(this);
}
