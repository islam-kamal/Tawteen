import 'package:code/src/Base/common/file_export.dart';

class PreviousIntativeDetailsModel  extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<PreviousInitativeDetails>? data;

  PreviousIntativeDetailsModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  PreviousIntativeDetailsModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <PreviousInitativeDetails>[];
      json['data'].forEach((v) {
        data!.add(new PreviousInitativeDetails.fromJson(v));
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
      data = <PreviousInitativeDetails>[];
      json['data'].forEach((v) {
        data!.add(new PreviousInitativeDetails.fromJson(v));
      });
    }
    return PreviousIntativeDetailsModel(succeeded: succeeded,httpStatusCode: httpStatusCode,message: message,modelErrors: modelErrors,
    data: data,errors: errors);
  }
}

class PreviousInitativeDetails {
  int? id;
  int? noId;
  String? fullName;
  String? phone;
  int? refId;
  int? userType;
  int? initiativeId;
  String? title;
  int? status;
  List<Attachments>? attachments;
  List<InitiativeImage>? initiativeImage;
  PreviousInitativeDetails(
      {this.id,
        this.noId,
        this.fullName,
        this.phone,
        this.refId,
        this.userType,
        this.initiativeId,
        this.title,
        this.status,
        this.attachments});

  PreviousInitativeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noId = json['noId'];
    fullName = json['fullName'];
    phone = json['phone'];
    refId = json['refId'];
    userType = json['userType'];
    initiativeId = json['initiativeId'];
    title = json['title'];
    status = json['status'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    if (json['initiativeImage'] != null) {
      initiativeImage = <InitiativeImage>[];
      json['initiativeImage'].forEach((v) {
        initiativeImage!.add(new InitiativeImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['noId'] = this.noId;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['refId'] = this.refId;
    data['userType'] = this.userType;
    data['initiativeId'] = this.initiativeId;
    data['title'] = this.title;
    data['status'] = this.status;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.initiativeImage != null) {
      data['initiativeImage'] =
          this.initiativeImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? id;
  String? title;
  String? fileName;
  String? extension;
  String? refObj;
  int? refId;
  int? subRefId;
  int? refIdType;
  String? filePath;
  bool? isDefaulted;
  String? creationDate;
  int? status;

  Attachments(
      {this.id,
        this.title,
        this.fileName,
        this.extension,
        this.refObj,
        this.refId,
        this.subRefId,
        this.refIdType,
        this.filePath,
        this.isDefaulted,
        this.creationDate,
        this.status});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fileName = json['fileName'];
    extension = json['extension'];
    refObj = json['refObj'];
    refId = json['refId'];
    subRefId = json['subRefId'];
    refIdType = json['refIdType'];
    filePath = json['filePath'];
    isDefaulted = json['isDefaulted'];
    creationDate = json['creationDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['fileName'] = this.fileName;
    data['extension'] = this.extension;
    data['refObj'] = this.refObj;
    data['refId'] = this.refId;
    data['subRefId'] = this.subRefId;
    data['refIdType'] = this.refIdType;
    data['filePath'] = this.filePath;
    data['isDefaulted'] = this.isDefaulted;
    data['creationDate'] = this.creationDate;
    data['status'] = this.status;
    return data;
  }
}

class InitiativeImage {
  int? id;
  String? title;
  String? fileName;
  String? extension;
  String? refObj;
  int? refId;
  int? subRefId;
  int? refIdType;
  String? filePath;
  bool? isDefaulted;
  String? creationDate;
  int? status;

  InitiativeImage(
      {this.id,
        this.title,
        this.fileName,
        this.extension,
        this.refObj,
        this.refId,
        this.subRefId,
        this.refIdType,
        this.filePath,
        this.isDefaulted,
        this.creationDate,
        this.status});

  InitiativeImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fileName = json['fileName'];
    extension = json['extension'];
    refObj = json['refObj'];
    refId = json['refId'];
    subRefId = json['subRefId'];
    refIdType = json['refIdType'];
    filePath = json['filePath'];
    isDefaulted = json['isDefaulted'];
    creationDate = json['creationDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['fileName'] = this.fileName;
    data['extension'] = this.extension;
    data['refObj'] = this.refObj;
    data['refId'] = this.refId;
    data['subRefId'] = this.subRefId;
    data['refIdType'] = this.refIdType;
    data['filePath'] = this.filePath;
    data['isDefaulted'] = this.isDefaulted;
    data['creationDate'] = this.creationDate;
    data['status'] = this.status;
    return data;
  }
}


