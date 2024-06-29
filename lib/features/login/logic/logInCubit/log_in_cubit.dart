import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
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
      await SharedPreferencesManager.storeStringVal(
          LocalStorageConstants.userToken, res['token']);
      debugPrint(
          '<============  Hello this is token checker if stored  ============>');
      debugPrint(
          SharedPreferencesManager.getString(LocalStorageConstants.userToken));
      if (res['code'] == 200 || res['code'] == 201) {
        emit(SendingLogInDataSuccess(responseMessage: res['token']));
      }
      emit(SendingLogInDataWithError(errorMessage: res['message'].toString()));
    } catch (e) {
      emit(SendingLogInDataWithError(errorMessage: e.toString()));
    }
  }
}
