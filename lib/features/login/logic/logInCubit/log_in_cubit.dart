import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/login/data/log_in_post.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  sendingLogInCredinials() async {
    try {
      emit(SendingLogInDataState());
      final res = await PostLogInData.postData(
          email: emailController.text, password: passwordController.text);

      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 202) {
        emit(SendingLogInDataSuccess(responseMessage: res.message));
      } else {
        emit(SendingLogInDataWithError(errorMessage: res.message));
      }
    } catch (e) {
      emit(SendingLogInDataWithError(errorMessage: e.toString()));
    }
  }
}
