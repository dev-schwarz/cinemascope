part of '_common.dart';

@ToString()
@JsonSerializable()
class TGenre extends Equatable {
  final int id;
  final String name;

  TGenre({this.id, this.name});

  factory TGenre.fromJson(Map<String, dynamic> json) => _$TGenreFromJson(json);

  Map<String, dynamic> toJson() => _$TGenreToJson(this);

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => _$TGenreToString(this);
}
