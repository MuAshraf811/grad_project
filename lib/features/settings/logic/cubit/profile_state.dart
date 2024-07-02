part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class FetchingUserInformationState extends ProfileState {}

final class FetchingUserInformationSuccessState extends ProfileState {
  final List<UserModel> data;
  FetchingUserInformationSuccessState({required this.data});
}

final class FetchingUserInformationStateError extends ProfileState {
  final String error;

  FetchingUserInformationStateError({required this.error});
}

final class UpdatingUserInfoState extends ProfileState {}

final class UpdatingUserInfoErrorState extends ProfileState {
  final String message;

  UpdatingUserInfoErrorState({required this.message});
}

final class UpdatingUserInfoSuccessState extends ProfileState {
  final String message;

  UpdatingUserInfoSuccessState({required this.message});
}
