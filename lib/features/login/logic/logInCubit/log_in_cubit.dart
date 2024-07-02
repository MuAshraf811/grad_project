import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/login/data/log_in_post.dart';
import 'package:graduation_project/features/login/data/new_password.dart';

import '../../data/post_email.dart';
part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  bool isEmail = true;
  sendingEmail() async {
    try {
      emit(PostingOTP());
      final res =
          await PostEmailToGetOTP.postEmail(email: emailController.text);
      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 204) {
        emit(PostingOtpSuccess(message: res.message));
      } else if (res.statusCode == 400) {
        emit(PostingOtpError(message: res.message));
      }
    } catch (e) {
      emit(PostingOtpError(message: e.toString()));
    }
  }

  sendingNewPassword() async {
    try {
      emit(SendingNewPasswords());
      final res = await PostNewPasswords.PostNewPassword(
          newPassword1: passwordController.text,
          newPassword2: confirmpasswordController.text);
      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 204) {
        emit(SendingNewPasswordsSucess(message: res.message));
      } else if (res.statusCode == 400) {
        emit(SendingNewPasswordsError(message: res.message));
      }
    } catch (e) {
      emit(SendingNewPasswordsError(message: e.toString()));
    }
  }

  sendingLogInCredinials() async {
    try {
      emit(SendingLogInDataState());
      final res = await PostLogInData.postData(
        email: emailController.text,
        password: passwordController.text,
        username: userController.text,
      );
      await SharedPreferencesManager.storeStringVal(
          LocalStorageConstants.userToken, res['token']);
      debugPrint(
          '<============  Hello this is token checker if stored  ============>');
      debugPrint(
          SharedPreferencesManager.getString(LocalStorageConstants.userToken));
      if (res['code'] == 200 || res['code'] == 201) {
        emit(SendingLogInDataSuccess(responseMessage: res['token']));
      } else if (res['code' == 400]) {
        emit(
            SendingLogInDataWithError(errorMessage: res['message'].toString()));
      }
    } catch (e) {
      emit(SendingLogInDataWithError(errorMessage: e.toString()));
    }
  }

  checkLogInType() {}
}
