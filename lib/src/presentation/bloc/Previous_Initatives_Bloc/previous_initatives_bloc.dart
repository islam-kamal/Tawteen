import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/InitativesModel/previous_initative_details_model.dart';
import 'package:code/src/data/models/InitativesModel/previous_initatives_model.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/data/repositories/InitativesRepo/initatives_repository.dart';
import 'package:code/src/data/repositories/JobsRepo/jobs_repository.dart';
import 'package:code/src/data/repositories/PreviousJobRepo/previous_job_repository.dart';
import 'package:rxdart/rxdart.dart';

class PreviousInitativesBloc extends Bloc<AppEvent, AppState> {
  PreviousInitativesBloc() : super(Start()) {
    on<GetPreviousInitativesEvent>(_onGetPreviousInitativesFun);
    on<GetPreviousInitativeDtailsEvent>(_onPreviousInitativesDetailsFun);
  }

  BehaviorSubject<PreviousInitativesModel> _previous_initatives_subject = new BehaviorSubject<PreviousInitativesModel>();
  get previous_initatives_subject {
    return _previous_initatives_subject;
  }


  BehaviorSubject<PreviousIntativeDetailsModel> _previous_initative_details_subject = new BehaviorSubject<PreviousIntativeDetailsModel>();
  get previous_initative_details_subject {
    return _previous_initative_details_subject;
  }
  void drainStream() {
    _previous_initatives_subject.close();
  }

  Future<void> _onGetPreviousInitativesFun(
      GetPreviousInitativesEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
     var response = await intativesRepository.getApplicantPreviousInitatives();
      if (response!.data != null) {
        _previous_initatives_subject.sink.add(response);
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

  Future<void> _onPreviousInitativesDetailsFun(GetPreviousInitativeDtailsEvent event,
      Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await intativesRepository.getPreviousInitativesDetails(
          initative_id: event.iniatives_id
      );
      if (response!.succeeded!) {
        _previous_initative_details_subject.sink.add(response);
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

final previousInitativesBloc = PreviousInitativesBloc();
