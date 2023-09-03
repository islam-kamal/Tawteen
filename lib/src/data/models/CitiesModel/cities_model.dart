import 'package:code/src/Base/common/file_export.dart';

class CitiesModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<City>? data;

  CitiesModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <City>[];
      json['data'].forEach((v) {
        data!.add(new City.fromJson(v));
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
      data = <City>[];
      json['data'].forEach((v) {
        data!.add(new City.fromJson(v));
      });
    }
    return CitiesModel(data: data,succeeded: succeeded,modelErrors: modelErrors,httpStatusCode: httpStatusCode,
    errors: errors,message: message);
  }
}

class City {
  String? id;
  String? countryId;
  String? countryName;
  String? provinceId;
  String? provinceName;
  String? name;
  String? nameEn;
  bool? status;
  Null? createBy;
  String? creationDate;
  String? modifiedBy;
  String? lastUpdateDate;

  City(
      {this.id,
        this.countryId,
        this.countryName,
        this.provinceId,
        this.provinceName,
        this.name,
        this.nameEn,
        this.status,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate});

  City.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    provinceId = json['provinceId'];
    provinceName = json['provinceName'];
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
    data['provinceId'] = this.provinceId;
    data['provinceName'] = this.provinceName;
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

  static List<City> fromJsonList(List list) {
    return list.map((item) => City.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(City model) {
    return this.id == model.id;
  }


}