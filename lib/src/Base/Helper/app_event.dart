


import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';

abstract class AppEvent {}

class click extends AppEvent{
   BuildContext? context;
  click({this.context});
}


//Nafath
class SendNafathRequestEvent extends AppEvent{
  String? nationalId;
  SendNafathRequestEvent({this.nationalId});
}
class CheckNafathStatusEvent extends AppEvent{
  String? nationalId;
  String? transId ; String? random;
  CheckNafathStatusEvent({this.nationalId,this.transId,this.random});
}
class ApplicantCheckExistEvent extends AppEvent{
  String? nationalId;
  ApplicantCheckExistEvent({this.nationalId});
}
class GetApplicantDataEvent extends AppEvent{
  String? nationalId;
  GetApplicantDataEvent({this.nationalId});
}


//User info
class UserInfoClick extends AppEvent{
  final String? token;

  UserInfoClick({this.token});
}




class logoutClickEvent extends AppEvent{}

class loginClickEvent extends AppEvent{

}


//Cities
class GetAllCitiesEvent extends AppEvent{}



// SEARCH
class SearchJobsEvent extends AppEvent{
  SearchSpecficJobsEntity? searchSpecficJobsEntity;
  SearchJobsEvent({this.searchSpecficJobsEntity});
}

//EXPERIENCE
class AddExperienceEvent extends AppEvent{
  List<ExperienceEntity>? experienceEntity;
  AddExperienceEvent({this.experienceEntity});
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

class ApplyJobEvent extends AppEvent{

}

class DeleteJobEvent extends AppEvent{

}

//PREVIOUS JOBS
class GetPreviousJobsEvent extends AppEvent{

}

//PREVIOUS INITATIVES
class GetPreviousInitativesEvent extends AppEvent{
}

//INIATIVES
class GetAllInitativesEvent extends AppEvent{
}
class GetInitativesDtailsEvent extends AppEvent{
  String? iniatives_id;
  GetInitativesDtailsEvent({this.iniatives_id});
}

class ApplyInitativeEvent extends AppEvent{

}
class DeleteInitativeEvent extends AppEvent{

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

//ATTACHMENTS
class GetAllAttachmentsEvent extends AppEvent{
  String? applicationId;
  String? applicationTypeId;
  GetAllAttachmentsEvent({this.applicationId,this.applicationTypeId});
}
class DeleteAttachmentEvent extends AppEvent{
  String? attachmentId ;
  DeleteAttachmentEvent({this.attachmentId});
}




