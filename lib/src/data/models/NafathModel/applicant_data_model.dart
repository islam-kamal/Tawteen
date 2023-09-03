import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class ApplicantDataModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  ApplicantData? applicant_data;

  ApplicantDataModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.applicant_data});

  ApplicantDataModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];

    applicant_data = json['data'] != null ? new ApplicantData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatusCode'] = this.httpStatusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['modelErrors'] = this.modelErrors;
    if (this.applicant_data != null) {
      data['data'] = this.applicant_data!.toJson();
    }
    return data;
  }
  final key = encrypt.Key.fromUtf8('ABCDEFGHIJ0123456789asdfghjklzaa'); //32 chars
  final iv = encrypt.IV.fromLength(16);
  ApplicantData decryptMyData(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final decrypted_data = e.decrypt(encrypt.Encrypted.fromBase64(text), iv: iv);
    var data = jsonDecode(decrypted_data);
    ApplicantData person = ApplicantData.fromJson(data);
    return person;
  }


  @override
  Mappable fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    applicant_data = json['data'] != null ? decryptMyData(json['data'])
    /*new ApplicantData.fromJson(json['data'])*/ : null;


    return ApplicantDataModel(succeeded: succeeded,errors: errors,message: message,
    modelErrors: modelErrors,httpStatusCode: httpStatusCode,applicant_data: applicant_data);
  }
}

class ApplicantData {
  String? email;
  String? phone;
  int? cityId;
  String? cityName;
  int? jobTitleId;
  ApplicantData({this.email, this.phone, this.cityId, this.cityName,this.jobTitleId});

  ApplicantData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    jobTitleId = json['jobTitleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['jobTitleId'] = this.jobTitleId;
    return data;
  }
}