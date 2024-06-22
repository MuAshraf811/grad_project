import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/register/data/register_post.dart';
import 'package:graduation_project/features/register/data/response_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  String genderKind = 'male';
  genderType(bool val) {
    if (val) {
      genderKind = 'male';
    }
    genderKind = 'female';
  }

  confirmOTP({required String otp}) async {
    emit(SendingOTP());
    try {
      final ResponseModel res =
          await PostRegisterationData.confirmWithOTP(otp: otp);
      if (res.statusCode == 201 ||
          res.statusCode == 200 ||
          res.statusCode == 202) {
        emit(SendingOTPSuccess(message: res.message));
      }
    } catch (e) {
      emit(SendingOTPFailure(error: e.toString()));
    }
  }

  checkPostDataProgress(
      {required String email,
      required String pass1,
      required String pass2}) async {
    emit(PostingRegisterDataState());
    try {
      final ResponseModel response = await PostRegisterationData.postData(
        userNmae: userName.text,
        email: email,
        password1: pass1,
        password2: pass2,
        firstName: firstNameController.text,
        lastName: firstNameController.text,
        gender: genderKind,
      );
      if (response.statusCode == 201 ||
          response.statusCode == 200 ||
          response.statusCode == 202) {
        emit(DataPostedSuccessfullyState(message: response.message));
      } else {
        emit(RegisterDataPostedErrorState(error: response.message));
      }
    } catch (e) {
      emit(RegisterDataPostedErrorState(error: e.toString()));
    }
  }
}
