import 'package:code/src/Base/common/file_export.dart';

class PreviousJobModel extends BaseMappable{
  Null? draw;
  int? recordsFiltered;
  int? recordsTotal;
  List<PreviousJob>? data;

  PreviousJobModel(
      {this.draw, this.recordsFiltered, this.recordsTotal, this.data});

  PreviousJobModel.fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    recordsFiltered = json['recordsFiltered'];
    recordsTotal = json['recordsTotal'];
    if (json['data'] != null) {
      data = <PreviousJob>[];
      json['data'].forEach((v) {
        data!.add(new PreviousJob.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['draw'] = this.draw;
    data['recordsFiltered'] = this.recordsFiltered;
    data['recordsTotal'] = this.recordsTotal;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    recordsFiltered = json['recordsFiltered'];
    recordsTotal = json['recordsTotal'];
    if (json['data'] != null) {
      data = <PreviousJob>[];
      json['data'].forEach((v) {
        data!.add(new PreviousJob.fromJson(v));
      });
    }
    return PreviousJobModel(data: data,draw: draw,recordsFiltered: recordsFiltered,recordsTotal: recordsTotal);
  }
}

class PreviousJob {
  var jobId;
  var applicantId;
  var jobTitleId;
  var jobTitleName;
  var endDateOfApplicantsAcceptance;
  var jobDescription;
  var vacancies;
  var organizationId;
  var organizationName;
  var provinceId;
  var provinceName;
  var cityId;
  var cityName;
  var educationLevelId;
  var educationLevelName;
  var salaryRangeId;
  var salaryRangeMin;
  var salaryRangeMax;
  var creationDate;
  var status;
  var resumeURL;
  List<Attachments>? attachments;
  PreviousJob(
      {this.jobId,
        this.applicantId,
        this.jobTitleId,
        this.jobTitleName,
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
        this.salaryRangeMin,
        this.salaryRangeMax,
        this.creationDate,
        this.status,
        this.resumeURL,
        this.attachments});

  PreviousJob.fromJson(Map<String, dynamic> json) {
    jobId = json['jobId'];
    applicantId = json['applicantId'];
    jobTitleId = json['jobTitleId'];
    jobTitleName = json['jobTitleName'];
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
    salaryRangeMin = json['salaryRangeMin'];
    salaryRangeMax = json['salaryRangeMax'];
    creationDate = json['creationDate'];
    status = json['status'];
    resumeURL = json['resumeURL'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.jobId;
    data['applicantId'] = this.applicantId;
    data['jobTitleId'] = this.jobTitleId;
    data['jobTitleName'] = this.jobTitleName;
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
    data['salaryRangeMin'] = this.salaryRangeMin;
    data['salaryRangeMax'] = this.salaryRangeMax;
    data['creationDate'] = this.creationDate;
    data['status'] = this.status;
    data['resumeURL'] = this.resumeURL;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
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