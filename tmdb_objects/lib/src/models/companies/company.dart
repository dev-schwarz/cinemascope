part of '_company.dart';

@ToString()
@JsonSerializable()
class Company extends Equatable {
  final int id;
  final String name;
  final String description;
  final String headquarters;
  final String homepage;
  final String originCountry;
  final String logoPath;

  Company({
    this.id,
    this.name,
    this.description,
    this.headquarters,
    this.homepage,
    this.originCountry,
    this.logoPath,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        description,
        headquarters,
        homepage,
        originCountry,
        logoPath,
      ];

  @override
  String toString() => _$CompanyToString(this);
}
