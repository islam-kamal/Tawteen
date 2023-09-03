import 'dart:convert';

import 'package:code/src/Base/enumeration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  SharedPreferences? sharedPreferences;

  Future<bool> removeData(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.remove(key.value);
  }

  Future<Future> writeData(CachingKey key, value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    Future? returnedValue;
    if (value is String) {
      returnedValue = sharedPreferences!.setString(key.value, value);
    } else if (value is int) {
      returnedValue = sharedPreferences!.setInt(key.value, value);
    } else if (value is bool) {
      returnedValue = sharedPreferences!.setBool(key.value, value);
    } else if (value is double) {
      returnedValue = sharedPreferences!.setDouble(key.value, value);
    }else if (value is List<String>) {

      returnedValue = sharedPreferences!.setStringList(key.value, value);

    }else {
      return Future.error(NotValidCacheTypeException());
    }
    return returnedValue;
  }

  Future<List<String>> readListString(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getStringList(key.value) ?? []);
  }

  Future<String> readString(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getString(key.value).toString() ?? "");
  }

  Future<int> readInt(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getInt(key.value));
  }
}

class NotValidCacheTypeException implements Exception {
  String message() => "Not a valid cahing type";
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);

  static const CachingKey AUTH_TOKEN = CachingKey('AUTH_TOKEN');
  static const CachingKey DEVICE_TOKEN = CachingKey('DEVICE_TOKEN');

  static const CachingKey FRIST_TIME = const CachingKey('FRIST_TIME');
  static const CachingKey FRIST_LOGIN = const CachingKey('FRIST_LOGIN');
  static const CachingKey USER_ID = const CachingKey('USER_ID');
  static const CachingKey EDUCTIONAL_LEVEL_ID= const CachingKey('EDUCTIONAL_LEVEL_ID');
  static const CachingKey EDUCTION_MAJOR_ID= const CachingKey('EDUCTION_MAJOR_ID');
  static const CachingKey CITY_ID = const CachingKey('CITY_ID');
  static const CachingKey CITY_NAME_AR = const CachingKey('CITY_NAME');
  static const CachingKey CITY_NAME_En = const CachingKey('CITY_NAME');
  static const CachingKey PROVINCE_ID= const CachingKey('PROVINCE_ID');
  static const CachingKey SKILLS_ID= const CachingKey('SKILLS_ID');
  static const CachingKey JOB_ID= const CachingKey('JOB_ID');
  static const CachingKey RESUME_URL= const CachingKey('RESUME_URL');
  static const CachingKey APPLICANT_ID= const CachingKey('APPLICANT_ID');
  static const CachingKey START_MONTH= const CachingKey('START_MONTH');
  static const CachingKey END_MONTH= const CachingKey('END_MONTH');
  static const CachingKey START_YEAR= const CachingKey('START_YEAR');
  static const CachingKey END_YEAR= const CachingKey('END_YEAR');


  static const CachingKey JOB_TITLE_ID= const CachingKey('JOB_TITLE_ID');
  static const CachingKey MAIN_JOB_TITLE_ID= const CachingKey('MAIN_JOB_TITLE_ID');
  static const CachingKey JOB_TITLE_NAME_AR= const CachingKey('JOB_TITLE_NAME_AR');
  static const CachingKey JOB_TITLE_NAME_EN= const CachingKey('JOB_TITLE_NAME_EN');
  static const CachingKey PUBLISH_START_DATE = const CachingKey('PUBLISH_START_DATE');
  static const CachingKey PUBLISH_END_DATE = const CachingKey('PUBLISH_END_DATE');
  static const CachingKey APP_LANGUAGE = const CachingKey('APP_LANGUAGE');
  static const CachingKey COURSE_ID = const CachingKey('COURSE_ID');
  static const CachingKey COURSE_ACEDEMY_ID = const CachingKey('COURSE_ACEDEMY_ID');

  static const CachingKey EMAIL = const CachingKey('EMAIL');
  static const CachingKey MOBILE_NUMBER = const CachingKey('MOBILE_NUMBER');

  static const CachingKey NATIONALITY_ID = const CachingKey('NATIONALITY_ID');
  static const CachingKey ArFirst = const CachingKey('ArFirst');
  static const CachingKey ArFather = const CachingKey('ArFather');
  static const CachingKey ArGrand = const CachingKey('ArGrand');
  static const CachingKey ArFamily = const CachingKey('ArFamily');
  static const CachingKey EnFirst = const CachingKey('EnFirst');
  static const CachingKey EnFather = const CachingKey('EnFather');
  static const CachingKey EnGrand = const CachingKey('EnGrand');
  static const CachingKey EnFamily = const CachingKey('EnFamily');
  static const CachingKey ArTwoNames = const CachingKey('ArTwoNames');
  static const CachingKey EnTwoNames = const CachingKey('EnTwoNames');
  static const CachingKey ArFullName = const CachingKey('ArFullName');
  static const CachingKey EnFullName = const CachingKey('EnFullName');
  static const CachingKey Gender = const CachingKey('Gender');
  static const CachingKey IdIssueDateG = const CachingKey('IdIssueDateG');
  static const CachingKey IdIssueDateH = const CachingKey('IdIssueDateH');
  static const CachingKey IdExpiryDateG = const CachingKey('IdExpiryDateG');
  static const CachingKey IdExpiryDateH = const CachingKey('IdExpiryDateH');
  static const CachingKey Nationality = const CachingKey('Nationality');
  static const CachingKey Language = const CachingKey('Language');
  static const CachingKey ArNationality = const CachingKey('ArNationality');
  static const CachingKey EnNationality = const CachingKey('EnNationality');
  static const CachingKey DobG = const CachingKey('DobG');
  static const CachingKey DobH = const CachingKey('DobH');
  static const CachingKey status = const CachingKey('status');
  static const CachingKey INITATIVES_ID= const CachingKey('INITATIVES_ID');
  static const CachingKey PREVIOUS_INITATIVES_ID= const CachingKey('PREVIOUS_INITATIVES_ID');
  static const CachingKey INITATIVE_TITLE= const CachingKey('INITATIVE_TITLE');

  static const CachingKey SUGGESTED_JIBS_CITY_ID= const CachingKey('SUGGESTED_JIBS_CITY_ID');
  static const CachingKey SUGGESTED_JIBS_JOB_TITLE_ID= const CachingKey('SUGGESTED_JIBS_JOB_TITLE_ID');
}

final sharedPreferenceManager = SharedPreferenceManager();
