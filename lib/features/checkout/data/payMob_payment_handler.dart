import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PayMobHandler {
  static launchPay(
      {required String orderId,
      required int amount,
      required String name,
      required String phone,
      required String city}) async {
    final res = await _getAuthanticationToken();

    final response = await _getPaymentKey(
        authToken: res,
        amountInCents: (amount * 100).toString(),
        currency: "EGP",
        orderId: orderId,
        city: city,
        name: name,
        phone: phone);

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

  static Future<String> _getPaymentKey(
      {required String authToken,
      required String amountInCents,
      required String currency,
      required String phone,
      required String name,
      required String city,
      required String orderId}) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      "auth_token": authToken,
      "amount_cents": amountInCents, //! خد بالك السعر هنا بالقرش //!
      "expiration": 3600,
      "order_id": orderId,
//! it is String value //! note that this attribute has been fitched from second step as an integer value
      "billing_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": name,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": phone,
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": city,
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      "currency": currency,
      "integration_id": 4538217,
//!  you can get it from your pay mob accound every payment method has its own id , wallets has its own id , cards also has its own id and so on
      "lock_order_when_paid": "false"
    });
    return response.data['token'];
  }

  static urlLauncher(String paymentKey) {
    launchUrl(
      Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/831751?payment_token=$paymentKey"),
    );
  }
}
