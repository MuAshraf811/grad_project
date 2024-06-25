import 'package:flutter/material.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/core/networking/dio_object.dart';
import 'package:graduation_project/doc_doc.dart';
import 'package:paymob_payment/paymob_payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.getDio();
  PaymobPayment.instance.initialize(
    apiKey:
        "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RZMU5ESTBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkucDBUWkoxV1NGU2RVN3ZKTXdLZ2pRZ3hfRkpaRlFmR2w0OXRIdUoyekhQeERYc29EY1poejVwd3UzalR3U1ZKc295cFVYa0EwVWNCQktPcTFjamplV0E=",
    integrationID: 4538217,
    iFrameID: 831751,
  );
  await SharedPreferencesManager.getSharedPref();
  runApp(const DocDoc());
}
