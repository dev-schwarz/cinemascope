part of '_common_objects.dart';

class TVideoType extends Equatable {
  const TVideoType._(this.index);

  final int index;

  factory TVideoType.fromString(String type) {
    return const <String, TVideoType>{
      'Trailer': trailer,
      'Teaser': teaser,
      'Clip': clip,
      'Featurette': featurette,
      'Behind the Scenes': behindTheScenes,
      'Bloopers': bloopers,
      'Opening Credits': openingCredits,
    }[type];
  }

  static const TVideoType trailer = const TVideoType._(0);

  static const TVideoType teaser = const TVideoType._(1);

  static const TVideoType clip = const TVideoType._(2);

  static const TVideoType featurette = const TVideoType._(3);

  static const TVideoType behindTheScenes = const TVideoType._(4);

  static const TVideoType bloopers = const TVideoType._(5);

  static const TVideoType openingCredits = const TVideoType._(6);

  static const List<TVideoType> values = const <TVideoType>[
    trailer,
    teaser,
    clip,
    featurette,
    behindTheScenes,
    bloopers,
    openingCredits,
  ];

  static TVideoType fromJson(String type) => TVideoType.fromString(type);

  static String toJson(TVideoType type) => type.toString();

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(dynamic o) => (o is TVideoType && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'Trailer',
      1: 'Teaser',
      2: 'Clip',
      3: 'Featurette',
      4: 'Behind the Scenes',
      5: 'Bloopers',
      6: 'Opening Credits',
    }[index];
  }
}

class TMediaStatus extends Equatable {
  const TMediaStatus._(this.index);

  final int index;

  factory TMediaStatus.fromString(String status) {
    return const <String, TMediaStatus>{
      'Rumored': rumored,
      'Planned': planned,
      'In Production': inProduction,
      'Post Production': postProduction,
      'Released': released,
      'Canceled': canceled,
    }[status];
  }

  static const TMediaStatus rumored = const TMediaStatus._(0);

  static const TMediaStatus planned = const TMediaStatus._(1);

  static const TMediaStatus inProduction = const TMediaStatus._(2);

  static const TMediaStatus postProduction = const TMediaStatus._(3);

  static const TMediaStatus released = const TMediaStatus._(4);

  static const TMediaStatus canceled = const TMediaStatus._(5);

  static const List<TMediaStatus> values = const <TMediaStatus>[
    rumored,
    planned,
    inProduction,
    postProduction,
    released,
    canceled,
  ];

  static TMediaStatus fromJson(String status) => TMediaStatus.fromString(status);

  static String toJson(TMediaStatus status) => status.toString();

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(dynamic o) => (o is TMediaStatus && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'Rumored',
      1: 'Planned',
      2: 'In Production',
      3: 'Post Production',
      4: 'Released',
      5: 'Canceled',
    }[index];
  }
}

class TMediaType extends Equatable {
  const TMediaType._(this.index);

  final int index;

  factory TMediaType.fromString(String mediaType) {
    return const <String, TMediaType>{
      'movie': movie,
      'tv': tv,
      'person': person,
    }[mediaType];
  }

  static const TMediaType movie = const TMediaType._(0);

  static const TMediaType tv = const TMediaType._(1);

  static const TMediaType person = const TMediaType._(2);

  static const List<TMediaType> values = const <TMediaType>[movie, tv, person];

  static TMediaType fromJson(String mediaType) => TMediaType.fromString(mediaType);

  static String toJson(TMediaType mediaType) => mediaType.toString();

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(dynamic o) => (o is TMediaType && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'movie',
      1: 'tv',
      2: 'person',
    }[index];
  }
}

class TTrendingMediaType extends Equatable {
  const TTrendingMediaType._(this.index);

  final int index;

  factory TTrendingMediaType.fromString(String mediaType) {
    return const <String, TTrendingMediaType>{
      'all': all,
      'movie': movie,
      'tv': tv,
      'person': person,
    }[mediaType];
  }

  static const TTrendingMediaType all = const TTrendingMediaType._(0);

  static const TTrendingMediaType movie = const TTrendingMediaType._(1);

  static const TTrendingMediaType tv = const TTrendingMediaType._(2);

  static const TTrendingMediaType person = const TTrendingMediaType._(3);

  static const List<TTrendingMediaType> values = const <TTrendingMediaType>[
    all,
    movie,
    tv,
    person,
  ];

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(Object o) => (o is TTrendingMediaType && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'all',
      1: 'movie',
      2: 'tv',
      3: 'person',
    }[index];
  }
}

class TTrendingTimeWindow extends Equatable {
  const TTrendingTimeWindow._(this.index);

  final int index;

  factory TTrendingTimeWindow.fromString(String timeWindow) {
    return const <String, TTrendingTimeWindow>{
      'day': day,
      'week': week,
    }[timeWindow];
  }

  static const TTrendingTimeWindow day = TTrendingTimeWindow._(0);

  static const TTrendingTimeWindow week = TTrendingTimeWindow._(1);

  static const List<TTrendingTimeWindow> values = <TTrendingTimeWindow>[
    day,
    week,
  ];

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(Object o) => (o is TTrendingTimeWindow && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'day',
      1: 'week',
    }[index];
  }
}

class TPersonGender extends Equatable {
  const TPersonGender._(this.index);

  final int index;

  factory TPersonGender.fromInt(int gender) {
    return const <int, TPersonGender>{
      0: other,
      1: female,
      2: male,
    }[gender];
  }

  static const TPersonGender other = const TPersonGender._(0);

  static const TPersonGender female = const TPersonGender._(1);

  static const TPersonGender male = const TPersonGender._(2);

  static const List<TPersonGender> values = const <TPersonGender>[
    other,
    female,
    male,
  ];

  static TPersonGender fromJson(int gender) => TPersonGender.fromInt(gender);

  static int toJson(TPersonGender gender) => gender.toInt();

  int toInt() => index;

  @override
  List<Object> get props => [index];

  @override
  bool operator ==(dynamic o) => (o is TPersonGender && o.index == index);

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() {
    return const <int, String>{
      0: 'other',
      1: 'female',
      2: 'male',
    }[index];
  }
}
