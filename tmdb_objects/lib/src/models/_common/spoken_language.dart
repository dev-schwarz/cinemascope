part of '_common.dart';

@ToString()
@JsonSerializable()
class SpokenLanguage extends Equatable {
  final String name;
  final String iso_639_1;

  SpokenLanguage({
    this.name,
    this.iso_639_1,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);

  @override
  List<Object> get props => [
        name,
        iso_639_1,
      ];

  @override
  String toString() => _$SpokenLanguageToString(this);
}
