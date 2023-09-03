import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CourseModel/course_details_model.dart';
import 'package:code/src/data/models/CourseModel/course_model.dart';
import 'package:code/src/data/models/CourseModel/course_view_counter_model.dart';

class CourseRepository{
  Future<CourseModel?> getAllCourses() async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        CourseModel(), baseUrl + getAllCoursesUrl, headers: headers  );
  }

  Future<CourseDetailsModel?> getCourseDetails({CourseEntity? courseEntity}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        CourseDetailsModel(),
        baseUrl + "api/v1/courses/${courseEntity!.course_id}"
            "?academyId=${courseEntity.course_acedemy_id}&status=1",
        headers: headers  );
  }

  Future<CourseViewCounterModel?> course_view_counter({CourseEntity? courseEntity}) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
      'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'

    };
    return NetworkUtil.internal().put(
        CourseViewCounterModel(),
        baseUrl + "api/v1/course-click/${courseEntity!.course_id}",

        headers: headers  );
  }
}
final course_repository = CourseRepository();