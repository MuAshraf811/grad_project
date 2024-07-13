part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class AddingNewChat extends ChatState {}

final class AddingNewChatSuccess extends ChatState {}

final class AddingNewChatError extends ChatState {
  final String error;

  const AddingNewChatError({required this.error});
}

final class FetchingAllChats extends ChatState {}

final class FetchingAllChatsError extends ChatState {
  final String error;

  const FetchingAllChatsError({required this.error});
}

final class FetchingAllChatsSuccess extends ChatState {}

final class DeleatingChat extends ChatState {}

final class DeleatingChatSuccess extends ChatState {}

final class DeleatingChatError extends ChatState {
  final String error;

  const DeleatingChatError({required this.error});
}

final class GettingMessages extends ChatState {}

final class GettingMessagesSucces extends ChatState {}

final class GettingMessagesError extends ChatState {
  final String error;

  const GettingMessagesError({required this.error});
}

final class PostingMessages extends ChatState {}

final class PostingMessagesSucces extends ChatState {}

final class PostingMessagesError extends ChatState {
  final String error;

  const PostingMessagesError({required this.error});
}
