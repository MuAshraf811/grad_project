import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';

class MessageModel {
  final String senderId;
  final String text;
  final bool isMe;

  MessageModel({
    required this.senderId,
    required this.text,
    required this.isMe,
  });

  factory MessageModel.fromJson(Map<String, dynamic> res) {
    return MessageModel(
      senderId: res['sender']['id'],
      text: res['text'],
      isMe: res['sender']['id'] ==
              SharedPreferencesManager.getString(
                  LocalStorageConstants.profileId)
          ? true
          : false,
    );
  }
}
