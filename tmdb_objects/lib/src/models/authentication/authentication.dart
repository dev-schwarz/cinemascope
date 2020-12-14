part of '_authentication.dart';

@ToString()
@JsonSerializable()
class AuthenticationRequestToken extends Equatable {
  final String requestToken;

  AuthenticationRequestToken({this.requestToken});

  factory AuthenticationRequestToken.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationRequestTokenToJson(this);

  @override
  List<Object> get props => [requestToken];

  @override
  String toString() => _$AuthenticationRequestTokenToString(this);
}

@ToString()
@JsonSerializable()
class AuthenticationSessionId extends Equatable {
  final String sessionId;

  AuthenticationSessionId({this.sessionId});

  factory AuthenticationSessionId.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationSessionIdFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationSessionIdToJson(this);

  @override
  List<Object> get props => [sessionId];

  @override
  String toString() => _$AuthenticationSessionIdToString(this);
}

@ToString()
@JsonSerializable()
class AuthenticationSessionFromV4 extends Equatable {
  final String sessionId;

  AuthenticationSessionFromV4({this.sessionId});

  factory AuthenticationSessionFromV4.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationSessionFromV4FromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationSessionFromV4ToJson(this);

  @override
  List<Object> get props => [sessionId];

  @override
  String toString() => _$AuthenticationSessionFromV4ToString(this);
}
