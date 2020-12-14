part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4Delete extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  List4Delete({
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  factory List4Delete.fromJson(Map<String, dynamic> json) => _$List4DeleteFromJson(json);

  Map<String, dynamic> toJson() => _$List4DeleteToJson(this);

  bool get isSuccess => (success != null && success);

  @override
  List<Object> get props => [
        statusCode,
        statusMessage,
        success,
      ];

  @override
  String toString() => _$List4DeleteToString(this);
}
