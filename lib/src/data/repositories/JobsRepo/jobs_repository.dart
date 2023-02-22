import 'package:code/src/Base/common/config.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';

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
}
JobRepository jobRepository = new JobRepository();