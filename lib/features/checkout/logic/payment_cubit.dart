import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/checkout/data/payMob_payment_handler.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  paying() async {
    await PayMobHandler.launchPay();
  }
}
