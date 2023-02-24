import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';

class ApplyJobBloc extends Bloc<AppEvent,AppState>{
  ApplyJobBloc():super(Start()){
    on<ApplyJobEvent>(_onApplyJobFun);
  }

  Future<void> _onApplyJobFun(ApplyJobEvent event, Emitter<AppState>emitter)async{
    try {
      emit(Loading());
      var response = await jobRepository.applyJobRequest();
      if(response!.httpStatusCode == 200 ){
        emit( Done(model: response));

      }else{
        print("response ::: ${response.toJson()}");
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