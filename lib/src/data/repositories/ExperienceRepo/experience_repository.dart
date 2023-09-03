import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/ProfileModel/profile_experience_model.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ExperienceRepository{

  Future<void> getApplicantExperience() async {

    var response = await http.get( Uri.parse(baseUrl +
        "/api/v1/work-experiences?ApplicantId=${await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID)}"
    ),
      headers: Map<String, String>.from({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'

      }),
    );
      var tagObjsJson = jsonDecode(response.body) as List;
      List<ExperienceEntity> experiences_list = tagObjsJson.map((tagJson) => ExperienceEntity.fromJson(tagJson)).toList();
      Shared.profile_experiences =  experiences_list;
      experienceBloc.set(experiences_list);




  }


}

final experience_repository = ExperienceRepository();