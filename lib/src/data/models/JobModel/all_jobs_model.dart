import 'package:code/src/Base/common/file_export.dart';

class  AllJobsModel extends BaseMappable{
  int? httpStatusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  Null? modelErrors;
  List<SearchedJob>? data;

  AllJobsModel(
      {this.httpStatusCode,
        this.succeeded,
        this.message,
        this.errors,
        this.modelErrors,
        this.data});

  AllJobsModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['httpStatusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    modelErrors = json['modelErrors'];
    if (json['data'] != null) {
      data = <SearchedJob>[];
      json['data'].forEach((v) {
        data!.add(new SearchedJob.fromJson(v));
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
      data = <SearchedJob>[];
      json['data'].forEach((v) {
        data!.add(new SearchedJob.fromJson(v));
      });
    }
    return AllJobsModel(
      message: message,errors: errors,httpStatusCode: httpStatusCode,
      modelErrors: modelErrors,succeeded: succeeded,data: data
    );
  }
}

class SearchedJob {
  String? id;
  String? jobTitleId;
  String? jobTitleName;
  String? immediateDate;
  String? expiryDate;
  String? publishStartDate;
  String? publishEndDate;
  String? endDateOfApplicantsAcceptance;
  String? jobDescription;
  String? vacancies;
  String? organizationId;
  String? organizationName;
  String? provinceId;
  String? provinceName;
  String? cityId;
  String? cityName;
  String? educationLevelId;
  String? educationLevelName;
  String? salaryRangeId;
  String? salaryRangeName;
  String? createBy;
  String? creationDate;
  String? modifiedBy;
  String? lastUpdateDate;
  int? status;
  int? applicantCount;
  List<Null>? jobSkillResultList;
  List<Attachments>? attachments;
  CountApplicalntJobStatus? countApplicalntJobStatus;

  SearchedJob(
      {this.id,
        this.jobTitleId,
        this.jobTitleName,
        this.immediateDate,
        this.expiryDate,
        this.publishStartDate,
        this.publishEndDate,
        this.endDateOfApplicantsAcceptance,
        this.jobDescription,
        this.vacancies,
        this.organizationId,
        this.organizationName,
        this.provinceId,
        this.provinceName,
        this.cityId,
        this.cityName,
        this.educationLevelId,
        this.educationLevelName,
        this.salaryRangeId,
        this.salaryRangeName,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate,
        this.status,
        this.applicantCount,
        this.jobSkillResultList,
        this.attachments,
        this.countApplicalntJobStatus});

  SearchedJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitleId = json['jobTitleId'];
    jobTitleName = json['jobTitleName'];
    immediateDate = json['immediateDate'];
    expiryDate = json['expiryDate'];
    publishStartDate = json['publishStartDate'];
    publishEndDate = json['publishEndDate'];
    endDateOfApplicantsAcceptance = json['endDateOfApplicantsAcceptance'];
    jobDescription = json['jobDescription'];
    vacancies = json['vacancies'];
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    provinceId = json['provinceId'];
    provinceName = json['provinceName'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    educationLevelId = json['educationLevelId'];
    educationLevelName = json['educationLevelName'];
    salaryRangeId = json['salaryRangeId'];
    salaryRangeName = json['salaryRangeName'];
    createBy = json['createBy'];
    creationDate = json['creationDate'];
    modifiedBy = json['modifiedBy'];
    lastUpdateDate = json['lastUpdateDate'];
    status = json['status'];
    applicantCount = json['applicantCount'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    countApplicalntJobStatus = json['countApplicalntJobStatus'] != null
        ? new CountApplicalntJobStatus.fromJson(
        json['countApplicalntJobStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jobTitleId'] = this.jobTitleId;
    data['jobTitleName'] = this.jobTitleName;
    data['immediateDate'] = this.immediateDate;
    data['expiryDate'] = this.expiryDate;
    data['publishStartDate'] = this.publishStartDate;
    data['publishEndDate'] = this.publishEndDate;
    data['endDateOfApplicantsAcceptance'] = this.endDateOfApplicantsAcceptance;
    data['jobDescription'] = this.jobDescription;
    data['vacancies'] = this.vacancies;
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    data['provinceId'] = this.provinceId;
    data['provinceName'] = this.provinceName;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['educationLevelId'] = this.educationLevelId;
    data['educationLevelName'] = this.educationLevelName;
    data['salaryRangeId'] = this.salaryRangeId;
    data['salaryRangeName'] = this.salaryRangeName;
    data['createBy'] = this.createBy;
    data['creationDate'] = this.creationDate;
    data['modifiedBy'] = this.modifiedBy;
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['status'] = this.status;
    data['applicantCount'] = this.applicantCount;

    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.countApplicalntJobStatus != null) {
      data['countApplicalntJobStatus'] =
          this.countApplicalntJobStatus!.toJson();
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

class CountApplicalntJobStatus {
  int? active;
  int? deleted;
  int? unVerified;
  int? suspended;
  int? rejected;
  int? cancelled;
  int? approved;
  int? pending;
  int? underProcess;

  CountApplicalntJobStatus(
      {this.active,
        this.deleted,
        this.unVerified,
        this.suspended,
        this.rejected,
        this.cancelled,
        this.approved,
        this.pending,
        this.underProcess});

  CountApplicalntJobStatus.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    deleted = json['deleted'];
    unVerified = json['unVerified'];
    suspended = json['suspended'];
    rejected = json['rejected'];
    cancelled = json['cancelled'];
    approved = json['approved'];
    pending = json['pending'];
    underProcess = json['underProcess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['unVerified'] = this.unVerified;
    data['suspended'] = this.suspended;
    data['rejected'] = this.rejected;
    data['cancelled'] = this.cancelled;
    data['approved'] = this.approved;
    data['pending'] = this.pending;
    data['underProcess'] = this.underProcess;
    return data;
  }
}