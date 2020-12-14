part of '_account.dart';

// statusCode descriptions:
//  1 - Success.
// 12 - The item/record was updated successfully.
// 13 - The item/record was deleted successfully.
const _toggleFavoriteResponseCodes = <int>[1, 12, 13];

@ToString()
@JsonSerializable()
class AccountMarkAsFavorite extends Equatable {
  final int statusCode;
  final String statusMessage;

  AccountMarkAsFavorite({this.statusCode, this.statusMessage});

  factory AccountMarkAsFavorite.fromJson(Map<String, dynamic> json) =>
      _$AccountMarkAsFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$AccountMarkAsFavoriteToJson(this);

  bool get isSuccess => _toggleFavoriteResponseCodes.contains(statusCode);

  @override
  List<Object> get props => [statusCode, statusMessage];

  @override
  String toString() => _$AccountMarkAsFavoriteToString(this);
}
