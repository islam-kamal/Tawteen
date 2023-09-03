import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';
import 'package:code/src/data/repositories/PreviousJobRepo/previous_job_repository.dart';
import 'package:rxdart/rxdart.dart';

class PreviousJobBloc extends Bloc<AppEvent, AppState> {
  PreviousJobBloc() : super(Start()) {
    on<GetPreviousJobsEvent>(_onGetPreviousJobsFun);
  }

  BehaviorSubject<PreviousJobModel> _previous_jobs_subject = new BehaviorSubject<PreviousJobModel>();
  get previous_jobs_subject {
    return _previous_jobs_subject;
  }


  void drainStream() {
    _previous_jobs_subject.close();
  }

  Future<void> _onGetPreviousJobsFun(
      GetPreviousJobsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
     var response = await previousJobRepository.getApplicantPreviousJobs();
      if (response!.data != null) {
        _previous_jobs_subject.sink.add(response);
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

final previousJobsBloc = PreviousJobBloc();
