import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';

class PreviousJobRepository{
  Future<PreviousJobModel?> getApplicantPreviousJobs() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',

      "Authorization": "Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}"
    };
    return NetworkUtil.internal().get(
        PreviousJobModel(), baseUrl + "api/v1/applicants-jobs/${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"
        , headers: headers  );
  }
}
final previousJobRepository = PreviousJobRepository();