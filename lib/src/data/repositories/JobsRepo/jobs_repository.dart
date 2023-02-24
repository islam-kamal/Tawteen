import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/apply_job_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:dio/dio.dart';

class JobRepository {

  Future<AllJobsModel?> getAllJobs() async {
    Map<String, String> headers = {
     'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        AllJobsModel(), baseUrl + getAllJobsUrl, headers: headers  );
  }

  Future<AllJobsModel?> search_specfic_job({SearchSpecficJobsEntity? searchSpecficJobsEntity}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        AllJobsModel(), baseUrl +
        "api/v1/jobs/all?jobTitleId=${searchSpecficJobsEntity!.jobTitleId}"
        "&cityId=${searchSpecficJobsEntity.cityId}"
        "&publishStartDate=${searchSpecficJobsEntity.publishStartDate}"
        "&publishEndDate=${searchSpecficJobsEntity.publishEndDate}"
        "&status=1",
        headers: headers  );
  }

  Future<JobDetailsModel?> getJobDetails({String? job_id}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        JobDetailsModel(),
        baseUrl + "api/v1/jobs/${job_id}?status=1",
        headers: headers  );
  }


  Future<ApplyJobModel?> applyJobRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    FormData body = new FormData.fromMap({
      "status": "1",
      "applicantId": await sharedPreferenceManager.readString(CachingKey.APPLICANT_ID),
      "jobId": await sharedPreferenceManager.readString(CachingKey.JOB_ID),
      "resumeURL": await sharedPreferenceManager.readString(CachingKey.RESUME_URL),
    });

    return NetworkUtil.internal().post(
        ApplyJobModel(),
        baseUrl + applyJobUrl,
        headers: headers ,
      body: body
    );
  }
}
JobRepository jobRepository = new JobRepository();