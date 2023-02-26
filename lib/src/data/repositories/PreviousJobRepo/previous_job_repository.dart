import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';

class PreviousJobRepository{
  Future<PreviousJobModel?> getApplicantPreviousJobs() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0YmF0YXlzN0BnbWFpbC5jb20iLCJqdGkiOiI0MzBjMDJhNC0wMGMzLTQ5ZTYtODM4Ni0xODZmZGM2YWY2YTUiLCJlbWFpbCI6InRiYXRheXM3QGdtYWlsLmNvbSIsInVpZCI6ImJmY2VmYTA1LTU4ZGUtNDg3Mi05NTM5LTNjYzAzOGIyZDc5MiIsImlwIjoiMTAuMjE3Ljk3LjIzMSIsInJvbGVzIjoiQXBwbGljYW50IiwiZXhwIjoxNjc3NDg1MDE5LCJpc3MiOiJJZGVudGl0eSIsImF1ZCI6IklkZW50aXR5VXNlciJ9.agL1IrE-NVK_RMq1qY3DKwMPu_n34rMVvRr1tox6UD4"
    };
    return NetworkUtil.internal().get(
        PreviousJobModel(), baseUrl + "api/v1/applicants-jobs/80"
        //${sharedPreferenceManager.readString(CachingKey.APPLICANT_ID)}
        , headers: headers  );
  }
}
final previousJobRepository = PreviousJobRepository();