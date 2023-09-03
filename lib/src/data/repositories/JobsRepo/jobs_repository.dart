import 'dart:convert';

import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/apply_job_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class JobRepository {

  Future<AllJobsModel?> getAllJobs() async {
    Map<String, String> headers = {
     'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        AllJobsModel(), baseUrl + getAllJobsUrl, headers: headers  );
  }





  Future<AllJobsModel?> getSuggestedJobs({var jobTitleId , var cityId}) async {
   print("1");
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    print("2");
    return NetworkUtil.internal().get(
        AllJobsModel(), baseUrl + "api/v1/jobs/all?status=1&jobTitleId=${jobTitleId}&cityId=${cityId}"
        , headers: headers  );
  }

  Future<AllJobsModel?> search_specfic_job({SearchSpecficJobsEntity? searchSpecficJobsEntity}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
    };
    return NetworkUtil.internal().get(
        AllJobsModel(), baseUrl +
        "api/v1/jobs/all?jobTitleId=${searchSpecficJobsEntity!.jobTitleId}"
        "&cityId=${searchSpecficJobsEntity.city_id}"
      /*  "&publishStartDate=${searchSpecficJobsEntity.publishStartDate}"
        "&publishEndDate=${searchSpecficJobsEntity.publishEndDate}"*/
        "&status=1",
        headers: headers  );
  }

  Future<JobDetailsModel?> getJobDetails({String? job_id}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
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
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
    };


    return NetworkUtil.internal().post(
        ApplyJobModel(),
        baseUrl + applyJobUrl,
        headers: headers ,
      body: jsonEncode({
        "status": "10",
        "applicantId":await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID),
        "jobId": await sharedPreferenceManager.readString(CachingKey.JOB_ID),
        "resumeURL": await sharedPreferenceManager.readString(CachingKey.RESUME_URL),
      })
    );
  }


  Future<ApplyJobModel?> deleteJobRequest() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'

    };
    return NetworkUtil.internal().delete(
        ApplyJobModel(),
        baseUrl + "api/v1/applicant-jobs?ApplicantId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"
            "&JobId=${ await sharedPreferenceManager.readString(CachingKey.JOB_ID)}",
        headers: headers  );
  }
}
JobRepository jobRepository = new JobRepository();