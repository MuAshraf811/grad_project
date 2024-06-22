import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? sharedPref;
  static getSharedPref() async {
    if (sharedPref == null) {
      sharedPref = await SharedPreferences.getInstance();
    } else {
      if (kDebugMode) {
        print('Yes');
      }
    }
  }

  static storeIntVal(int val) {
    sharedPref!.setInt('themeStore', val);
  }

  static int? getIntVal() {
    return sharedPref!.getInt('themeStore')??0;
  }
}
