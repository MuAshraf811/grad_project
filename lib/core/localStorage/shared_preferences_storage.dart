import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._();
  static SharedPreferences? _sharedPref;
  static Future<SharedPreferences> getSharedPref() async {
    if (_sharedPref == null) {
      _sharedPref = await SharedPreferences.getInstance();
    }
    return _sharedPref!;
  }

  static storeIntVal(int val) {
    _sharedPref!.setInt('themeStore', val);
  }

  static int? getIntVal() {
    return _sharedPref!.getInt('themeStore') ?? 0;
  }

  static storeVal(String key, dynamic val) async {
    switch (val) {
      case String:
        await _sharedPref!.setString(key, val);

      case int:
        await _sharedPref!.setInt(key, val);
      case bool:
        await _sharedPref!.setBool(key, val);
        debugPrint(await _sharedPref!.setString(key, val).toString());
        debugPrint('Stored Successfully');
    }
  }

  static storeBoolVal(
    String key,
    bool val,
  ) async {
    _sharedPref!.setBool(key, val);
  }

  static storeStringVal(
    String key,
    String val,
  ) {
    _sharedPref!.setString(key, val);
  }

  static String? getString(String key) {
    return _sharedPref!.getString(key);
  }

  static int getInt(String key) {
    return _sharedPref!.getInt(key) ?? 0;
  }

  static bool? getBool(String key) {
    return _sharedPref!.getBool(key);
  }
}
