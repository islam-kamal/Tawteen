import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/INitativesModel/initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/repositories/InitativesRepo/initatives_repository.dart';
import 'package:rxdart/subjects.dart';

class InitativesBloc extends Bloc<AppEvent,AppState>{
  InitativesBloc():super(Start()){
    on<GetAllInitativesEvent>(_onGetAllInitatives);
    on<GetInitativesDtailsEvent>(_onInitativesDetailsFun);
    on<ApplyInitativeEvent> (_onApplyInitativeFun);
    on<DeleteInitativeEvent>(_onDeleteInitativeFun);
  }

  BehaviorSubject<InitativesModel> _all_initatives_subject =
  new BehaviorSubject<InitativesModel>();
  get all_initatives_subject {
    return _all_initatives_subject;
  }

  BehaviorSubject<InitativesDetailsModel> _initative_details_subject =
  new BehaviorSubject<InitativesDetailsModel>();
  get initative_details_subject {
    return _initative_details_subject;
  }

  Future<void> _onGetAllInitatives(GetAllInitativesEvent event , Emitter<AppState> emit)async {
    try {
      emit(Loading());
      var response = await intativesRepository.getAllInitatives();
      if (response!.succeeded! ) {
        _all_initatives_subject.sink.add(response);
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

  Future<void> _onInitativesDetailsFun(GetInitativesDtailsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await intativesRepository.getInitativeDetails(
          initative_id: event.iniatives_id
      ).onError((error, stackTrace){
        print("error : ${error}");
        print("stackTrace : ${stackTrace}");
      });
      if (response!.succeeded!) {
        _initative_details_subject.sink.add(response);
        emit(Done(model: response));
      } else {

        emit(ErrorLoading(model: response));
      }
    } catch (e) {
      print("e : ${e.toString()}");
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onApplyInitativeFun(ApplyInitativeEvent event, Emitter<AppState>emitter)async{
    try {

      emit(Loading());
      var response = await intativesRepository.applyintativeRequest();
      if(response!.succeeded!  ){
        emit( Done(model: response));

      }else{
        emit( ErrorLoading(message: response.message));
      }

    } catch (e) {
      print("e ::: ${e}");
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onDeleteInitativeFun(DeleteInitativeEvent event, Emitter<AppState>emitter)async{
    try {

      emit(Loading());
      var response = await intativesRepository.deleteIntativeRequest().onError((error, stackTrace){
        print("error : ${error}");
        print("stackTrace : ${stackTrace}");
      });
      if(response!.succeeded!  ){
        emit( Done(model: response));

      }else{
        emit( ErrorLoading(message: response.message));
      }

    } catch (e) {
      print("e ::: ${e}");
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }
}

final initatives_bloc = InitativesBloc();