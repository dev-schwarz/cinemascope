part of '_account.dart';

@ToString()
@JsonSerializable()
class AccountDetails extends Equatable {
  final int id;
  final String name;
  final String username;
  final String iso_639_1;
  final String iso_3166_1;
  final bool includeAdult;
  final AccountDetailsAvatar avatar;

  AccountDetails({
    this.id,
    this.name,
    this.username,
    this.iso_639_1,
    this.iso_3166_1,
    this.includeAdult,
    this.avatar,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) => _$AccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        username,
        iso_639_1,
        iso_3166_1,
        includeAdult,
        avatar,
      ];

  @override
  String toString() => _$AccountDetailsToString(this);
}

@ToString()
@JsonSerializable()
class AccountDetailsAvatar extends Equatable {
  final AccountDetailsGravatar gravatar;

  AccountDetailsAvatar({this.gravatar});

  factory AccountDetailsAvatar.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsAvatarToJson(this);

  @override
  List<Object> get props => [gravatar];

  @override
  String toString() => _$AccountDetailsAvatarToString(this);
}

@ToString()
@JsonSerializable()
class AccountDetailsGravatar extends Equatable {
  final String hash;

  AccountDetailsGravatar({this.hash});

  factory AccountDetailsGravatar.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsGravatarFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsGravatarToJson(this);

  @override
  List<Object> get props => [hash];

  @override
  String toString() => _$AccountDetailsGravatarToString(this);
}
