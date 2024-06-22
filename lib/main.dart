import 'package:flutter/material.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/core/networking/dio_object.dart';
import 'package:graduation_project/doc_doc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.getDio();
  await SharedPreferencesManager.getSharedPref();
  runApp(const DocDoc());
}
