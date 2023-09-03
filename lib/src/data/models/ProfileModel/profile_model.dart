import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class ProfileModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  ProfileData? data;

  ProfileModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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
    data = json['data'] != null ? /*new ProfileData.fromJson(json['data'])*/
    decrypt_my_profile_data(json['data']) : null;
    return ProfileModel(succeeded: succeeded,httpStatusCode: httpStatusCode,message: message,errors: errors,
    modelErrors: modelErrors,data: data);
  }


  final key = encrypt.Key.fromUtf8('ABCDEFGHIJ0123456789asdfghjklzaa'); //32 chars
  final iv = encrypt.IV.fromLength(16);

  ProfileData decrypt_my_profile_data(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final decrypted_data = e.decrypt(encrypt.Encrypted.fromBase64(text), iv: iv);
    var data = jsonDecode(decrypted_data);
    ProfileData person = ProfileData.fromJson(data);
    return person;
  }
}

class ProfileData {
  var id;
  var name;
  var nameEn;
  var phone;
  var email;
  var firstName;
  var secondName;
  var thirdName;
  var lastName;
  var gender;
  var maritalStatus;
  var birthdate;
  var birthdateHijri;
  var nationality;
  var idNo;
  var resumeURL;
  var educationLevel;
  var educationMajor;
  var jobTitle;
  var province;
  var city;
  var hasDrivingLicense;
  var educationLevelId;
  var educationMajorId;
  var jobTitleId;
  var provinceId;
  var cityId;
  var status;
  var totalExperience;
  var university;
  var graduationYear;
  var applicationUserId;
  var educationLevelOtherName;
  var educationMajorOtherName;
  var applicantSkills;
  var workExperienceLists;

  ProfileData(
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
        this.totalExperience,
        this.university,
        this.graduationYear,
        this.applicationUserId,
        this.educationLevelOtherName,
        this.educationMajorOtherName,
        this.applicantSkills,
        this.workExperienceLists});

  ProfileData.fromJson(Map<String, dynamic> json) {
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
    totalExperience = json['totalExperience'];
    university = json['university'];
    graduationYear = json['graduationYear'];
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
    data['totalExperience'] = this.totalExperience;
    data['university'] = this.university;
    data['graduationYear'] = this.graduationYear;
    data['applicationUserId'] = this.applicationUserId;
    data['educationLevelOtherName'] = this.educationLevelOtherName;
    data['educationMajorOtherName'] = this.educationMajorOtherName;
    data['applicantSkills'] = this.applicantSkills;
    data['workExperienceLists'] = this.workExperienceLists;
    return data;
  }
}