import 'dart:math';

import 'package:code/src/Base/common/file_export.dart';

class ProfileSkillsModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<ProfileSkills>? profileSkills;

  ProfileSkillsModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.profileSkills});

  ProfileSkillsModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      profileSkills = <ProfileSkills>[];
      json['data'].forEach((v) {
        profileSkills!.add(new ProfileSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatusCode'] = this.httpStatusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['modelErrors'] = this.modelErrors;
    if (this.profileSkills != null) {
      data['data'] = this.profileSkills!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      profileSkills = <ProfileSkills>[];
      json['data'].forEach((v) {
        profileSkills!.add(new ProfileSkills.fromJson(v));
      });
    }
    return ProfileSkillsModel(succeeded: succeeded,errors: errors,modelErrors: modelErrors,profileSkills: profileSkills,
    message: message,httpStatusCode: httpStatusCode);
  }
}

class ProfileSkills {
  int? applicantId;
  int? skillId;
  String? name;
  String? nameEn;

  ProfileSkills({this.applicantId, this.skillId, this.name, this.nameEn});

  ProfileSkills.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicantId'];
    skillId = json['skillId'];
    name = json['name'];
    nameEn = json['nameEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicantId'] = this.applicantId;
    data['skillId'] = this.skillId;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    return data;
  }
}