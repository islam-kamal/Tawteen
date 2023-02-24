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
      print("${key.value} : ${value}");
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

    return Future.value(sharedPreferences!.getString(key.value) ?? "");
  }

}

class NotValidCacheTypeException implements Exception {
  String message() => "Not a valid cahing type";
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);

  static const CachingKey AUTH_TOKEN = CachingKey('AUTH_TOKEN');
  static const CachingKey FRIST_TIME = const CachingKey('FRIST_TIME');
  static const CachingKey FRIST_LOGIN = const CachingKey('FRIST_LOGIN');
  static const CachingKey USER_ID = const CachingKey('USER_ID');
  static const CachingKey EDUCTIONAL_LEVEL_ID= const CachingKey('EDUCTIONAL_LEVEL_ID');
  static const CachingKey EDUCTION_MAJOR_ID= const CachingKey('EDUCTION_MAJOR_ID');
  static const CachingKey CITY_ID = const CachingKey('CITY_ID');
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
  static const CachingKey JOB_TITLE_NAME_AR= const CachingKey('JOB_TITLE_NAME_AR');
  static const CachingKey JOB_TITLE_NAME_EN= const CachingKey('JOB_TITLE_NAME_EN');
  static const CachingKey PUBLISH_START_DATE = const CachingKey('PUBLISH_START_DATE');
  static const CachingKey PUBLISH_END_DATE = const CachingKey('PUBLISH_END_DATE');
  static const CachingKey APP_LANGUAGE = const CachingKey('APP_LANGUAGE');
  static const CachingKey COURSE_ID = const CachingKey('COURSE_ID');
  static const CachingKey COURSE_ACEDEMY_ID = const CachingKey('COURSE_ACEDEMY_ID');

  static const CachingKey EMAIL = const CachingKey('EMAIL');
  static const CachingKey MOBILE_NUMBER = const CachingKey('MOBILE_NUMBER');
  static const CachingKey USER_COUNTRY_CODE = const CachingKey('USER_COUNTRY_CODE');

  static const CachingKey FIREBASE_TOKEN = const CachingKey('FIREBASE_TOKEN');
  static const CachingKey CART_QUOTE = const CachingKey('CART_QUOTE');
  static const CachingKey GUEST_CART_QUOTE = const CachingKey('GUEST_CART_QUOTE');

}

final sharedPreferenceManager = SharedPreferenceManager();
