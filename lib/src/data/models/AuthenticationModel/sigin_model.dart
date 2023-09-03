
import 'dart:convert';
import 'dart:math';

import 'package:code/src/Base/common/file_export.dart';

import 'package:encrypt/encrypt.dart' as encrypt;


class SignInModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  Data? data;

  SignInModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
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

    return SignInModel(httpStatusCode: httpStatusCode,data: data,message: message,errors: errors,modelErrors: modelErrors,
    succeeded: succeeded);
  }
}

class Data {
  var id;
  var userName;
  var email;
  var userTypeId;
  var applicationId;
  var applicationName;
  List<String>? roles;
  var isVerified;
  var jwToken;
  var refreshToken;
  var phone;
  var httpStatusCode;
  var succeeded;

  Data(
      {this.id,
        this.userName,
        this.email,
        this.userTypeId,
        this.applicationId,
        this.applicationName,
        this.roles,
        this.isVerified,
        this.jwToken,
        this.refreshToken,
        this.phone,
        this.httpStatusCode,
        this.succeeded});

  Data.fromJson(Map<String, dynamic> json) {
    id = decrypt_data(json['id']);
    userName = json['userName'];
    email = decrypt_data(json['email']);
    userTypeId = json['userTypeId'];
    applicationId = json['applicationId'];
    applicationName = json['applicationName'];
    roles = json['roles'].cast<String>();
    isVerified = json['isVerified'];
    jwToken = json['jwToken'];
    refreshToken = json['refreshToken'];
    phone = json['phone'];
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['userTypeId'] = this.userTypeId;
    data['applicationId'] = this.applicationId;
    data['applicationName'] = this.applicationName;
    data['roles'] = this.roles;
    data['isVerified'] = this.isVerified;
    data['jwToken'] = this.jwToken;
    data['refreshToken'] = this.refreshToken;
    data['phone'] = this.phone;
    data['httpStatusCode'] = this.httpStatusCode;
    data['succeeded'] = this.succeeded;
    return data;
  }

  final key = encrypt.Key.fromUtf8('ABCDEFGHIJ0123456789asdfghjklzaa'); //32 chars
  final iv = encrypt.IV.fromLength(16);

  String decrypt_data(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final decrypted_data = e.decrypt(encrypt.Encrypted.fromBase64(text), iv: iv);

    return decrypted_data;
  }

}