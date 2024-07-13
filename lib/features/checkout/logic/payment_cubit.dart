import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../data/payMob_payment_handler.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final payKey = GlobalKey<FormState>();

  paying() async {
    await PayMobHandler.launchPay(
        amount: 100,
        orderId: '225540988',
        city: addressController.text,
        phone: phoneNumberController.text,
        name: nameController.text);
    // await PayMobPayMentGetawayHandler.handlePayment(
    //     'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RZeU1UUXdMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuM21qSzFKTjRTVG1DanFIbV92ME9aWHk5Y0hKOWYxZmNnaTI3MVBqakVjblBneURENVRZZkEyWVh2SEpkalZpWVp6RktndUV4Tm1JMmprWThtV2pOZnc=',
    //     'EGP',
    //     500,
    //     4600717);
  }
}
