
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchJobsBloc extends Bloc<AppEvent,AppState> {

  SearchJobsBloc() : super(Start()) {
    on<SearchJobsEvent>(_onSearchJobsFun);
  }


  BehaviorSubject<AllJobsModel> _search_jobs_subject = new BehaviorSubject<AllJobsModel>();
  get search_jobs_subject {
    return _search_jobs_subject;
  }


  void drainStream() {
    _search_jobs_subject.close();
  }


  Future<void> _onSearchJobsFun(SearchJobsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await jobRepository.search_specfic_job(
        searchSpecficJobsEntity: event.searchSpecficJobsEntity
      );

      if(response!.data != null ){
        _search_jobs_subject.sink.add(response);

        emit( Done(model: response));
      }else{
        emit( ErrorLoading(message: response.message));
      }

    } catch (e) {
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

}

final search_jobs_bloc = SearchJobsBloc();