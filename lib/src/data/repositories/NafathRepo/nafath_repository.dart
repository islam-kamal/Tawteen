import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/sigin_model.dart';
import 'package:code/src/data/models/NafathModel/applicant_data_model.dart';
import 'package:code/src/data/models/NafathModel/applicant_exist_model.dart';
import 'package:code/src/data/models/NafathModel/nafath_check_status_model.dart';
import 'package:code/src/data/models/NafathModel/nafath_rquest_model.dart';
import 'package:code/src/data/repositories/AppPublishRepo/app_publish_repository.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;

class NafathRepository{

  Future<NafathRequestModel?> sendNafathRequest({String? nationalId}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'

    };
    return NetworkUtil.internal().post(
        NafathRequestModel(),
        baseUrl + "api/v1/send-requst?nationalId=${nationalId}",
        headers: headers  );
  }

  Future<NafathCheckStatusModel?> nafathCheckStatus({String? nationalId, String? transId , String? random}) async {
  Map<String, String> headers = {
    'lang': translator.activeLanguageCode,
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',


  };
  return NetworkUtil.internal().post(
      NafathCheckStatusModel(),
      baseUrl + "api/v1/check-status?nationalId=${nationalId}&transId=${transId}&random=${random}",
      headers: headers  );
}

  Future<ApplicantExistModel?> checkApplicantExist({String? nationalId}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'

    };
    return NetworkUtil.internal().get(
        ApplicantExistModel(),
        baseUrl + "api/v1/applicants/check-exist/${nationalId}",
        headers: headers  );
  }

  Future<ApplicantDataModel?> getApplicantData({String? nationalId}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'

    };
    return NetworkUtil.internal().get(
        ApplicantDataModel(),
        baseUrl + "api/v1/applicants/by-IdNo/${nationalId}",
        headers: headers  );
  }

  Future<SignInModel?> signIn() async {
  Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'

    };


    return NetworkUtil.internal().post(
        SignInModel(),
        baseUrl + signinUrl,
        headers: headers ,
        body: jsonEncode({
/*          'username': await sharedPreferenceManager.readString(CachingKey.EMAIL),
          'password': "Password@1223${await sharedPreferenceManager.readString(CachingKey.EMAIL)}"*/
          'username': encrypt_text( await sharedPreferenceManager.readString(CachingKey.EMAIL)),
          'password':  encrypt_text("Password@1223${await sharedPreferenceManager.readString(CachingKey.EMAIL)}")
        })
    );
  }

  var key = encrypt.Key.fromUtf8('ABCDEFGHIJ0123456789asdfghjklzaa');
  final iv = encrypt.IV.fromLength(16);

   encrypt_text(String text){
     final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc ));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }


}

final nafath_repository = new NafathRepository();