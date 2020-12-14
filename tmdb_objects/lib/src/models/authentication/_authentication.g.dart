// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequestToken _$AuthenticationRequestTokenFromJson(
    Map<String, dynamic> json) {
  return AuthenticationRequestToken(
    requestToken: json['request_token'] as String,
  );
}

Map<String, dynamic> _$AuthenticationRequestTokenToJson(
        AuthenticationRequestToken instance) =>
    <String, dynamic>{
      'request_token': instance.requestToken,
    };

AuthenticationSessionId _$AuthenticationSessionIdFromJson(
    Map<String, dynamic> json) {
  return AuthenticationSessionId(
    sessionId: json['session_id'] as String,
  );
}

Map<String, dynamic> _$AuthenticationSessionIdToJson(
        AuthenticationSessionId instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
    };

AuthenticationSessionFromV4 _$AuthenticationSessionFromV4FromJson(
    Map<String, dynamic> json) {
  return AuthenticationSessionFromV4(
    sessionId: json['session_id'] as String,
  );
}

Map<String, dynamic> _$AuthenticationSessionFromV4ToJson(
        AuthenticationSessionFromV4 instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$AuthenticationRequestTokenToString(AuthenticationRequestToken o) {
  return """AuthenticationRequestToken{
  requestToken: ${o.requestToken},
}""";
}

String _$AuthenticationSessionIdToString(AuthenticationSessionId o) {
  return """AuthenticationSessionId{
  sessionId: ${o.sessionId},
}""";
}

String _$AuthenticationSessionFromV4ToString(AuthenticationSessionFromV4 o) {
  return """AuthenticationSessionFromV4{
  sessionId: ${o.sessionId},
}""";
}
