


import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/apply_initative_screen.dart';
import 'package:file_picker/file_picker.dart';

abstract class AppEvent {}

class click extends AppEvent{
  var signup_attachments;
  UserEductionEntity? userEductionEntity;
  click({this.signup_attachments,this.userEductionEntity});
}

//PROFIEL
class ProfileUpdateEvent extends AppEvent{
  BuildContext? context;
  UserEductionEntity? userEductionEntity;
  ProfileUpdateEvent({this.context,this.userEductionEntity});
}
class GetProfileDataEvent extends AppEvent{
  BuildContext? context;
  GetProfileDataEvent({this.context});
}
class GetProfileSkillsEvent extends AppEvent{
  BuildContext? context;
  GetProfileSkillsEvent({this.context});
}
class GetExperienceEvent extends AppEvent{
  BuildContext? context;
  GetExperienceEvent({this.context});
}
class DeleteExperienceEvent extends AppEvent{
  String? experience_id ;

  DeleteExperienceEvent({this.experience_id,});
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
class ExpireWaitNafathStatusEvent extends AppEvent{
  ExpireWaitNafathStatusEvent();
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

class GetSuggestedJobsEvent extends AppEvent{
  var jobTitleId ; var cityId;
  GetSuggestedJobsEvent({this.jobTitleId , this.cityId});
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
class GetPreviousInitativeDtailsEvent extends AppEvent{
  String? iniatives_id;
  GetPreviousInitativeDtailsEvent({this.iniatives_id});
}

class ApplyInitativeEvent extends AppEvent{
  String? fullname;
  String? phone;
  String? nationality_id;
  var initstive_files;
  ApplyInitativeEvent({this.phone,this.nationality_id,this.fullname,this.initstive_files});
}
class UpdateAppliedInitativeEvent extends AppEvent{
  String? fullname;
  String? phone;
  String? nationality_id;
  var initstive_files;
  UpdateAppliedInitativeEvent({this.phone,this.nationality_id,this.fullname,this.initstive_files});
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
class PutcourseViewCounterEvent extends AppEvent{
  CourseEntity? courseEntity;
  PutcourseViewCounterEvent({this.courseEntity} );
}
//ATTACHMENTS
class GetAllAttachmentsEvent extends AppEvent{
  String? applicationId;
  String? applicationTypeId;
  GetAllAttachmentsEvent({this.applicationId,this.applicationTypeId});
}
class DeleteAttachmentEvent extends AppEvent{
  String? attachmentId ;
  bool? attachmentInitative ;
  String? previous_iniative_id ;
  DeleteAttachmentEvent({this.attachmentId,this.attachmentInitative= false,this.previous_iniative_id});
}






