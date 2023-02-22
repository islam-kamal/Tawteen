import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CourseModel/course_details_model.dart';
import 'package:code/src/data/models/CourseModel/course_model.dart';

class CourseRepository{
  Future<CourseModel?> getAllCourses() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        CourseModel(), baseUrl + getAllCoursesUrl, headers: headers  );
  }

  Future<CourseDetailsModel?> getCourseDetails({CourseEntity? courseEntity}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };
    return NetworkUtil.internal().get(
        CourseDetailsModel(),
        baseUrl + "api/v1/courses/${courseEntity!.course_id}"
            "?academyId=${courseEntity.course_acedemy_id}&status=1",
        headers: headers  );
  }
}
final course_repository = CourseRepository();