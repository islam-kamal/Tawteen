


import 'package:code/src/Base/common/file_export.dart';

abstract class AppEvent {}

class click extends AppEvent{
   BuildContext? context;
  click({this.context});
}


//Nafath
class NafathActionEvent extends AppEvent{
  String? nationalId;
  NafathActionEvent({this.nationalId});
}
//User info
class UserInfoClick extends AppEvent{
  final String? token;

  UserInfoClick({this.token});
}

//forget password events
class sendOtpClick extends AppEvent{
  final String? phone;
  final String? route;

  sendOtpClick({this.phone,this.route});
}

class checkOtpClick extends AppEvent{
  final String? route;
  final String? otp_code;
  checkOtpClick({this.otp_code,this.route});
}

class resendOtpClick extends AppEvent{
  final String? otp_code;
  final String? route;

  resendOtpClick({this.otp_code,this.route});
}



class logoutClick extends AppEvent{}




//Cities
class GetAllCitiesEvent extends AppEvent{}



// SEARCH
class SearchJobsEvent extends AppEvent{
  SearchSpecficJobsEntity? searchSpecficJobsEntity;
  SearchJobsEvent({this.searchSpecficJobsEntity});
}


//JOBS
class GetAllJobsEvent extends AppEvent{
  BuildContext? context;
  String? pageSize;
  GetAllJobsEvent({this.context,this.pageSize});
}

class GetJobDetailsEvent extends AppEvent{
  String? job_id;
  GetJobDetailsEvent({this.job_id});
}

//COURSES
class GetAllCoursesEvent extends AppEvent{
  BuildContext? context;
  String? pageSize;
  GetAllCoursesEvent({this.context,this.pageSize});
}

class GetCourseDetailsEvent extends AppEvent{
  CourseEntity? course;

  GetCourseDetailsEvent({this.course});
}




