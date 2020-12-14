part of '_people.dart';

@ToString()
@JsonSerializable()
class Person extends Equatable {
  final int id;
  final String imdbId;
  final String name;
  @JsonKey(fromJson: TPersonGender.fromJson, toJson: TPersonGender.toJson)
  final TPersonGender gender;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime birthday;
  @JsonKey(fromJson: dateTimeFromString, toJson: dateTimeToString)
  final DateTime deathday;
  final String placeOfBirth;
  final String knownForDepartment;
  final String homepage;
  final String biography;
  final double popularity;
  final String profilePath;
  final bool adult;
  final List<String> alsoKnownAs;
  final PersonImages images;
  final PersonCredits credits;

  // TODO: Add knownFor property

  Person({
    this.id,
    this.imdbId,
    this.name,
    this.gender,
    this.birthday,
    this.deathday,
    this.placeOfBirth,
    this.knownForDepartment,
    this.homepage,
    this.biography,
    this.popularity,
    this.profilePath,
    this.adult,
    this.alsoKnownAs,
    this.images,
    this.credits,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object> get props => [
        id,
        imdbId,
        name,
        gender,
        birthday,
        deathday,
        placeOfBirth,
        knownForDepartment,
        homepage,
        biography,
        popularity,
        profilePath,
        adult,
        alsoKnownAs,
        images,
        credits,
      ];

  @override
  String toString() => _$PersonToString(this);
}
