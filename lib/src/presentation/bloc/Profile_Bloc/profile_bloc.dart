import 'dart:async';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/ProfileModel/profile_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_skills_model.dart';
import 'package:code/src/data/repositories/ProfileRepo/profile_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends Bloc<AppEvent,AppState> with Validator{

  ProfileBloc():super(Start()){
    on<ProfileUpdateEvent>(_onProfileClick);
    on<GetProfileDataEvent>(_onGetProfileDataClick);
    on<GetProfileSkillsEvent>(_onGetProfileSkillsClick);

  }

  Future<void> _onProfileClick(ProfileUpdateEvent event , Emitter<AppState> emit)async{
    emit( Loading(model: null));
    await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID).then((value) async {
      await profile_Repository.update_profile(
          applicant_id: value,
        userEductionEntity: event.userEductionEntity
      ).then((value) {
        if(value!.succeeded!){
          Shared.profileSkills = [];
          emit( Done(model:value));
        }
        else{
          emit( ErrorLoading(model: value,message: value.message));
        }
      });
    });



  }


  Future<void> _onGetProfileDataClick(GetProfileDataEvent event , Emitter<AppState> emit)async{
    emit( Loading());

    var response = await profile_Repository.getProfileData();

    if(response!.succeeded!){
      sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, response.data!.phone);

      Shared.profileModel = new ProfileData(
        id: response.data!.id,
        status: response.data!.status,
        jobTitleId: response.data!.jobTitleId,
        cityId: response.data!.cityId,
        provinceId: response.data!.provinceId,
        educationLevelId: response.data!.educationLevelId,
        educationMajorId: response.data!.educationMajorId,
        idNo: response.data!.idNo,
        applicantSkills: response.data!.applicantSkills,
        educationLevelOtherName: response.data!.educationLevelOtherName,
        educationMajorOtherName: response.data!.educationMajorOtherName,
        workExperienceLists: response.data!.workExperienceLists,
        name: response.data!.name,
        phone: response.data!.phone,
        nameEn: response.data!.nameEn,
        gender: response.data!.gender,
        nationality: response.data!.nationality,
        lastName: response.data!.lastName,
        thirdName: response.data!.thirdName,
        secondName: response.data!.secondName,
        applicationUserId: response.data!.applicationUserId,
        birthdate: response.data!.birthdate,
        birthdateHijri: response.data!.birthdateHijri,
        educationLevel: response.data!.educationLevel,
        educationMajor: response.data!.educationMajor,
        hasDrivingLicense: response.data!.hasDrivingLicense,
        jobTitle: response.data!.jobTitle,
        maritalStatus: response.data!.maritalStatus,
        province: response.data!.province,
        resumeURL: response.data!.resumeURL,
        city: response.data!.city,
        firstName: response.data!.firstName,
        email: response.data!.email,
        university: response.data!.university,
        graduationYear: response.data!.graduationYear,
        totalExperience: response.data!.totalExperience

      );
      emit( Done());
    }else{
      emit( ErrorLoading());
    }

  }

  Future<void> _onGetProfileSkillsClick(GetProfileSkillsEvent event , Emitter<AppState> emit)async{
    emit( ProfileSkillsLoading());

     await profile_Repository.getProfileApplicantSkills().then((value) {
      if(value!.succeeded!){
        Shared.profileSkills =  value.profileSkills!;
        emit( ProfileSkillsDone());
      }else{
        emit( ProfileSkillsErrorLoading());
      }
    });



  }





}

ProfileBloc profileBloc = new ProfileBloc();


