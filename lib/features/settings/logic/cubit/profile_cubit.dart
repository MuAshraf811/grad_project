import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/settings/data/fetching_user_info.dart';
import 'package:graduation_project/features/settings/data/post_user_info.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  late List<UserModel> userInfo;

  final TextEditingController firstNameContrller = TextEditingController();
  final TextEditingController lastNameContrller = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController birthDateContrller = TextEditingController();
  final TextEditingController bioContrller = TextEditingController();

  updatingUserInfo({
    required String firstName,
    required String lastName,
    required String userName,
    required String birthDate,
    required String gender,
    required String bio,
    required String fileName,
    required XFile file,
  }) async {
    try {
      emit(UpdatingUserInfoState());
      final res = await PostingUserData.postInfo(
          firstName: firstName,
          image: file,
          fileName: fileName,
          lastName: lastName,
          userName: userName,
          birthDate: birthDate,
          gender: gender,
          bio: bio);
      if (res == 200) {
        emit(UpdatingUserInfoSuccessState(
            message: 'You Profile has been updated'));
      }

      emit(UpdatingUserInfoErrorState(message: 'An error has occured'));
    } catch (e) {
      emit(UpdatingUserInfoErrorState(message: e.toString()));
    }
  }

  fetchUserData() async {
    try {
      emit(FetchingUserInformationState());
      final response = await FetchingUserData.FetchInfo();
      final List<UserModel> res = response
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();
      print(res.toString());
      userInfo = res;

      emit(FetchingUserInformationSuccessState(data: res));
    } catch (e) {
      print(e.toString());
      emit(FetchingUserInformationStateError(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    firstNameContrller.dispose();
    lastNameContrller.dispose();
    emailContrller.dispose();
    bioContrller.dispose();
    birthDateContrller.dispose();
    return super.close();
  }
}
