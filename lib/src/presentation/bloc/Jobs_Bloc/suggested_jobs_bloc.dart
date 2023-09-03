import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';
import 'package:code/src/data/repositories/ProfileRepo/profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class SuggestedJobsBloc extends Bloc<AppEvent, AppState> {
  SuggestedJobsBloc() : super(Start()) {
    on<GetSuggestedJobsEvent>(_onGetSuggestedobsFun);
  }

  BehaviorSubject<AllJobsModel> _suggested_jobs_subject =
  new BehaviorSubject<AllJobsModel>();
  get suggested_jobs_subject {
    return _suggested_jobs_subject;
  }



  void drainStream() {
    _suggested_jobs_subject.close();
  }

  Future<void> _onGetSuggestedobsFun(
      GetSuggestedJobsEvent event, Emitter<AppState> emit) async {
    try {
      print("1");
      emit(Loading());
      print("2");
      await jobRepository.getSuggestedJobs(
        jobTitleId: event.jobTitleId,
        cityId: event.cityId,
      ).then((value){
        print("value## : ${value}");
        if (value!.succeeded!) {
          _suggested_jobs_subject.sink.add(value);
          emit(Done(model: value));
        }
        else {
          emit(ErrorLoading(model: value));
        }
      });
/*      await profile_Repository.getProfileData().then((value) async {
        if(value!.succeeded!){

          await jobRepository.getSuggestedJobs(
            jobTitleId:value.data!.jobTitleId.toString(),
           cityId: value.data!.cityId,
          ).then((value){
            print("value## : ${value}");
            if (value!.succeeded!) {
              _suggested_jobs_subject.sink.add(value);
              emit(Done(model: value));
            }
            else {
              emit(ErrorLoading(model: value));
            }
          });
        }
        else{
          emit(
              ErrorLoading(
                message: "Failed to fetch data. Is your device online ?",
              ));
        }

      });*/


    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

}

final suggestedJobsBloc = SuggestedJobsBloc();
