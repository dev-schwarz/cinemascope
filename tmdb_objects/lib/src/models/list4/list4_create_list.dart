part of '_list4.dart';

@ToString()
@JsonSerializable()
class List4Create extends Equatable {
  final int id;
  final int statusCode;
  final String statusMessage;
  final bool success;

  List4Create({
    this.id,
    this.statusCode,
    this.statusMessage,
    this.success,
  });

  factory List4Create.fromJson(Map<String, dynamic> json) => _$List4CreateFromJson(json);

  Map<String, dynamic> toJson() => _$List4CreateToJson(this);

  bool get isSuccess => (success != null && success);

  @override
  List<Object> get props => [
        id,
        statusCode,
        statusMessage,
        success,
      ];

  @override
  String toString() => _$List4CreateToString(this);
}
