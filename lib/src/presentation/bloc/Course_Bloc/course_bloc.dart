import 'dart:math';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CourseModel/course_details_model.dart';
import 'package:code/src/data/models/CourseModel/course_model.dart';
import 'package:code/src/data/repositories/CourseRepo/course_repository.dart';
import 'package:rxdart/subjects.dart';

class CourseBloc extends Bloc<AppEvent,AppState>{
  CourseBloc() : super(Start()){
    on<GetAllCoursesEvent>(_onGetAllCoursesFun);
    on<GetCourseDetailsEvent>(_onGetCourseDetailsFun);
    on<PutcourseViewCounterEvent>(_onCourseViewCounterFun);
  }
  BehaviorSubject<CourseModel> _all_courses_subject = new BehaviorSubject<CourseModel>();
  get all_courses_subject {
    return _all_courses_subject;
  }

  BehaviorSubject<CourseDetailsModel> _course_details_subject = new BehaviorSubject<CourseDetailsModel>();
  get course_details_subject {
    return _course_details_subject;
  }


  void drainStream() {
    _all_courses_subject.close();
    _course_details_subject.close();
  }


  Future<void> _onGetAllCoursesFun(GetAllCoursesEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await course_repository.getAllCourses();
      if(response!.httpStatusCode == 200 ){
        _all_courses_subject.sink.add(response);
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

  Future<void> _onGetCourseDetailsFun(GetCourseDetailsEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var response = await course_repository.getCourseDetails(
        courseEntity: event.course
      );
      if(response!.httpStatusCode == 200 ){
        _course_details_subject.sink.add(response);
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


  Future<void> _onCourseViewCounterFun(PutcourseViewCounterEvent event, Emitter<AppState> emit) async {
    try {
      await course_repository.course_view_counter(
        courseEntity: event.courseEntity
      ).onError((error, stackTrace){
        print("error : $error");
        print("stackTrace : $stackTrace");
      });
    } catch (e) {
      emit(
        ErrorLoading(message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }
}
final course_bloc = new CourseBloc();