class ExperienceEntity {
  var applicantId;
  var countryId;
  var provinceId;
  var cityId;
  var jobTitleId;
  var startMonth;
  var startYear;
  var endMonth;
  var endYear;
  var address;
  var orgName;
  var orgField;
  var jobRoleName;
  var description;
  var createBy;

  ExperienceEntity(
      {
        this.applicantId,
        this.countryId,
        this.provinceId,
        this.cityId,
        this.jobTitleId,
        this.startMonth,
        this.startYear,
        this.endMonth,
        this.endYear,
        this.address,
        this.orgName,
        this.orgField,
        this.jobRoleName,
        this.description,
        this.createBy});

  ExperienceEntity.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicantId'];
    countryId = json['countryId'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    jobTitleId = json['jobTitleId'];
    startMonth = json['startMonth'];
    startYear = json['startYear'];
    endMonth = json['endMonth'];
    endYear = json['endYear'];
    address = json['address'];
    orgName = json['orgName'];
    orgField = json['orgField'];
    jobRoleName = json['jobRoleName'];
    description = json['description'];
    createBy = json['createBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicantId'] = this.applicantId;
    data['countryId'] = this.countryId;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['jobTitleId'] = this.jobTitleId;
    data['startMonth'] = this.startMonth;
    data['startYear'] = this.startYear;
    data['endMonth'] = this.endMonth;
    data['endYear'] = this.endYear;
    data['address'] = this.address;
    data['orgName'] = this.orgName;
    data['orgField'] = this.orgField;
    data['jobRoleName'] = this.jobRoleName;
    data['description'] = this.description;
    data['createBy'] = this.createBy;
    return data;
  }
}