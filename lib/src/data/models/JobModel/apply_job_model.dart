import 'package:code/src/Base/common/file_export.dart';

class ApplyJobModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  Null? data;

  ApplyJobModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  ApplyJobModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['HttpStatusCode'];
    succeeded = json['Succeeded'];
    message = json['Message'];
    errors = json['Errors'];
    modelErrors = json['ModelErrors'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HttpStatusCode'] = this.httpStatusCode;
    data['Succeeded'] = this.succeeded;
    data['Message'] = this.message;
    data['Errors'] = this.errors;
    data['ModelErrors'] = this.modelErrors;
    data['Data'] = this.data;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['HttpStatusCode'];
    succeeded = json['Succeeded'];
    message = json['Message'];
    errors = json['Errors'];
    modelErrors = json['ModelErrors'];
    data = json['Data'];
    return ApplyJobModel(succeeded: succeeded,modelErrors: modelErrors,message: message,data: data,errors: errors,httpStatusCode: httpStatusCode);
  }
}