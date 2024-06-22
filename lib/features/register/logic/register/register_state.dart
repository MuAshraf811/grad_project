part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class PostingRegisterDataState extends RegisterState {}

final class DataPostedSuccessfullyState extends RegisterState {
  final String message;
  const DataPostedSuccessfullyState({required this.message});
}

final class RegisterDataPostedErrorState extends RegisterState {
  final String error;
  const RegisterDataPostedErrorState({required this.error});
}

final class SendingOTP extends RegisterState {}

final class SendingOTPSuccess extends RegisterState {
  final String message;
  const SendingOTPSuccess({required this.message});
}

final class SendingOTPFailure extends RegisterState {
  final String error;
  const SendingOTPFailure({required this.error});
}
