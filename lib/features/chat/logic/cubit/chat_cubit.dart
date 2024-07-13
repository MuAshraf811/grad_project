import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/chat/data/fetch_chat.dart';
import 'package:graduation_project/features/chat/data/post_chat.dart';
import 'package:graduation_project/features/chat/model/message_model.dart';
import 'package:graduation_project/features/chat/model/outer_chat_mode.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<OuterChatModel> allChats = [];
  TextEditingController chatController = TextEditingController();

  List<MessageModel> messagesInChat = [];
  int val = 0;
  getConversationMssages({required String chatId}) async {
    try {
      emit(GettingMessages());
      final List<dynamic> resp = await GetSingleChat.getChat(chatId: chatId);
      val = resp.length;
      messagesInChat = resp
          .map(
            (e) => MessageModel.fromJson(e),
          )
          .toList();

      emit(GettingMessagesSucces());
    } catch (e) {
      emit(GettingMessagesError(error: e.toString()));
    }
  }

  postConversationMssages({required String chatId}) async {
    try {
      emit(PostingMessages());

      final intresponse = await GetSingleChat.postChat(
          chatId: chatId, text: chatController.text);

      if (intresponse == 200 || intresponse == 201) {
        chatController.clear();
        getConversationMssages(chatId: chatId);
      }
    } catch (e) {
      emit(PostingMessagesError(error: e.toString()));
    }
  }

  createChat(String doctorId) async {
    try {
      emit(AddingNewChat());
      final res = await ChatFetcher.createChat(doctorId: doctorId);
      if (res == 200 || res == 201) {
        fetchingAllChats();
      }
    } catch (e) {
      emit(AddingNewChatError(error: e.toString()));
    }
  }

  deletaChat(String id) async {
    try {
      await ChatFetcher.deleteChat(id);

      fetchingAllChats();
    } catch (e) {
      emit(DeleatingChatError(error: e.toString()));
    }
  }

  fetchingAllChats() async {
    try {
      emit(FetchingAllChats());
      final List<dynamic> res = await ChatFetcher.getChats();

      allChats = res
          .map(
            (e) => OuterChatModel.fromJson(e),
          )
          .toList();

      emit(FetchingAllChatsSuccess());
    } catch (e) {
      emit(FetchingAllChatsError(error: e.toString()));
    }
  }
}
