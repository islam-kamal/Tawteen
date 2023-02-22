

import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/authentication_model.dart';
import 'package:code/src/data/models/AuthenticationModel/user_info_model.dart';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class AuthenticationRepository {
  static SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  static Future<AuthenticationModel> signUp(
      {String? mobile,
      String? firstname,
      String? email,
      String? password,
      String? lastname}) async {
    FormData formData = FormData.fromMap({
      "mobile": mobile,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      //   "firebase_token" : await  sharedPreferenceManager.readString(CachingKey.FIREBASE_TOKEN)
    });

    return NetworkUtil.internal().post(AuthenticationModel(),
        baseUrl +  "url",
        body: formData);
  }

  static Future<String?> signIn(
      {BuildContext? context, String? email, String? password}) async {
    Dio dio = new Dio();
    try {
      final response = await dio.post(
          baseUrl + "url",
          data: convert.jsonEncode({'username': email, 'password': password}),
          options: Options(headers: {'content-type': 'application/json'}));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
    }
  }



  static Future<AuthenticationModel> sendVerificationCode(
      String mobilenumber, String route) {
    FormData formData = FormData.fromMap({
      'mobilenumber': mobilenumber,
      'otptype': route == 'login'
          ? 'login'
          : route == 'ForgetPasswordScreen'
              ? 'forgot'
              : 'register',
      'email': '',
      'resendotp': '',
      'oldmobile': '',
    });
    return NetworkUtil.internal().post(AuthenticationModel(),
        "url",
        body: formData);
  }

  static Future<UserInfoModel> get_user_info({String? token}) {
    return NetworkUtil.internal().get(UserInfoModel(),
        "url",
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        }));
  }



  static Future<AuthenticationModel> checkOtpCode(
      String phone, String code, String route) {
    FormData formData = FormData.fromMap({
      'mobilenumber': phone,
      'otpcode': code,
      'otptype': route == 'login' || route == 'LoginWithPhoneScreen'
          ? 'login'
          : route == 'ForgetPasswordScreen'
              ? 'forgot'
              : 'register',
      'oldmobile': '',
    });
    return NetworkUtil.internal().post(AuthenticationModel(),
        "url",
        body: formData);
  }

  static Future<AuthenticationModel> resendOtp(String phone, String route) {
    FormData formData = FormData.fromMap({
      'mobilenumber': phone,
      'otptype': route == 'login'
          ? 'login'
          : route == 'ForgetPasswordScreen'
              ? 'forgot'
              : 'register',
      'email': '',
      'resendotp': '',
      'oldmobile': '',
    });
    return NetworkUtil.internal().post(AuthenticationModel(),
        "url",
        body: formData);
  }


  static Future<AuthenticationModel> logout(String token) {
    FormData formData = FormData.fromMap({
      'token': token,
    });
    return NetworkUtil.internal().post(AuthenticationModel(),
        "url",
        body: formData);
  }

  static Future<bool> updateUserProfile(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? token}) async {
    final payload = convert.jsonEncode({
      "customer": {
        "email": email,
        "firstname": firstName,
        "lastname": lastName,
        "custom_attributes": [
          {"attribute_code": "mobile_number", "value": phone}
        ]
      }
    });
    Dio dio = new Dio();
    try {
      final response = await dio.put(baseUrl + "url",
          data: payload,
          options: Options(headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer ${token}'
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateDeviceToken({
    int? customerId,
    String? deviceToken,
  }) async {
    final payload =
        convert.jsonEncode({"customerId": customerId, "token": deviceToken});
    Dio dio = new Dio();
    try {
      final response = await dio.post(baseUrl + "url",
          data: payload,
          options: Options(headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer ${baseUrl}'
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
