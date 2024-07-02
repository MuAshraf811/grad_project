import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:image_picker/image_picker.dart';

class PostingUserData {
  static Future<int> postInfo({
    required String firstName,
    required String lastName,
    required String userName,
    required String birthDate,
    required String gender,
    required XFile image,
    required String fileName,
    required String bio,
  }) async {
    final bearerToken =
        SharedPreferencesManager.getString(LocalStorageConstants.userToken);
    final id = SharedPreferencesManager.getString(LocalStorageConstants.userId);
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
      "first_name": firstName,
      "last_name": lastName,
      "date_of_birth": birthDate,
      "gender": gender,
      "bio": bio,
      "timezone": "Cairo"
    });
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    final response = await dio.patch(
      'https://ikseer.onrender.com/accounts/patient/$id/',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          'Accept': 'application/json',
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.statusCode!;
    } else if (response.statusCode == 400) {
      return response.statusCode!;
    }
    throw Exception('error in post cart item');
  }
}
