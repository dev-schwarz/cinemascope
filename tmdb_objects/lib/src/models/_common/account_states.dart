part of '_common.dart';

@ToString()
@JsonSerializable()
class TAccountStates extends Equatable {
  const TAccountStates({
    this.id,
    this.favorite,
    this.watchList,
    this.rated,
  });

  final int id;
  final bool favorite;
  @JsonKey(name: 'watchlist')
  final bool watchList;
  @JsonKey(fromJson: _TAccountStatesRatedFromJson, toJson: _TAccountStatesRatedToJson)
  final TAccountStatesRated rated;

  factory TAccountStates.fromJson(Map<String, dynamic> json) => _$TAccountStatesFromJson(json);

  Map<String, dynamic> toJson() => _$TAccountStatesToJson(this);

  TAccountStates copyWith({bool favorite, bool watchList, TAccountStatesRated rated}) =>
      TAccountStates(
        id: this.id,
        favorite: favorite ?? this.favorite,
        watchList: watchList ?? this.watchList,
        rated: rated ?? this.rated,
      );

  @override
  List<Object> get props => [
        id,
        favorite,
        watchList,
        rated,
      ];

  @override
  String toString() => _$TAccountStatesToString(this);

  static TAccountStatesRated _TAccountStatesRatedFromJson(dynamic value) {
    return (value is bool)
        ? TAccountStatesRated(isRated: false, value: 0.0)
        : TAccountStatesRated.fromJson(value);
  }

  static dynamic _TAccountStatesRatedToJson(TAccountStatesRated obj) {
    return (obj.isRated) ? <String, dynamic>{'value': obj.value} : false;
  }
}

@ToString()
@JsonSerializable()
class TAccountStatesRated extends Equatable {
  const TAccountStatesRated({
    this.isRated,
    this.value,
  });

  @JsonKey(defaultValue: true)
  final bool isRated;
  final double value;

  factory TAccountStatesRated.fromJson(Map<String, dynamic> json) =>
      _$TAccountStatesRatedFromJson(json);

  Map<String, dynamic> toJson() => _$TAccountStatesRatedToJson(this);

  @override
  List<Object> get props => [isRated, value];

  @override
  String toString() => _$TAccountStatesRatedToString(this);
}
