import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PayMobHandler {
  static launchPay() async {
    final res = await _getAuthanticationToken();

    final response = await _getPaymentKey(
      authanticationToken: res,
      amount: (100 * 100).toString(),
      currency: 'EGP',
    );

    urlLauncher(response);
  }

  static Future<String> _getAuthanticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key":
          'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RZMU5ESTBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkucDBUWkoxV1NGU2RVN3ZKTXdLZ2pRZ3hfRkpaRlFmR2w0OXRIdUoyekhQeERYc29EY1poejVwd3UzalR3U1ZKc295cFVYa0EwVWNCQktPcTFjamplV0E=',
    });
    return response.data["token"];
  }

  static Future<String> _getPaymentKey({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      "expiration": 3600,
      "auth_token": authanticationToken,
      "order_id": "220484101",
      "integration_id": 4538217,
      "amount_cents": amount,
      "currency": currency,
      "billing_data": {
        //Have To Be Values
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",

        //Can Set "NA"
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    });
    return response.data["token"];
  }

  static urlLauncher(String paymentKey) {
    launchUrl(
      Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/831751?payment_token=$paymentKey"),
    );
  }
}
