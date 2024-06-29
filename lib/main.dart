import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/core/networking/dio_object.dart';
import 'package:graduation_project/doc_doc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.getDio();
  await SharedPreferencesManager.getSharedPref();
  SharedPreferencesManager.getBool(LocalStorageConstants.onBoardingBoolKey) ==
          null
      ? await SharedPreferencesManager.storeBoolVal(
          LocalStorageConstants.onBoardingBoolKey, false)
      : null;
  debugPrint(
      'Hello, This is sharedPreferences onBoarding value checker in first time');
  debugPrint(
      SharedPreferencesManager.getBool(LocalStorageConstants.onBoardingBoolKey)
          .toString());
  runApp(const DocDoc());
}
