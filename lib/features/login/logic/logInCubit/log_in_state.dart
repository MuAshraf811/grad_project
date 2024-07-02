part of 'log_in_cubit.dart';

sealed class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

final class LogInInitial extends LogInState {}

final class SendingLogInDataState extends LogInState {}

final class SendingLogInDataSuccess extends LogInState {
  final String responseMessage;
  const SendingLogInDataSuccess({required this.responseMessage});
}

final class SendingLogInDataWithError extends LogInState {
  final String errorMessage;
  const SendingLogInDataWithError({required this.errorMessage});
}

final class PostingOTP extends LogInState {}

final class PostingOtpSuccess extends LogInState {
  final String message;

  PostingOtpSuccess({required this.message});
}

final class PostingOtpError extends LogInState {
  final String message;

  PostingOtpError({required this.message});
}

final class SendingNewPasswords extends LogInState {}

final class SendingNewPasswordsSucess extends LogInState {
  final String message;

  SendingNewPasswordsSucess({required this.message});
}

final class SendingNewPasswordsError extends LogInState {
  final String message;

  SendingNewPasswordsError({required this.message});
}
