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
