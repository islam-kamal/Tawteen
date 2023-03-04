import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';

class PreviousJobRepository{
  Future<PreviousJobModel?> getApplicantPreviousJobs() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwianRpIjoiN2ZjOGUzZDgtMTFiMi00MWM3LWJmZjQtNTYzZGYxZjY0MTRkIiwiZW1haWwiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwidWlkIjoiMTEyZTI4NmEtMjMyMS00MjJhLTk3ZjItNWE3NTAzOTY3MWM5IiwiaXAiOiIxMC4yMTcuOTcuMTcxIiwidXNlclR5cGVJZCI6IjMiLCJyb2xlcyI6IkFwcGxpY2FudCIsImV4cCI6MTY3Nzk2Mjc2MiwiaXNzIjoiSWRlbnRpdHkiLCJhdWQiOiJJZGVudGl0eVVzZXIifQ.th1GorLx9IbsyavMStnF80xg6D1Zvc0UcM21xqtWudQ"
    };
    return NetworkUtil.internal().get(
        PreviousJobModel(), baseUrl + "api/v1/applicants-jobs/${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"

        , headers: headers  );
  }
}
final previousJobRepository = PreviousJobRepository();