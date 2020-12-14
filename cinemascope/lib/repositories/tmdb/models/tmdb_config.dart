part of '../tmdb_repository.dart';

const _baseUrl = 'http://image.tmdb.org/t/p/';
const _secureBaseUrl = 'https://image.tmdb.org/t/p/';
const _baseYoutubeVideoUrl = 'https://www.youtube.com/watch?v=';

abstract class TmdbConfig {
  static bool includeAdult = false;
  static TmdbConfigurationLanguage language = TmdbConfigurationLanguage.en_US;
  static TmdbConfigurationRegion region = TmdbConfigurationRegion.US;

//  static PosterSize posterSize = PosterSize.w342;
  static PosterSize posterSize = PosterSize.w185;
  static BackdropSize backdropSize = BackdropSize.w780;
  static ProfileSize profileSize = ProfileSize.w185;
  static StillSize stillSize = StillSize.w300;
  static LogoSize logoSize = LogoSize.w300;

  static void restoreDefautls() {
    includeAdult = false;
    language = TmdbConfigurationLanguage.en_US;
    region = TmdbConfigurationRegion.US;
    posterSize = PosterSize.w342;
    backdropSize = BackdropSize.w300;
    profileSize = ProfileSize.w185;
    stillSize = StillSize.w300;
    logoSize = LogoSize.w300;
  }

  static String makePosterUrl(String uri, {PosterSize size}) =>
      uri == null ? null : '$_baseUrl${(size ?? posterSize).size}$uri';

  static String makeBackdropUrl(String uri, {BackdropSize size}) =>
      uri == null ? null : '$_baseUrl${(size ?? backdropSize).size}$uri';

  static String makeProfileUrl(String uri, {ProfileSize size}) =>
      uri == null ? null : '$_baseUrl${(size ?? profileSize).size}$uri';

  static String makeStillUrl(String uri, {StillSize size}) =>
      uri == null ? null : '$_baseUrl${(size ?? stillSize).size}$uri';

  static String makeLogoUrl(String uri, {LogoSize size}) =>
      uri == null ? null : '$_baseUrl${(size ?? logoSize).size}$uri';

  static String makeVideoUrl(String uri) => uri == null ? null : '$_baseYoutubeVideoUrl$uri';
}

class TmdbConfigurationRegion {
  const TmdbConfigurationRegion._(this.index);

  final int index;

  static const TmdbConfigurationRegion US = TmdbConfigurationRegion._(0);

  static const TmdbConfigurationRegion BR = TmdbConfigurationRegion._(1);

  static const List<TmdbConfigurationRegion> values = <TmdbConfigurationRegion>[
    US,
    BR,
  ];

  String get region {
    return const <int, String>{
      0: 'US',
      1: 'BR',
    }[index];
  }
}

class TmdbConfigurationLanguage {
  const TmdbConfigurationLanguage._(this.index);

  final int index;

  static const TmdbConfigurationLanguage en_US = TmdbConfigurationLanguage._(0);

  static const TmdbConfigurationLanguage pt_BR = TmdbConfigurationLanguage._(1);

  static const List<TmdbConfigurationLanguage> values = <TmdbConfigurationLanguage>[
    en_US,
    pt_BR,
  ];

  String get language {
    return const <int, String>{
      0: 'en-US',
      1: 'pt-BR',
    }[index];
  }
}

class PosterSize {
  const PosterSize._(this.index);

  final int index;

  static const PosterSize w92 = PosterSize._(0);

  static const PosterSize w154 = PosterSize._(1);

  static const PosterSize w185 = PosterSize._(2);

  static const PosterSize w342 = PosterSize._(3);

  static const PosterSize w500 = PosterSize._(4);

  static const PosterSize w780 = PosterSize._(5);

  static const PosterSize original = PosterSize._(6);

  static const List<PosterSize> values = <PosterSize>[
    w92,
    w154,
    w185,
    w342,
    w500,
    w780,
    original,
  ];

  String get size => const <int, String>{
        0: 'w92',
        1: 'w154',
        2: 'w185',
        3: 'w342',
        4: 'w500',
        5: 'w780',
        6: 'original',
      }[index];
}

class BackdropSize {
  const BackdropSize._(this.index);

  final int index;

  static const BackdropSize w300 = BackdropSize._(0);
  static const BackdropSize w780 = BackdropSize._(1);
  static const BackdropSize w1280 = BackdropSize._(2);
  static const BackdropSize original = BackdropSize._(3);

  static const List<BackdropSize> values = <BackdropSize>[
    w300,
    w780,
    w1280,
    original,
  ];

  String get size => <int, String>{
        0: 'w300',
        1: 'w780',
        2: 'w1280',
        3: 'original',
      }[index];
}

class ProfileSize {
  const ProfileSize._(this.index);

  final int index;

  static const ProfileSize w45 = ProfileSize._(0);
  static const ProfileSize w185 = ProfileSize._(1);
  static const ProfileSize h632 = ProfileSize._(2);
  static const ProfileSize original = ProfileSize._(3);

  static const List<ProfileSize> values = <ProfileSize>[
    w45,
    w185,
    h632,
    original,
  ];

  String get size => <int, String>{
        0: 'w45',
        1: 'w185',
        2: 'h632',
        3: 'original',
      }[index];
}

class StillSize {
  const StillSize._(this.index);

  final int index;

  static const StillSize w92 = StillSize._(0);
  static const StillSize w185 = StillSize._(1);
  static const StillSize w300 = StillSize._(2);
  static const StillSize original = StillSize._(3);

  static const List<StillSize> values = <StillSize>[
    w92,
    w185,
    w300,
    original,
  ];

  String get size => <int, String>{
        0: 'w92',
        1: 'w185',
        2: 'w300',
        3: 'original',
      }[index];
}

class LogoSize {
  const LogoSize._(this.index);

  final int index;

  static const LogoSize w45 = LogoSize._(0);
  static const LogoSize w92 = LogoSize._(1);
  static const LogoSize w154 = LogoSize._(2);
  static const LogoSize w185 = LogoSize._(3);
  static const LogoSize w300 = LogoSize._(4);
  static const LogoSize w500 = LogoSize._(5);
  static const LogoSize original = LogoSize._(6);

  static const List<LogoSize> values = <LogoSize>[
    w45,
    w92,
    w154,
    w185,
    w300,
    w500,
    original,
  ];

  String get size => <int, String>{
        0: 'w45',
        1: 'w92',
        2: 'w154',
        3: 'w185',
        4: 'w300',
        5: 'w500',
        6: 'original',
      }[index];
}
