import 'package:code/src/Base/common/file_export.dart';

class DeleteAttachmentModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  int? data;

  DeleteAttachmentModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  DeleteAttachmentModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatusCode'] = this.httpStatusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['modelErrors'] = this.modelErrors;
    data['data'] = this.data;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'];
    return DeleteAttachmentModel(succeeded: succeeded,httpStatusCode: httpStatusCode,message: message,errors: errors,
    modelErrors: modelErrors,data: data);
  }
}