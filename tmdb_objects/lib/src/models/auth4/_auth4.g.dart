// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_auth4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth4RequestToken _$Auth4RequestTokenFromJson(Map<String, dynamic> json) {
  return Auth4RequestToken(
    statusCode: json['status_code'] as int,
    success: json['success'] as bool,
    statusMessage: json['status_message'] as String,
    requestToken: json['request_token'] as String,
  );
}

Map<String, dynamic> _$Auth4RequestTokenToJson(Auth4RequestToken instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'success': instance.success,
      'status_message': instance.statusMessage,
      'request_token': instance.requestToken,
    };

Auth4AccessToken _$Auth4AccessTokenFromJson(Map<String, dynamic> json) {
  return Auth4AccessToken(
    statusCode: json['status_code'] as int,
    success: json['success'] as bool,
    statusMessage: json['status_message'] as String,
    accessToken: json['access_token'] as String,
    accountId: json['account_id'] as String,
  );
}

Map<String, dynamic> _$Auth4AccessTokenToJson(Auth4AccessToken instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'success': instance.success,
      'status_message': instance.statusMessage,
      'access_token': instance.accessToken,
      'account_id': instance.accountId,
    };

Auth4DeleteAccessToken _$Auth4DeleteAccessTokenFromJson(
    Map<String, dynamic> json) {
  return Auth4DeleteAccessToken(
    statusCode: json['status_code'] as int,
    success: json['success'] as bool,
    statusMessage: json['status_message'] as String,
  );
}

Map<String, dynamic> _$Auth4DeleteAccessTokenToJson(
        Auth4DeleteAccessToken instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'success': instance.success,
      'status_message': instance.statusMessage,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$Auth4RequestTokenToString(Auth4RequestToken o) {
  return """Auth4RequestToken{
  statusCode: ${o.statusCode},
  success: ${o.success},
  statusMessage: ${o.statusMessage},
  requestToken: ${o.requestToken},
}""";
}

String _$Auth4AccessTokenToString(Auth4AccessToken o) {
  return """Auth4AccessToken{
  statusCode: ${o.statusCode},
  success: ${o.success},
  statusMessage: ${o.statusMessage},
  accessToken: ${o.accessToken},
  accountId: ${o.accountId},
}""";
}

String _$Auth4DeleteAccessTokenToString(Auth4DeleteAccessToken o) {
  return """Auth4DeleteAccessToken{
  statusCode: ${o.statusCode},
  success: ${o.success},
  statusMessage: ${o.statusMessage},
}""";
}
