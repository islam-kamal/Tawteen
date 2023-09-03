
import 'package:code/src/Base/common/file_export.dart';

class GetExperienceModel extends BaseMappable{
  int? applicantId;
  String? country;
  String? province;
  String? city;
  int? jobTitleId;
  String? jobTitle;
  String? startMonth;
  String? startYear;
  String? endMonth;
  String? endYear;
  String? address;
  String? orgName;
  String? orgField;
  String? jobRoleName;
  String? description;

  GetExperienceModel(
      {this.applicantId,
        this.country,
        this.province,
        this.city,
        this.jobTitleId,
        this.jobTitle,
        this.startMonth,
        this.startYear,
        this.endMonth,
        this.endYear,
        this.address,
        this.orgName,
        this.orgField,
        this.jobRoleName,
        this.description});

  GetExperienceModel.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicantId'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    jobTitleId = json['jobTitleId'];
    jobTitle = json['jobTitle'];
    startMonth = json['startMonth'];
    startYear = json['startYear'];
    endMonth = json['endMonth'];
    endYear = json['endYear'];
    address = json['address'];
    orgName = json['orgName'];
    orgField = json['orgField'];
    jobRoleName = json['jobRoleName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicantId'] = this.applicantId;
    data['country'] = this.country;
    data['province'] = this.province;
    data['city'] = this.city;
    data['jobTitleId'] = this.jobTitleId;
    data['jobTitle'] = this.jobTitle;
    data['startMonth'] = this.startMonth;
    data['startYear'] = this.startYear;
    data['endMonth'] = this.endMonth;
    data['endYear'] = this.endYear;
    data['address'] = this.address;
    data['orgName'] = this.orgName;
    data['orgField'] = this.orgField;
    data['jobRoleName'] = this.jobRoleName;
    data['description'] = this.description;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    applicantId = json['applicantId'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    jobTitleId = json['jobTitleId'];
    jobTitle = json['jobTitle'];
    startMonth = json['startMonth'];
    startYear = json['startYear'];
    endMonth = json['endMonth'];
    endYear = json['endYear'];
    address = json['address'];
    orgName = json['orgName'];
    orgField = json['orgField'];
    jobRoleName = json['jobRoleName'];
    description = json['description'];
    return GetExperienceModel(applicantId: applicantId,orgName: orgName,orgField: orgField,jobRoleName: jobRoleName,
    address: address,description: description,endYear: endYear,endMonth: endMonth,startYear: startYear,
    startMonth: startMonth,jobTitleId: jobTitleId,city: city,country: country,jobTitle: jobTitle, province: province);
  }
}