import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/utils/ai_gpt_manager.dart';

part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  ChatGptCubit() : super(ChatGptInitial());

  connectMe() async {
    try {
      emit(ConnectingToGPT());
      await ChatGPTAiManager.connectProjectWithGPT();
      emit(ConnectingToGPTSucess());
    } catch (e) {
      emit(ConnectingToGPTError(error: e.toString()));
    }
  }

  void sendingMyMessage({required String message}) async {
    try {
      emit(SendingYourMessage());
      final res = await ChatGPTAiManager.sendMessage(
        message: message,
      );
      if (res['code'] == 200 || res['code'] == 201) {
        emit(SendingYourMessageSuccess(messageResponse: res['res']));
      }
      emit(SendingYourMessageError(error: 'OOPS,Something went wrong'));
    } catch (e) {
      emit(SendingYourMessageError(error: e.toString()));
    }
  }
}
