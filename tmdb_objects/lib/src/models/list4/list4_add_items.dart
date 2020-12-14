part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4AddItems extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;
  final List<List4ChangeListResults> results;

  List4AddItems({
    this.statusCode,
    this.statusMessage,
    this.success,
    this.results,
  });

  factory List4AddItems.fromJson(Map<String, dynamic> json) => _$List4AddItemsFromJson(json);

  Map<String, dynamic> toJson() => _$List4AddItemsToJson(this);

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        success,
        results,
      ];

  @override
  String toString() => _$List4AddItemsToString(this);
}
