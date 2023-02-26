

import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/authentication_model.dart';
import 'package:code/src/data/models/AuthenticationModel/user_info_model.dart';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class AuthenticationRepository {
  static SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  static Future<AuthenticationModel> signUp() async {
    FormData formData = FormData.fromMap({
      "registerRequest": {
        "email": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
        "userName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
          CachingKey.ArFullName : CachingKey.EnFullName)}",
        "password": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}Password@1223",
        "userTypeId": "3"
      },
      "createApplicant": {
        "name": "${await sharedPreferenceManager.readString( CachingKey.EnFullName)}",
        "nameEn": "${await sharedPreferenceManager.readString(CachingKey.ArFullName)}",
        "phone": "${await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER)}",
        "email": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
        "firstName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
        CachingKey.ArFirst : CachingKey.EnFirst)}",
        "secondName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
        CachingKey.ArFather : CachingKey.EnFather)}",
        "thirdName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
        CachingKey.ArFamily : CachingKey.EnFamily)}",
        "lastName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
        CachingKey.ArGrand : CachingKey.EnGrand)}",
        "gender": "${await sharedPreferenceManager.readString( CachingKey.Gender)}",
        "maritalStatus": "${await sharedPreferenceManager.readString( CachingKey.Gender)}",
        "birthdate": "${await sharedPreferenceManager.readString( CachingKey.DobG)}",
        "birthdateHijri": "${await sharedPreferenceManager.readString( CachingKey.DobH)}",
        "nationality": "${await sharedPreferenceManager.readInt( CachingKey.Nationality)}",
        "idNo": "${await sharedPreferenceManager.readInt( CachingKey.NATIONALITY_ID)}",
        "resumeURL": "",
        "educationLevelId": await sharedPreferenceManager.readString( CachingKey.EDUCTIONAL_LEVEL_ID),
        "educationMajorId": await sharedPreferenceManager.readString( CachingKey.EDUCTION_MAJOR_ID),
        "jobTitleId": await sharedPreferenceManager.readString( CachingKey.JOB_TITLE_ID),
        "provinceId": await sharedPreferenceManager.readString( CachingKey.PROVINCE_ID),
        "cityId": await sharedPreferenceManager.readString( CachingKey.CITY_ID),
        "hasDrivingLicense": true,
        "status": "1",
        "creationDate": "2023-02-22T11:21:45.534Z",
        "createBy": "cairo",
        "applicationUserId": "string",
        "jobTitleOtherName": "cairo",
        "educationMajorOtherName": "cairo",
        "applicantSkills":Shared.applicant_skills.map((skill_id) => {
          {
            "applicantId": 0,
            "skillId": skill_id
          }
        }).toList(),
        "workExperiences":Shared.user_experinces
            .map((e)  => {
          "countryId": e.countryId,
          "provinceId": e.provinceId,
          "cityId": e.cityId,
          "jobTitleId":e.jobTitleId,
          "startMonth": e.startMonth,
          "startYear": e.startYear,
          "endMonth": e.endMonth,
          "endYear": e.endYear,
          "address": e.address,
          "orgName": e.orgName,
          "orgField": e.orgField,
          "jobRoleName": e.jobRoleName,
          "description": e.description,
          "createBy": e.createBy
    }).toList(),

      }
    }
    );


    return NetworkUtil.internal().post(AuthenticationModel(),
        baseUrl +  "api/v1/register-applicants",
        body: formData,
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
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
