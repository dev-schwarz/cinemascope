part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4RemoveItems extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;
  final List<List4ChangeListResults> results;

  List4RemoveItems({
    this.statusCode,
    this.statusMessage,
    this.success,
    this.results,
  });

  factory List4RemoveItems.fromJson(Map<String, dynamic> json) => _$List4RemoveItemsFromJson(json);

  Map<String, dynamic> toJson() => _$List4RemoveItemsToJson(this);

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        success,
        results,
      ];

  @override
  String toString() => _$List4RemoveItemsToString(this);
}
