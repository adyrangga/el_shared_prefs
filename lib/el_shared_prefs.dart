library el_shared_prefs;

import 'package:shared_preferences/shared_preferences.dart';

/// static declaration for global use platform-specific persistent storage.
///
/// please initialize SharedPreferences on runApp function.
///
/// Wraps platform-specific persistent storage for simple data
/// (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.).
class ElSharedPrefs {
  static SharedPreferences? _sharedPrefs;

  /// singleton class declaration.
  factory ElSharedPrefs() => ElSharedPrefs._internal();

  ElSharedPrefs._internal();

  /// initialize SharedPreferences.
  /// call on main() before runApp.
  Future<SharedPreferences> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
    return _sharedPrefs!;
  }

  bool? getBool(String key) => _sharedPrefs?.getBool(key);

  double? getDouble(String key) => _sharedPrefs?.getDouble(key);

  int? getInt(String key) => _sharedPrefs?.getInt(key);

  String? getString(String key) => _sharedPrefs?.getString(key);

  List<String>? getStringList(String key) => _sharedPrefs?.getStringList(key);

  Future<bool> setBool(String key, bool value) =>
      _sharedPrefs!.setBool(key, value);

  Future<bool> setDouble(String key, double value) =>
      _sharedPrefs!.setDouble(key, value);

  Future<bool> setInt(String key, int value) =>
      _sharedPrefs!.setInt(key, value);

  Future<bool> setString(String key, String value) =>
      _sharedPrefs!.setString(key, value);

  Future<bool> setStringList(String key, List<String> value) =>
      _sharedPrefs!.setStringList(key, value);

  /// remove spesific value by key. if key null, clear all value.
  Future<bool> clear([String? key]) {
    if (key == null) return _sharedPrefs!.clear();
    return _sharedPrefs!.remove(key);
  }
}
