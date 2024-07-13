import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';

class ChatGPTAiManager {
  static late Dio _dio;

  static Future<void> connectProjectWithGPT() async {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      requestHeader: true,
      error: true,
    ));
    final response = await _dio.get(
      'https://api.openai.com/v1/models',
      options: Options(headers: {
        "Authorization": 'Bearer ${LocalStorageConstants.ai_integration_key}',
        "OpenAI-Organization": "org-QPybBblEC3plF6iIIGAyRFHR",
        "OpenAI-Project": "proj_CW3e1VhYMBG3mzE1qrFtc7VX",
      }),
    );

    if (response.statusCode == 200) {
      debugPrint(
          '<==================Connectio to gpt estaplished successfully======================>');
      debugPrint(response.data);
    } else {
      debugPrint(
          '<!!!!!!!!!!!!!!Connectio to gpt Not completed !!!!!!!!!!!!!!!!!!!!!>');
    }
  }

  static Future<Map<String, dynamic>> sendMessage(
      {required String message}) async {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      requestHeader: true,
      error: true,
    ));
    try {
      //"tts-1"
      //gpt-3.5-turbo-instruct-0914
      //davinci-002
      //text-embedding-3-small
      //whisper-1
      //tts-1-hd-1106
      final response = await _dio.post(
        'https://api.openai.com/v1/engines/davinci-codex/completions',
        data: jsonEncode({
          // specify the model you are using
          "prompt": message,
          "max_tokens": 50,
        }),
        options: Options(
          headers: {
            "Authorization":
                'Bearer ${LocalStorageConstants.ai_integration_key}',
            "OpenAI-Organization": "org-QPybBblEC3plF6iIIGAyRFHR",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final _res = response.data['choices'][0]['message']['content'];
        return _res;
      } else {
        return {
          "res": response.data.toString(),
          "code": response.statusCode,
        };
      }
    } catch (e) {
      debugPrint(
          'This an error in chat gpt message response!!!!!!!!!!!!!!!!!!');
      debugPrint(e.toString());
    }
    return {
      "res": 'error',
      "code": 0,
    };
  }
}
