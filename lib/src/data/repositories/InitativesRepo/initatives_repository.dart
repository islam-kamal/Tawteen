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
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwianRpIjoiN2ZjOGUzZDgtMTFiMi00MWM3LWJmZjQtNTYzZGYxZjY0MTRkIiwiZW1haWwiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwidWlkIjoiMTEyZTI4NmEtMjMyMS00MjJhLTk3ZjItNWE3NTAzOTY3MWM5IiwiaXAiOiIxMC4yMTcuOTcuMTcxIiwidXNlclR5cGVJZCI6IjMiLCJyb2xlcyI6IkFwcGxpY2FudCIsImV4cCI6MTY3Nzk2Mjc2MiwiaXNzIjoiSWRlbnRpdHkiLCJhdWQiOiJJZGVudGl0eVVzZXIifQ.th1GorLx9IbsyavMStnF80xg6D1Zvc0UcM21xqtWudQ'
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

  Future<ApplyInitativesModel?> deleteintativeRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwianRpIjoiN2ZjOGUzZDgtMTFiMi00MWM3LWJmZjQtNTYzZGYxZjY0MTRkIiwiZW1haWwiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwidWlkIjoiMTEyZTI4NmEtMjMyMS00MjJhLTk3ZjItNWE3NTAzOTY3MWM5IiwiaXAiOiIxMC4yMTcuOTcuMTcxIiwidXNlclR5cGVJZCI6IjMiLCJyb2xlcyI6IkFwcGxpY2FudCIsImV4cCI6MTY3Nzk2Mjc2MiwiaXNzIjoiSWRlbnRpdHkiLCJhdWQiOiJJZGVudGl0eVVzZXIifQ.th1GorLx9IbsyavMStnF80xg6D1Zvc0UcM21xqtWudQ'

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
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwianRpIjoiN2ZjOGUzZDgtMTFiMi00MWM3LWJmZjQtNTYzZGYxZjY0MTRkIiwiZW1haWwiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwidWlkIjoiMTEyZTI4NmEtMjMyMS00MjJhLTk3ZjItNWE3NTAzOTY3MWM5IiwiaXAiOiIxMC4yMTcuOTcuMTcxIiwidXNlclR5cGVJZCI6IjMiLCJyb2xlcyI6IkFwcGxpY2FudCIsImV4cCI6MTY3Nzk2Mjc2MiwiaXNzIjoiSWRlbnRpdHkiLCJhdWQiOiJJZGVudGl0eVVzZXIifQ.th1GorLx9IbsyavMStnF80xg6D1Zvc0UcM21xqtWudQ"
    };
    return NetworkUtil.internal().get(
        PreviousJobModel(), baseUrl + "URL OF INITATIVES"

        , headers: headers  );
  }


}
final intativesRepository = IntativesRepository();