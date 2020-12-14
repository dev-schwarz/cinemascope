part of '_common.dart';

@ToString()
@JsonSerializable()
class ProductionCountry extends Equatable {
  final String name;
  final String iso_3166_1;

  ProductionCountry({
    this.name,
    this.iso_3166_1,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);

  @override
  List<Object> get props => [
        name,
        iso_3166_1,
      ];

  @override
  String toString() => _$ProductionCountryToString(this);
}
