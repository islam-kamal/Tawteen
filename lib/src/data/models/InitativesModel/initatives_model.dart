import 'package:code/src/Base/common/file_export.dart';

class InitativesModel extends BaseMappable {
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<Initatives>? data;

  InitativesModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  InitativesModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <Initatives>[];
      json['data'].forEach((v) {
        data!.add(new Initatives.fromJson(v));
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
      data = <Initatives>[];
      json['data'].forEach((v) {
        data!.add(new Initatives.fromJson(v));
      });
    }
    return InitativesModel(succeeded: succeeded,httpStatusCode: httpStatusCode,data: data,modelErrors: modelErrors,
    errors: errors,message: message);
  }
}

class Initatives {
  var id;
  var title;
  var description;
  var conditions;
  var remarks;
  var startDate;
  var endDate;
  var publishStartDate;
  var publishEndDate;
  var userTypeId;
  var status;

  Initatives(
      {this.id,
        this.title,
        this.description,
        this.conditions,
        this.remarks,
        this.startDate,
        this.endDate,
        this.publishStartDate,
        this.publishEndDate,
        this.userTypeId,
        this.status});

  Initatives.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    conditions = json['conditions'];
    remarks = json['remarks'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    publishStartDate = json['publishStartDate'];
    publishEndDate = json['publishEndDate'];
    userTypeId = json['userTypeId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['conditions'] = this.conditions;
    data['remarks'] = this.remarks;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['publishStartDate'] = this.publishStartDate;
    data['publishEndDate'] = this.publishEndDate;
    data['userTypeId'] = this.userTypeId;
    data['status'] = this.status;
    return data;
  }
}