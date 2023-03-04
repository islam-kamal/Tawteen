import 'package:code/src/Base/common/file_export.dart';

class InitativesDetailsModel  extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  InitativesDetails? data;

  InitativesDetailsModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  InitativesDetailsModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'] != null ? new InitativesDetails.fromJson(json['data']) : null;
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
    data = json['data'] != null ? new InitativesDetails.fromJson(json['data']) : null;
    return InitativesDetailsModel(succeeded: succeeded,message: message,errors: errors,modelErrors: modelErrors,
    data: data,httpStatusCode: httpStatusCode);
  }
}

class InitativesDetails {
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
  List<InitiativeDocument>? initiativeDocument;

  InitativesDetails(
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
        this.status,
        this.initiativeDocument});

  InitativesDetails.fromJson(Map<String, dynamic> json) {
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
    if (json['initiativeDocument'] != null) {
      initiativeDocument = <InitiativeDocument>[];
      json['initiativeDocument'].forEach((v) {
        initiativeDocument!.add(new InitiativeDocument.fromJson(v));
      });
    }
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
    if (this.initiativeDocument != null) {
      data['initiativeDocument'] =
          this.initiativeDocument!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InitiativeDocument {
  var initiativeId;
  var fileName;

  InitiativeDocument({this.initiativeId, this.fileName});

  InitiativeDocument.fromJson(Map<String, dynamic> json) {
    initiativeId = json['initiativeId'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initiativeId'] = this.initiativeId;
    data['fileName'] = this.fileName;
    return data;
  }
}