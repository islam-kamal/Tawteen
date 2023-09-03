import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/presentation/bloc/Previous_Initatives_Bloc/previous_initatives_bloc.dart';
import 'package:rxdart/subjects.dart';

class AttachmentBloc extends Bloc<AppEvent,AppState>{
  AttachmentBloc():super(Start()){
    on<GetAllAttachmentsEvent>(_onGetAllAttachmentsFun);
    on<DeleteAttachmentEvent>(_onDeleteAttachmentFun);
  }

  BehaviorSubject<AttachmentModel> _all_attachments_subject = new BehaviorSubject<AttachmentModel>();
  get all_attachments_subject {
    return _all_attachments_subject;
  }

  Future<void> _onGetAllAttachmentsFun(GetAllAttachmentsEvent event,Emitter<AppState> emit)async{
    try {
      emit(Loading());
      var response = await attachment_repository.getAllAttachments(
        applicationId: event.applicationId,
        applicationTypeId: event.applicationTypeId
      );
      if(response!.httpStatusCode == 200 || response.data!.isEmpty){
        _all_attachments_subject.sink.add(response);
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

  Future<void> _onDeleteAttachmentFun(DeleteAttachmentEvent event,Emitter<AppState> emit)async{
    try {
      emit(Loading());
      var response = await attachment_repository.deleteAttachment(
          attachmentId: event.attachmentId,
      );
      if(response!.httpStatusCode == 200 ){
        emit( Done(model: response));
        if(event.attachmentInitative!){
          previousInitativesBloc.add(GetPreviousInitativeDtailsEvent(
              iniatives_id: event.previous_iniative_id));
        }else{
          attachments_bloc.add(GetAllAttachmentsEvent(
              applicationId: await sharedPreferenceManager.readString(CachingKey.APPLICANT_ID),
              applicationTypeId: "3"
          ));
        }

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
final attachments_bloc = AttachmentBloc();