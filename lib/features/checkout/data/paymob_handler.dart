import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PayMobPayMentGetawayHandler {
  // this method will be invoked and take the job until launch url
  // this method internly has 4 methods explained in details bellow it
  // if currency is Egyption pound then make it "EGP"
  // amount in cent means القرش المصري ياباشا فركز سيكا اضرب كل مبلغ في 100
  static handlePayment(String apiKey, String currency, int amountInCent,
      int integrationId) async {
    final authToken = await _getAuthTokenFromaApiKey(apiKey);
    final orderId = await _getOrdrtId(
      authToken,
      currency,
      (amountInCent * 100).toString(),
    );

    final paymentKey = await _getPaymentKey(authToken, orderId.toString(),
        (amountInCent * 100).toString(), currency, integrationId);
    _launchPayMobUrl(paymentKey);
  }

// first Step , first Method is to get auth key
// this method is used to get Auth token from Api key related to your PAyMob account

  static Future<String> _getAuthTokenFromaApiKey(String apiKey) async {
    final response = await Dio().post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {"api_key": apiKey});

    return response.data['token'];
  }

  // second step , second method is to get the order id using auth token fetched from first step.
  // as shown getting oreer id as integer

  static Future<int> _getOrdrtId(
    String authToken,
    String currency,
    String amountInCent,
  ) async {
    final response = await Dio().post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "items": [],
        "amount_cents": amountInCent,
        "currency": currency,
      },
    );
    return response.data['id'];
  }
  // end if method and step two
  // order id will be catched  as integer value

  // this method is to get payment key

  static Future<String> _getPaymentKey(String authToken, String orderId,
      String amountInCents, String currency, int integrationId) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      "auth_token": authToken,
      "amount_cents": amountInCents, //! خد بالك السعر هنا بالقرش //!
      "expiration": 3600,
      "order_id":
          orderId, //! it is String value //! note that this attribute has been fitched from second step as an integer value
      "billing_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      "currency": currency,
      "integration_id":
          integrationId, //!  you can get it from your pay mob accound every payment method has its own id , wallets has its own id , cards also has its own id and so on
      "lock_order_when_paid": "false"
    });
    return response.data['token'];
  }

  // finally this is last method and it is used to launch the url to paymob , from here paymob will take you and finishes payment with you
  // here you will use url launcher package

  static _launchPayMobUrl(String paymentKey) {
    // this whole url depends on you iframe of your account so do not forget to change it with the onr related to your account
    // its called iFrame in paymob site
    // choose one of two iFrames in your account
    launchUrl(Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/827738?payment_token=$paymentKey'));
  }
}
