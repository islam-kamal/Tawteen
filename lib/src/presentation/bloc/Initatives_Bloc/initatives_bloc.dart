import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/INitativesModel/initatives_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
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
      );
      if (response!.succeeded!) {
        _initative_details_subject.sink.add(response);
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

  Future<void> _onApplyInitativeFun(ApplyInitativeEvent event, Emitter<AppState>emitter)async{
    try {

      emit(ApplyInitativeLoading());
      var response = await intativesRepository.applyintativeRequest(
        fullname: event.fullname,
        nationality_id: event.nationality_id,
        phone: event.phone
      );
      if(response!.succeeded!  ){
        emit( ApplyInitativeDone(model: response));
        event.initstive_files!.forEach((element)async {

          await attachment_repository.uploadAttachment(
              title: element.filename,
              refId: response.data.toString(),
              refIdType: "3",
              refObj: "9",
              subRefId: "0",
              createAttachements: element.files);
        });



      }else{
        emit( ApplyInitativeErrorLoading(message: response.message));
      }

    } catch (e) {
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onDeleteInitativeFun(DeleteInitativeEvent event, Emitter<AppState>emitter)async{
    try {

      emit(Loading());
      var response = await intativesRepository.deleteIntativeRequest();
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

final initatives_bloc = InitativesBloc();