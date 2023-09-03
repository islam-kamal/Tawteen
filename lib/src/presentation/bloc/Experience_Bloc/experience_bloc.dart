import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/ExperienceRepo/experience_repository.dart';
import 'package:code/src/data/repositories/ProfileRepo/profile_repository.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ExperienceBloc extends Bloc<AppEvent, AppState> {
  ExperienceBloc() : super(Start()) {
    on<GetExperienceEvent>(_onGetExperiencesFun);

  }

  BehaviorSubject<List<ExperienceEntity>> _experience_subject = new BehaviorSubject<List<ExperienceEntity>>();
  get experience_subject {
    return _experience_subject;
  }
  set(List<ExperienceEntity> experiences){
    _experience_subject.sink.add(experiences);
  }

  void drainStream() {
    _experience_subject.close();
  }

  Future<void> _onGetExperiencesFun(
      GetExperienceEvent event, Emitter<AppState> emit) async {
    try {
      emit(ProfileExperienceLoading());
     await experience_repository.getApplicantExperience().whenComplete((){
        _experience_subject.sink.add(Shared.profile_experiences!);
      });
        emit(ProfileExperienceDone());

    } catch (e) {
      emit(
        ProfileExperienceErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }


}

final experienceBloc = ExperienceBloc();