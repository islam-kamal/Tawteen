import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/authentication_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_experience_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_skills_model.dart';
import 'package:code/src/data/models/ProfileModel/update_profile_model.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class ProfileRepository{

   Future<UpdateProfileModel?> update_profile({var applicant_id,UserEductionEntity? userEductionEntity}) async {

     var idSet = <String>{};
     var distinct_Skills = <ProfileSkills>[];
     for (var d in  Shared.profileSkills!) {
       if (idSet.add(d.skillId.toString())) {
         distinct_Skills.add(d);
       }
     }


    return NetworkUtil.internal().put(UpdateProfileModel(),
        baseUrl +  "api/v1/applicants/${applicant_id}",
        body: jsonEncode(
           {
          "id": "${await sharedPreferenceManager.readInt(CachingKey.NATIONALITY_ID)}",
          "phone":"${await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER)}",
          "email": "${await sharedPreferenceManager.readString(CachingKey.EMAIL)}",
          "resumeURL": "${await sharedPreferenceManager.readString(CachingKey.RESUME_URL)}",
          "educationLevelId": Shared.profileModel!.educationLevelId,
          "educationMajorId": Shared.profileModel!.educationMajorId,
          "jobTitleId": Shared.profileModel!.jobTitleId,
          "provinceId": Shared.profileModel!.provinceId,
          "cityId":Shared.profileModel!.cityId,
          "modifiedBy": "string",
          "jobTitleOtherName": "cairo",
          "educationMajorOtherName":  "cairo",
          "lastUpdateDate": DateTime.now().toString(),
          "totalExperience": userEductionEntity!.totalExperience,
           "university": userEductionEntity.university,
            "graduationYear": userEductionEntity.graduationYear,
          "applicantSkills": Shared.profileSkills!.isEmpty ? [] : distinct_Skills.map((e) =>{
            "applicantId": e.applicantId,
            "skillId": e.skillId
          }).toList(),
             //workExperiences
          "workExperinces": Shared.profile_experiences!.isEmpty ? [] :  Shared.profile_experiences!.map((e)  => {
            "applicantId": applicant_id,
            "countryId": 1,
            "provinceId": Shared.profileModel!.provinceId,
            "cityId": Shared.profileModel!.cityId,
            "jobTitleId": e.jobTitleId,

            "startMonth": e.startMonth,
            "startYear": e.startYear,
            "endMonth": e.endMonth,
            "endYear": e.endYear,
            "address": e.address,
            "orgName": e.orgName,
            "orgField": e.orgField,
            "jobRoleName": e.jobRoleName,
            "description": e.description,
            "createBy": e.createBy
          }).toList(),
        }
        ),
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',
          'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
        }));
  }

   Future<ProfileModel?> getProfileData() async {
     Map<String, String> headers = {
       'lang': translator.activeLanguageCode,
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',

     };
     return NetworkUtil.internal().get(
         ProfileModel(), baseUrl + "api/v1/applicants/${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}", headers: headers  );
   }

   Future<ProfileSkillsModel?> getProfileApplicantSkills() async {
     Map<String, String> headers = {
       'lang': translator.activeLanguageCode,
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG',

     };
     return NetworkUtil.internal().get(
         ProfileSkillsModel(), baseUrl + "api/v1/applicants/applicant-skills?applicantId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}", headers: headers  );
   }

   Future<void> getApplicantExperience() async {

     Uri url = Uri(
         scheme: "https",
         host: "rowad-alnaql.tga.gov.sa",
         path: "api/v1/work-experiences"
     );


     var response = await http.get(
       Uri.parse(baseUrl
         + "/api/v1/work-experiences?ApplicantId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}" ),
       headers: Map<String, String>.from({
         'Content-Type': 'application/json',
         'Accept': 'application/json',
         'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'
       }),
     );

     var tagObjsJson = jsonDecode(response.body)["data"] as List;
     List<ExperienceEntity> experiences_list = tagObjsJson.map((tagJson) => ExperienceEntity.fromJson(tagJson)).toList();
     Shared.profile_experiences =  experiences_list ;
     print("###profile_experiences : ${ Shared.profile_experiences}");
     experienceBloc.set(experiences_list);

   }
}
final profile_Repository = ProfileRepository();