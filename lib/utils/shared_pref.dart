import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences _pref;

  /// To initialise the [SharedPref] class.
  static Future<SharedPreferences?> init() async {
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  /// Set a value.
  static Future<bool?>? setValue(dynamic value, String key) async {
    bool? res;
    // Get the runtimeType of the value.
    switch (value.runtimeType) {
      case int:
        res = await _pref.setInt(key, value);
        return res;
      case double:
        res = await _pref.setDouble(key, value);
        return res;
      case String:
        res = await _pref.setString(key, value);
        return res;
      case bool:
        res = await _pref.setBool(key, value);
        return res;
      case List<String>:
        res = await _pref.setStringList(key, value);
        return res;
    }
    return res;
  }

  /// Get a value.
  static String? getString(String key) {
    return _pref.getString(key);
  }
  static bool? getBool(String key) {
    return _pref.getBool(key);
  }
  static int? getInt(String key) {
    return _pref.getInt(key);
  }
  static double? getDouble(String key) {
    return _pref.getDouble(key);
  }
  static List<String>? getStringList(String key) {
    return _pref.getStringList(key);
  }

  /// Remove a value.
  static Future<bool>? remove(String key) {
    return _pref.remove(key);
  }

  /// Clear shared preferences.
  static Future<bool>? clear() {
    return _pref.clear();
  }
}