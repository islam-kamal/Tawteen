import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';

class ApplyJobBloc extends Bloc<AppEvent,AppState>{
  ApplyJobBloc():super(Start()){
    on<ApplyJobEvent>(_onApplyJobFun);
    on<DeleteJobEvent>(_onDeleteJobFun);
  }

  Future<void> _onApplyJobFun(ApplyJobEvent event, Emitter<AppState>emitter)async{
    try {

      emit(ApplyJobLoading());
      var response = await jobRepository.applyJobRequest();
      if(response!.succeeded!  ){
        emit( ApplyJobDone(model: response));

      }else{
        emit( ApplyJobErrorLoading(message: response.message));
      }

    } catch (e) {
      emit(
        ApplyJobErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onDeleteJobFun(DeleteJobEvent event, Emitter<AppState>emitter)async{
    try {

      emit(Loading());
      var response = await jobRepository.deleteJobRequest();
      if(response!.succeeded!  ){
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
final apply_job_bloc = ApplyJobBloc();