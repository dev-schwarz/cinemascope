part of '_tv.dart';

@ToString()
@JsonSerializable()
class TvCreatedBy extends Equatable {
  final int id;
  final String creditId;
  final String name;
  @JsonKey(fromJson: TPersonGender.fromJson, toJson: TPersonGender.toJson)
  final TPersonGender gender;
  final String profilePath;

  TvCreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  factory TvCreatedBy.fromJson(Map<String, dynamic> json) => _$TvCreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$TvCreatedByToJson(this);

  @override
  List<Object> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];

  @override
  String toString() => _$TvCreatedByToString(this);
}
