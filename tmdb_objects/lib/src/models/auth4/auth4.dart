part of '_auth4.dart';

@ToString()
@JsonSerializable()
class Auth4RequestToken extends Equatable {
  final int statusCode;
  final bool success;
  final String statusMessage;
  final String requestToken;

  Auth4RequestToken({
    this.statusCode,
    this.success,
    this.statusMessage,
    this.requestToken,
  });

  factory Auth4RequestToken.fromJson(Map<String, dynamic> json) =>
      _$Auth4RequestTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth4RequestTokenToJson(this);

  bool get isSuccess => (success != null && success);

  @override
  List<Object> get props => [
        statusCode,
        success,
        statusMessage,
        requestToken,
      ];

  @override
  String toString() => _$Auth4RequestTokenToString(this);
}

@ToString()
@JsonSerializable()
class Auth4AccessToken extends Equatable {
  final int statusCode;
  final bool success;
  final String statusMessage;
  final String accessToken;
  final String accountId;

  Auth4AccessToken({
    this.statusCode,
    this.success,
    this.statusMessage,
    this.accessToken,
    this.accountId,
  });

  factory Auth4AccessToken.fromJson(Map<String, dynamic> json) => _$Auth4AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth4AccessTokenToJson(this);

  bool get isSuccess => (success != null && success);

  @override
  List<Object> get props => [
        statusCode,
        success,
        statusMessage,
        accessToken,
        accountId,
      ];

  @override
  String toString() => _$Auth4AccessTokenToString(this);
}

@ToString()
@JsonSerializable()
class Auth4DeleteAccessToken extends Equatable {
  final int statusCode;
  final bool success;
  final String statusMessage;

  Auth4DeleteAccessToken({
    this.statusCode,
    this.success,
    this.statusMessage,
  });

  factory Auth4DeleteAccessToken.fromJson(Map<String, dynamic> json) =>
      _$Auth4DeleteAccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth4DeleteAccessTokenToJson(this);

  bool get isSuccess => (success != null && success);

  @override
  List<Object> get props => [
        statusCode,
        success,
        statusMessage,
      ];

  @override
  String toString() => _$Auth4DeleteAccessTokenToString(this);
}
