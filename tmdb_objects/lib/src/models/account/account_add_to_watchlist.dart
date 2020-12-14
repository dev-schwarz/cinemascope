part of '_account.dart';

// statusCode descriptions:
//  1 - Success.
// 12 - The item/record was updated successfully.
// 13 - The item/record was deleted successfully.
const _changeWatchlistResponseCodes = <int>[1, 12, 13];

@ToString()
@JsonSerializable()
class AccountAddToWatchlist extends Equatable {
  final int statusCode;
  final String statusMessage;

  AccountAddToWatchlist({this.statusCode, this.statusMessage});

  factory AccountAddToWatchlist.fromJson(Map<String, dynamic> json) =>
      _$AccountAddToWatchlistFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAddToWatchlistToJson(this);

  bool get isSuccess => _changeWatchlistResponseCodes.contains(statusCode);

  @override
  List<Object> get props => [statusCode, statusMessage];

  @override
  String toString() => _$AccountAddToWatchlistToString(this);
}
