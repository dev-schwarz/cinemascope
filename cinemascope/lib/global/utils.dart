class AppUtils {
  const AppUtils._();

  /// Returns only the first letters of the [name].
  ///
  /// The [maxCharacters] defines the number of characters to get from the [name].
  ///
  /// If [ignoreAbbreviated] is `true`, the abbreviated inner names will
  /// be ignored.
  static String getNameFirstLetters(
    String name, {
    int maxCharacters = 2,
    bool ignoreAbbreviated = true,
  }) {
    final splitted = name.split(' ');

    if (ignoreAbbreviated) {
      splitted.removeWhere((e) => e.endsWith('.'));
    }
    maxCharacters = maxCharacters.clamp(1, splitted.length);

    return splitted.getRange(0, maxCharacters).map((e) {
      return e.substring(0, 1).toUpperCase();
    }).join();
  }

  /// Returns a runtime representation of an int value.
  ///
  /// Examples:
  /// - 133 returns: '2h 13m'.
  /// - 59 returns: '59m'.
  /// - 120 returns : '2h'.
  static String convertIntToRuntime(int value) {
    final int hours = (value / 60).floor();
    final int minutes = value % 60;
    // final String sHours = hours > 0 ? '${hours}h' : '';
    // final String sMinutes = minutes > 0 ? ' ${minutes}m' : '';
    // return '$sHours$sMinutes';
    return '${hours > 0 ? '${hours}h' : ''}${minutes > 0 ? ' ${minutes}m' : ''}';
  }

  /// Same as [convertIntToRuntime], but calculated in a different way.
  static String convertIntToRuntime2(int runtime) {
    int hours = 0;
    int minutes = 0;

    while (runtime > 60) {
      runtime -= 60;
      hours++;
    }
    minutes = runtime;

    return '${hours}h ${minutes}m';
  }
}

abstract class ListUtils {
  const ListUtils._();

  /// Puts [element] between every element in [iterable].
  ///
  /// From package: [intersperse](https://pub.dev/packages/intersperse).
  ///
  /// Example:
  ///
  /// ```dart
  ///     final list1 = intersperse(2, <int>[]); // [];
  ///     final list2 = intersperse(2, <int>[0]); // [0];
  ///     final list3 = intersperse(2, <int>[0, 0]); // [0, 2, 0];
  /// ```
  static Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
    final iterator = iterable.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }

  /// Puts [element] between every element in [iterable] and at the bounds of [iterable].
  ///
  /// From package: [intersperse](https://pub.dev/packages/intersperse).
  ///
  /// Example:
  /// ```dart
  ///     final list1 = intersperseOuter(2, <int>[]); // [];
  ///     final list2 = intersperseOuter(2, [0]); // [2, 0, 2];
  ///     final list3 = intersperseOuter(2, [0, 0]); // [2, 0, 2, 0, 2];
  /// ```
  static Iterable<T> intersperseOuter<T>(T element, Iterable<T> iterable) sync* {
    final iterator = iterable.iterator;
    if (iterable.isNotEmpty) {
      yield element;
    }
    while (iterator.moveNext()) {
      yield iterator.current;
      yield element;
    }
  }
}

class RegExpUtils {
  const RegExpUtils._();

  static bool isYear(String value) => RegExp(r'^(\d){4}$').hasMatch(value);
}
