import 'package:code/src/Base/common/file_export.dart';

class ProvincesModel extends BaseMappable {
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<Province>? data;

  ProvincesModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  ProvincesModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <Province>[];
      json['data'].forEach((v) {
        data!.add(new Province.fromJson(v));
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

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <Province>[];
      json['data'].forEach((v) {
        data!.add(new Province.fromJson(v));
      });
    }
    return ProvincesModel(httpStatusCode: httpStatusCode,message: message,modelErrors: modelErrors,errors: errors,data: data,
    succeeded: succeeded);
  }
}

class Province {
  String? id;
  String? countryId;
  String? countryName;
  String? name;
  String? nameEn;
  bool? status;
  Null? createBy;
  Null? creationDate;
  Null? modifiedBy;
  Null? lastUpdateDate;

  Province(
      {this.id,
        this.countryId,
        this.countryName,
        this.name,
        this.nameEn,
        this.status,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['countryId'];
    countryName = json['countryName'];
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
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
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

  static List<Province> fromJsonList(List list) {
    return list.map((item) => Province.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Province model) {
    return this.id == model.id;
  }


}