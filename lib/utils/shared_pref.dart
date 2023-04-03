import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  /// The singular instance of [SharedPreferences].
  SharedPreferences? _pref;
  SharedPref._() {init();}
  static final SharedPref instance = SharedPref._();

  /// To initialise the [SharedPref] class.
  Future<SharedPreferences?> init() async {
    if (_pref != null) return _pref;
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  /// Set a value.
  Future<bool?>? setValue(dynamic value, String key) async {
    bool? res;
    // Get the runtimeType of the value.
    switch (value.runtimeType) {
      case int:
        res = await _pref?.setInt(key, value);
        return res;
      case double:
        res = await _pref?.setDouble(key, value);
        return res;
      case String:
        res = await _pref?.setString(key, value);
        return res;
      case Bool:
        res = await _pref?.setBool(key, value);
        return res;
      case List<String>:
        res = await _pref?.setStringList(key, value);
        return res;
    }
    return res;
  }

  /// Get a value.
  dynamic getValue(String key) {
    return _pref?.get(key);
  }

  /// Remove a value.
  Future<bool>? remove(String key) {
    return _pref?.remove(key);
  }

  /// Clear shared preferences.
  Future<bool>? clear() {
    return _pref?.clear();
  }
}