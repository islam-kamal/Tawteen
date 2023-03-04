

import 'dart:convert';

import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/authentication_model.dart';
import 'package:code/src/data/models/AuthenticationModel/sigin_model.dart';
import 'package:code/src/data/models/AuthenticationModel/user_info_model.dart';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AuthenticationRepository {
  static SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  static Future<AuthenticationModel> signUp() async {

/*

   Uri url = Uri(
        scheme: "https",
        host: "rowad-alnaql.tga.gov.sa",
        // port: ServicesURLs.development_environment_port,
        path: "/api/v1/register-applicants");

    print("http url : ${url}");
    var response = await http.post( url,
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
    body:jsonEncode( {
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
        "birthdateHijri": "${await sharedPreferenceManager.readInt( CachingKey.DobH)}",
        "nationality": "${await sharedPreferenceManager.readInt( CachingKey.Nationality)}",
        "idNo": "${await sharedPreferenceManager.readInt( CachingKey.NATIONALITY_ID)}",
        "resumeURL": "https://stackoverflow.com/",
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
        "applicantSkills":Shared.applicant_skills.map((skill_id) =>{
          "applicantId": "0",
          "skillId": skill_id
        }).toList(),
       "workExperiences":Shared.user_experinces.map((e)  => {
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
    }));


    print("request : ${response.body}");
*/


    return NetworkUtil.internal().post(AuthenticationModel(),
        baseUrl +  "api/v1/register-applicants",
        body: jsonEncode( {
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
            "birthdateHijri": "${await sharedPreferenceManager.readInt( CachingKey.DobH)}",
            "nationality": "${await sharedPreferenceManager.readInt( CachingKey.Nationality)}",
            "idNo": "${await sharedPreferenceManager.readInt( CachingKey.NATIONALITY_ID)}",
            "resumeURL": "https://stackoverflow.com/",
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
            "applicantSkills":Shared.applicant_skills.map((skill_id) =>{
              "applicantId": "0",
              "skillId": skill_id
            }).toList(),
            "workExperiences":Shared.user_experinces.map((e)  => {
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
        }),
        headers: Map<String, String>.from({
       'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
  }

/*
  static Future<String?> signIn({BuildContext? context, String? email}) async {
    Dio dio = new Dio();
    try {
      final response = await dio.post(
          baseUrl + "url",
          data: convert.jsonEncode({
            'username': email,
            'password': "${email}Password@1223"}),
          options: Options(headers: {'content-type': 'application/json'})
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
    }
  }
*/

  Future<SignInModel?> signIn({ String? email}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    FormData body = new FormData.fromMap({
      'username': email,
      'password': "${email}Password@1223"
    });

    return NetworkUtil.internal().post(
        SignInModel(),
        baseUrl + signinUrl,
        headers: headers ,
        body: body
    );
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

}
