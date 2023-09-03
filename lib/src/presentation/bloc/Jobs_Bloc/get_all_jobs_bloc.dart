import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetAllJobsBloc extends Bloc<AppEvent, AppState> {
  GetAllJobsBloc() : super(Start()) {
    on<GetAllJobsEvent>(_onGetAllJobsFun);
    on<GetJobDetailsEvent>(_onJobDetailsFun);
  }

  BehaviorSubject<AllJobsModel> _all_jobs_subject =
      new BehaviorSubject<AllJobsModel>();
  get all_jobs_subject {
    return _all_jobs_subject;
  }

  BehaviorSubject<JobDetailsModel> _job_details_subject =
      new BehaviorSubject<JobDetailsModel>();
  get job_details_subject {
    return _job_details_subject;
  }

  void drainStream() {
    _all_jobs_subject.close();
    _job_details_subject.close();
  }

  Future<void> _onGetAllJobsFun(
      GetAllJobsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await jobRepository.getAllJobs();
      if (response!.httpStatusCode == 200) {
        _all_jobs_subject.sink.add(response);
        emit(Done(model: response));
      } else {
        emit(ErrorLoading(model: response));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onJobDetailsFun(
      GetJobDetailsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await jobRepository.getJobDetails(
        job_id: event.job_id
      );
      if (response!.httpStatusCode == 200) {
        _job_details_subject.sink.add(response);
        emit(Done(model: response));
      } else {

        emit(ErrorLoading(model: response));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }
}

final getAllJobsBloc = GetAllJobsBloc();
