import 'package:code/src/Base/common/file_export.dart';

class ApplicantDataModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  Data? data;

  ApplicantDataModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  ApplicantDataModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatusCode'] = this.httpStatusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['modelErrors'] = this.modelErrors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    return ApplicantDataModel(succeeded: succeeded,errors: errors,message: message,
    modelErrors: modelErrors,httpStatusCode: httpStatusCode,data: data);
  }
}

class Data {
  int? id;
  Null? name;
  Null? nameEn;
  Null? phone;
  String? email;
  Null? firstName;
  Null? secondName;
  Null? thirdName;
  Null? lastName;
  Null? gender;
  Null? maritalStatus;
  String? birthdate;
  Null? birthdateHijri;
  Null? nationality;
  int? idNo;
  Null? resumeURL;
  Null? educationLevel;
  Null? educationMajor;
  Null? jobTitle;
  Null? province;
  Null? city;
  bool? hasDrivingLicense;
  int? educationLevelId;
  int? educationMajorId;
  int? jobTitleId;
  int? provinceId;
  int? cityId;
  int? status;
  Null? applicationUserId;
  Null? educationLevelOtherName;
  Null? educationMajorOtherName;
  Null? applicantSkills;
  Null? workExperienceLists;

  Data(
      {this.id,
        this.name,
        this.nameEn,
        this.phone,
        this.email,
        this.firstName,
        this.secondName,
        this.thirdName,
        this.lastName,
        this.gender,
        this.maritalStatus,
        this.birthdate,
        this.birthdateHijri,
        this.nationality,
        this.idNo,
        this.resumeURL,
        this.educationLevel,
        this.educationMajor,
        this.jobTitle,
        this.province,
        this.city,
        this.hasDrivingLicense,
        this.educationLevelId,
        this.educationMajorId,
        this.jobTitleId,
        this.provinceId,
        this.cityId,
        this.status,
        this.applicationUserId,
        this.educationLevelOtherName,
        this.educationMajorOtherName,
        this.applicantSkills,
        this.workExperienceLists});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['nameEn'];
    phone = json['phone'];
    email = json['email'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    thirdName = json['thirdName'];
    lastName = json['lastName'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    birthdate = json['birthdate'];
    birthdateHijri = json['birthdateHijri'];
    nationality = json['nationality'];
    idNo = json['idNo'];
    resumeURL = json['resumeURL'];
    educationLevel = json['educationLevel'];
    educationMajor = json['educationMajor'];
    jobTitle = json['jobTitle'];
    province = json['province'];
    city = json['city'];
    hasDrivingLicense = json['hasDrivingLicense'];
    educationLevelId = json['educationLevelId'];
    educationMajorId = json['educationMajorId'];
    jobTitleId = json['jobTitleId'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    status = json['status'];
    applicationUserId = json['applicationUserId'];
    educationLevelOtherName = json['educationLevelOtherName'];
    educationMajorOtherName = json['educationMajorOtherName'];
    applicantSkills = json['applicantSkills'];
    workExperienceLists = json['workExperienceLists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['secondName'] = this.secondName;
    data['thirdName'] = this.thirdName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['maritalStatus'] = this.maritalStatus;
    data['birthdate'] = this.birthdate;
    data['birthdateHijri'] = this.birthdateHijri;
    data['nationality'] = this.nationality;
    data['idNo'] = this.idNo;
    data['resumeURL'] = this.resumeURL;
    data['educationLevel'] = this.educationLevel;
    data['educationMajor'] = this.educationMajor;
    data['jobTitle'] = this.jobTitle;
    data['province'] = this.province;
    data['city'] = this.city;
    data['hasDrivingLicense'] = this.hasDrivingLicense;
    data['educationLevelId'] = this.educationLevelId;
    data['educationMajorId'] = this.educationMajorId;
    data['jobTitleId'] = this.jobTitleId;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['status'] = this.status;
    data['applicationUserId'] = this.applicationUserId;
    data['educationLevelOtherName'] = this.educationLevelOtherName;
    data['educationMajorOtherName'] = this.educationMajorOtherName;
    data['applicantSkills'] = this.applicantSkills;
    data['workExperienceLists'] = this.workExperienceLists;
    return data;
  }
}