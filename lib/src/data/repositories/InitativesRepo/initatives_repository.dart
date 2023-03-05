import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/INitativesModel/initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/apply_initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';

class IntativesRepository{

  Future<InitativesModel?> getAllInitatives() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        InitativesModel(), baseUrl + getAllIntativesUrl, headers: headers  );
  }

  Future<InitativesDetailsModel?> getInitativeDetails({String? initative_id}) async {

    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        InitativesDetailsModel(),
        baseUrl + "aapi/v1/initiatives/${initative_id}",
        headers: headers  );
  }

  Future<ApplyInitativesModel?> applyintativeRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
    };


    return NetworkUtil.internal().post(
        ApplyInitativesModel(),
        baseUrl + applyIntativeUrl,
        headers: headers ,
        body: jsonEncode({
          "userTypeId": "3",
          "applicantId":await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID),

        })
    );
  }

  Future<ApplyInitativesModel?> deleteIntativeRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'

    };
    return NetworkUtil.internal().put(
        ApplyInitativesModel(),
        baseUrl + "api/v1/initiative-status/${await sharedPreferenceManager.readString(CachingKey.INITATIVES_ID)}",
        body: jsonEncode({
          "status": "0",
        }) ,
        headers: headers  );
  }

  Future<PreviousJobModel?> getApplicantPreviousJobs() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}"
    };
    return NetworkUtil.internal().get(
        PreviousJobModel(), baseUrl + "api/v1/applicants-jobs/${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}" //"URL OF PREVIOUS INITATIVES"
        , headers: headers  );
  }


}
final intativesRepository = IntativesRepository();