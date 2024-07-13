part of 'chat_gpt_cubit.dart';

sealed class ChatGptState extends Equatable {
  const ChatGptState();

  @override
  List<Object> get props => [];
}

final class ChatGptInitial extends ChatGptState {}

final class SendingYourMessage extends ChatGptState {}

final class SendingYourMessageSuccess extends ChatGptState {
  final String messageResponse;

  SendingYourMessageSuccess({required this.messageResponse});
}

final class SendingYourMessageError extends ChatGptState {
  final String error;

  SendingYourMessageError({required this.error});
}

final class ConnectingToGPT extends ChatGptState {}

final class ConnectingToGPTSucess extends ChatGptState {}

final class ConnectingToGPTError extends ChatGptState {
  final String error;

  ConnectingToGPTError({required this.error});
}
