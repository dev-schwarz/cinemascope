part of '_common.dart';

@ToString()
@JsonSerializable()
class ProductionCompany extends Equatable {
  final int id;
  final String name;
  final String originCountry;
  final String logoPath;

  ProductionCompany({
    this.id,
    this.name,
    this.originCountry,
    this.logoPath,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        originCountry,
        logoPath,
      ];

  @override
  String toString() => _$ProductionCompanyToString(this);
}
