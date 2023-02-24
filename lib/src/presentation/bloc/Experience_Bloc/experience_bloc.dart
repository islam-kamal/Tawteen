import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:rxdart/rxdart.dart';

class ExperienceBloc extends Bloc<AppEvent, AppState> {
  ExperienceBloc() : super(Start()) {
    on<AddExperienceEvent>(_onGetExperiencesFun);
  }

  BehaviorSubject<List<ExperienceEntity>> _experience_subject = new BehaviorSubject<List<ExperienceEntity>>();
  get experience_subject {
    return _experience_subject;
  }

  void drainStream() {
    _experience_subject.close();
  }

  Future<void> _onGetExperiencesFun(
      AddExperienceEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());

        _experience_subject.sink.add(Shared.user_experinces);
        emit(Done());

    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }


}

final experienceBloc = ExperienceBloc();