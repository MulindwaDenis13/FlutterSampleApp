import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.post(
      AppConstants.REGISTRATION_URL,
      signUpBody.toJson(),
    );
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.post(AppConstants.LOGIN_URL, {
      "email": email,
      "password": password,
    });
  }

  Future<bool> saveUserAuthToken(String token) async {
    // print(token);
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.APP_TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(
      String number, String password) async {
        try {
          await sharedPreferences.setString(AppConstants.PHONE, number);
          await sharedPreferences.setString(AppConstants.PASSWORD, password);
        } catch (e) {
          throw e;
        }
      }
}
