import 'package:flutter_bloc/flutter_bloc.dart';

class LogInMethodCubit extends Cubit<int> {
  LogInMethodCubit() : super(0);

  checkLogInMethod(int val) {
    emit(val);
    return val;
  }
}
