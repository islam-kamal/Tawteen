

import 'dart:convert';

import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/authentication_model.dart';
import 'package:code/src/data/models/AuthenticationModel/sigin_model.dart';
import 'package:code/src/data/models/AuthenticationModel/user_info_model.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AuthenticationRepository {
  static SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  static Future<AuthenticationModel> signUp({UserEductionEntity? userEductionEntity}) async {

    Shared.user_experinces.forEach((element) {
      print("user_experinces : ${element.toJson()}");
    });
    print("    Shared.applicant_skills : ${    Shared.applicant_skills}");
    Shared.applicant_skills.forEach((element) {
      print("applicant_skills : ${element}");
    });

    return NetworkUtil.internal().post(AuthenticationModel(),
        baseUrl +  "api/v1/register-applicants",
        body: jsonEncode( {
          "registerRequest": {
            "email": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
            "userName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
            CachingKey.ArFullName : CachingKey.EnFullName)}",
            "password": "Password@1223${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
            "userTypeId": "3"
          },
          "createApplicant": {
            "name": "${await sharedPreferenceManager.readString( CachingKey.ArFullName)}",
            "nameEn": "${await sharedPreferenceManager.readString(CachingKey.EnFullName)}",
            "phone": "${await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER)}",
            "email": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
            "firstName": "${await sharedPreferenceManager.readString(translator.activeLanguageCode == 'ar' ?
            CachingKey.ArFirst : CachingKey.ArFirst)}",
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
            "resumeURL": "${await sharedPreferenceManager.readString( CachingKey.RESUME_URL)}",
            "educationLevelId": await sharedPreferenceManager.readString( CachingKey.EDUCTIONAL_LEVEL_ID),
            "educationMajorId": await sharedPreferenceManager.readString( CachingKey.EDUCTION_MAJOR_ID),
            "jobTitleId": await sharedPreferenceManager.readString( CachingKey.MAIN_JOB_TITLE_ID),
            "provinceId": await sharedPreferenceManager.readString( CachingKey.PROVINCE_ID),
            "cityId": await sharedPreferenceManager.readString( CachingKey.CITY_ID),
            "hasDrivingLicense": true,
            "status": "1",
            "creationDate": "2023-02-22T11:21:45.534Z",
            "createBy": "cairo",
            "applicationUserId": "string",
            "jobTitleOtherName": "cairo",
            "educationMajorOtherName": "cairo",
            "totalExperience": userEductionEntity!.totalExperience,
            "university": userEductionEntity.university,
            "graduationYear": userEductionEntity.graduationYear,

            "applicantSkills":Shared.applicant_skills.isEmpty ? [] : Shared.applicant_skills.map((skill_id) =>{
              "applicantId": "0",
              "skillId": skill_id
            }).toList(),
            "workExperiences":Shared.user_experinces.isEmpty ? [] : Shared.user_experinces.map((e)  => {
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





  static Future<AuthenticationModel> logout(String token) {
    FormData formData = FormData.fromMap({
      'token': token,
    });
    return NetworkUtil.internal().post(AuthenticationModel(),
        "url",
        body: formData);
  }




  static Future<AuthenticationModel> saveFcmToken({String? device_token,String? applicantId}) {
/*    FormData formData = FormData.fromMap({
      'deviceId': device_token,
      'applicantId' : applicantId
    });*/
  print("device_token : ${device_token}");
  print("applicantId : ${applicantId}");
    return NetworkUtil.internal().post(AuthenticationModel(),
        baseUrl + "api/v1/save-deviceId",
        body:  jsonEncode({
          'deviceId': device_token,
          'applicantId' : applicantId
  }));
  }


}
