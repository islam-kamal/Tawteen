import 'package:code/src/Base/common/file_export.dart';

/*class InitativesModel extends BaseMappable {
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
  List<InitiativeImage>? initiativeImage;
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
        this.initiativeImage,
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
    if (this.initiativeImage != null) {
      data['initiativeImage'] =
          this.initiativeImage!.map((v) => v.toJson()).toList();
    }
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
}*/



class InitativesModel extends BaseMappable{
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
    return InitativesModel(succeeded: succeeded,errors: errors,data: data,modelErrors: modelErrors,message: message,
    httpStatusCode: httpStatusCode);
  }
}

class Initatives {
  int? id;
  String? title;
  String? description;
  String? conditions;
  Null? remarks;
  String? startDate;
  String? endDate;
  String? publishStartDate;
  String? publishEndDate;
  int? userTypeId;
  int? status;
  Null? imageURL;
  List<InitiativeImage>? initiativeImage;

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
        this.status,
        this.imageURL,
        this.initiativeImage});

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
    imageURL = json['imageURL'];
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
    data['imageURL'] = this.imageURL;
    if (this.initiativeImage != null) {
      data['initiativeImage'] =
          this.initiativeImage!.map((v) => v.toJson()).toList();
    }
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