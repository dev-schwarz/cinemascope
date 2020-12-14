import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  const PrefsKeys._();

  static const _prefixLogin = 'login_';
  static const loginSessionId = '${_prefixLogin}session_id';
  static const loginAccountId = '${_prefixLogin}account_id';
  static const loginAccessToken = '${_prefixLogin}access_token';

  static const _prefixSettings = 'settings_';
  static const posterSize = '${_prefixSettings}poster_size';
  static const profileSize = '${_prefixSettings}profile_size';
  static const language = '${_prefixSettings}language';
  static const region = '${_prefixSettings}region';
  static const includeAdult = '${_prefixSettings}include_adult';
}

class PrefsHelper {
  PrefsHelper._();

  static Future<void> init() async {
    if (_instance == null) {
      _instance = PrefsHelper._();
      _instance._prefs = await SharedPreferences.getInstance();
      // SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
      // _instance = this;
    }
  }

  // PrefsHelper.init() {
  //   if (_instance == null) {
  //     SharedPreferences.getInstance().then((prefs) => _prefs = prefs);
  //     _instance = this;
  //   }
  // }

  factory PrefsHelper() {
    if (_instance == null) {
      throw Exception('PrefsHelper must be initialized first');
    }
    return _instance;
  }

  static PrefsHelper _instance;

  SharedPreferences get prefs => _prefs;
  SharedPreferences _prefs;

  T load<T>(String key, T defaultValue) {
    if (_prefs.containsKey(key)) {
      if (T == bool) {
        return _prefs.getBool(key) as T;
      } else if (T == String) {
        return _prefs.getString(key) as T;
      } else if (T == int) {
        return _prefs.getInt(key) as T;
      } else if (T == double) {
        return _prefs.getDouble(key) as T;
      }
    }

    return defaultValue;
  }

  Future<void> save<T>(String key, T value) async {
    if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }
}
