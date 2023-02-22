import 'package:code/src/Base/common/file_export.dart';

class CourseDetailsModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  CourseDetails? data;

  CourseDetailsModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    data = json['data'] != null ? new CourseDetails.fromJson(json['data']) : null;
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
    data = json['data'] != null ? new CourseDetails.fromJson(json['data']) : null;
    return CourseDetailsModel(httpStatusCode: httpStatusCode,modelErrors: modelErrors,message: message,
    data: data,succeeded: succeeded,errors: errors);
  }
}

class CourseDetails {
  String? id;
  String? academyId;
  String? academyName;
  String? title;
  String? description;
  String? imageUrl;
  String? applicantClickCount;
  String? noOfSeats;
  String? startDate;
  String? endDate;
  String? publishStartDate;
  String? publishEndDate;
  String? provinceId;
  String? provinceName;
  String? cityId;
  String? cityName;
  String? courseType;
  String? courseLevel;
  String? createBy;
  String? creationDate;
  String? modifiedBy;
  String? lastUpdateDate;
  int? status;
  List<SkillsIdList>? skillsIdList;
  List<Attachments>? attachments;
  String? url;

  CourseDetails(
      {this.id,
        this.academyId,
        this.academyName,
        this.title,
        this.description,
        this.imageUrl,
        this.applicantClickCount,
        this.noOfSeats,
        this.startDate,
        this.endDate,
        this.publishStartDate,
        this.publishEndDate,
        this.provinceId,
        this.provinceName,
        this.cityId,
        this.cityName,
        this.courseType,
        this.courseLevel,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate,
        this.status,
        this.skillsIdList,
        this.attachments,
        this.url});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    academyId = json['academyId'];
    academyName = json['academyName'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    applicantClickCount = json['applicantClickCount'];
    noOfSeats = json['noOfSeats'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    publishStartDate = json['publishStartDate'];
    publishEndDate = json['publishEndDate'];
    provinceId = json['provinceId'];
    provinceName = json['provinceName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    courseType = json['courseType'];
    courseLevel = json['courseLevel'];
    createBy = json['createBy'];
    creationDate = json['creationDate'];
    modifiedBy = json['modifiedBy'];
    lastUpdateDate = json['lastUpdateDate'];
    status = json['status'];
    if (json['skillsIdList'] != null) {
      skillsIdList = <SkillsIdList>[];
      json['skillsIdList'].forEach((v) {
        skillsIdList!.add(new SkillsIdList.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['academyId'] = this.academyId;
    data['academyName'] = this.academyName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['applicantClickCount'] = this.applicantClickCount;
    data['noOfSeats'] = this.noOfSeats;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['publishStartDate'] = this.publishStartDate;
    data['publishEndDate'] = this.publishEndDate;
    data['provinceId'] = this.provinceId;
    data['provinceName'] = this.provinceName;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['courseType'] = this.courseType;
    data['courseLevel'] = this.courseLevel;
    data['createBy'] = this.createBy;
    data['creationDate'] = this.creationDate;
    data['modifiedBy'] = this.modifiedBy;
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['status'] = this.status;
    if (this.skillsIdList != null) {
      data['skillsIdList'] = this.skillsIdList!.map((v) => v.toJson()).toList();
    }
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    return data;
  }
}

class SkillsIdList {
  int? skillId;
  String? skillName;

  SkillsIdList({this.skillId, this.skillName});

  SkillsIdList.fromJson(Map<String, dynamic> json) {
    skillId = json['skillId'];
    skillName = json['skillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skillId'] = this.skillId;
    data['skillName'] = this.skillName;
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