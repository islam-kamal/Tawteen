import 'package:localize_and_translate/localize_and_translate.dart';

class JobTitlesModel {
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<JobTitle>? data;

  JobTitlesModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  JobTitlesModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <JobTitle>[];
      json['data'].forEach((v) {
        data!.add(new JobTitle.fromJson(v));
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobTitle {
  String? id;
  String? name;
  String? nameEn;
  bool? status;
  String? createBy;
  String? creationDate;
  String? modifiedBy;
  String? lastUpdateDate;

  JobTitle(
      {this.id,
        this.name,
        this.nameEn,
        this.status,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate});

  JobTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['nameEn'];
    status = json['status'];
    createBy = json['createBy'];
    creationDate = json['creationDate'];
    modifiedBy = json['modifiedBy'];
    lastUpdateDate = json['lastUpdateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['status'] = this.status;
    data['createBy'] = this.createBy;
    data['creationDate'] = this.creationDate;
    data['modifiedBy'] = this.modifiedBy;
    data['lastUpdateDate'] = this.lastUpdateDate;
    return data;
  }


  ///this method will prevent the override of toString
  String userAsString() {
    return translator.activeLanguageCode == "ar" ? this.name! : this.nameEn!;
  }

  static List<JobTitle> fromJsonList(List list) {
    return list.map((item) => JobTitle.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(JobTitle model) {
    return this.id == model.id;
  }


}

