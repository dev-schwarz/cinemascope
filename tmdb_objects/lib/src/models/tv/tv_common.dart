part of '_tv.dart';

@ToString()
@JsonSerializable()
class TvGuestStar extends Cast {
  TvGuestStar({
    int id,
    String creditId,
    String name,
    TPersonGender gender,
    String character,
    int order,
    String profilePath,
  }) : super(
          id: id,
          creditId: creditId,
          name: name,
          gender: gender,
          character: character,
          order: order,
          profilePath: profilePath,
        );

  factory TvGuestStar.fromJson(Map<String, dynamic> json) => _$TvGuestStarFromJson(json);

  Map<String, dynamic> toJson() => _$TvGuestStarToJson(this);

  @override
  List<Object> get props => [
        id,
        creditId,
        name,
        gender,
        character,
        order,
        profilePath,
      ];

  @override
  String toString() => _$TvGuestStarToString(this);
}

@ToString()
@JsonSerializable()
class TvCrew extends Crew {
  TvCrew({
    int id,
    String creditId,
    String name,
    TPersonGender gender,
    String department,
    String job,
    String profilePath,
  }) : super(
          id: id,
          creditId: creditId,
          name: name,
          gender: gender,
          department: department,
          job: job,
          profilePath: profilePath,
        );

  factory TvCrew.fromJson(Map<String, dynamic> json) => _$TvCrewFromJson(json);

  Map<String, dynamic> toJson() => _$TvCrewToJson(this);

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
  String toString() => _$TvCrewToString(this);
}
