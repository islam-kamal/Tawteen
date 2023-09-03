import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/INitativesModel/initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/apply_initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/models/InitativesModel/previous_initative_details_model.dart';
import 'package:code/src/data/models/InitativesModel/previous_initatives_model.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';

class IntativesRepository{

  Future<InitativesModel?> getAllInitatives() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        InitativesModel(), baseUrl + getAllIntativesUrl, headers: headers  );
  }

  Future<InitativesDetailsModel?> getInitativeDetails({String? initative_id}) async {

    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        InitativesDetailsModel(),
        baseUrl + "api/v1/initiatives/${initative_id}",
        headers: headers  );
  }

  Future<ApplyInitativesModel?> applyintativeRequest({String? fullname, String? phone,
    String? nationality_id}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
    };


    return NetworkUtil.internal().post(
        ApplyInitativesModel(),
        baseUrl + applyIntativeUrl,
        headers: headers ,
        body: jsonEncode({
          "noId": nationality_id,
          "fullName": fullname,
          "phone": phone,
          "refId": await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID),
          "userType": 3,
          "initiativeId": await sharedPreferenceManager.readString(CachingKey.INITATIVES_ID),
          "title": await sharedPreferenceManager.readString(CachingKey.INITATIVE_TITLE),
        })
    );
  }

  Future<ApplyInitativesModel?> deleteIntativeRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'

    };
    return NetworkUtil.internal().put(
        ApplyInitativesModel(),
        baseUrl + "api/v1/applied-initiative-status/${await sharedPreferenceManager.readString(CachingKey.PREVIOUS_INITATIVES_ID)}",
        body: jsonEncode({
          "status": "0",
        }) ,
        headers: headers  );
  }

  Future<PreviousInitativesModel?> getApplicantPreviousInitatives() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      "Authorization": "Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}"
    };
    return NetworkUtil.internal().get(
        PreviousInitativesModel(),
        baseUrl + "api/v1/applied-initiative?refId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"
            "&userType=3" //"URL OF PREVIOUS INITATIVES"
        , headers: headers  );
  }

  Future<PreviousIntativeDetailsModel?> getPreviousInitativesDetails({String? initative_id}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      "Authorization": "Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}"
    };
    return NetworkUtil.internal().get(
        PreviousIntativeDetailsModel(),
        baseUrl + "api/v1/applied-initiative?refId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"
            "&userType=3&id=$initative_id" //"URL OF PREVIOUS INITATIVES"
        , headers: headers  );
  }


  Future<ApplyInitativesModel?> updatePreviousIntativeRequest({String? fullname, String? phone,String? nationality_id}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
    };


    return NetworkUtil.internal().post(
        ApplyInitativesModel(),
        baseUrl + " " ,/*UPDATE PREVIOUS INITATIVE URL*/
        headers: headers ,
        body: jsonEncode({
          "noId": nationality_id,
          "fullName": fullname,
          "phone": phone,
          "refId": await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID),
          "userType": 3,
          "initiativeId": await sharedPreferenceManager.readString(CachingKey.INITATIVES_ID),
          "title": await sharedPreferenceManager.readString(CachingKey.INITATIVE_TITLE),
        })
    );
  }


}
final intativesRepository = IntativesRepository();