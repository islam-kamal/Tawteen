class AppPublishModel {
  int? isPublish;
  String? deviceType;
  int? id;
  String? url;
  String? createBy;
  String? creationDate;
  Null? modifiedBy;
  Null? lastUpdateDate;
  int? status;
  int? version;
  AppPublishModel(
      {this.isPublish,
        this.deviceType,
        this.id,
        this.url,
        this.createBy,
        this.creationDate,
        this.modifiedBy,
        this.lastUpdateDate,
        this.version,
        this.status});

  AppPublishModel.fromJson(Map<String, dynamic> json) {
    isPublish = json['isPublish'];
    deviceType = json['deviceType'];
    version = json['version'];
    id = json['id'];
    url = json['url'];
    createBy = json['createBy'];
    creationDate = json['creationDate'];
    modifiedBy = json['modifiedBy'];
    lastUpdateDate = json['lastUpdateDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPublish'] = this.isPublish;
    data['deviceType'] = this.deviceType;
    data['id'] = this.id;
    data['url'] = this.url;
    data['createBy'] = this.createBy;
    data['version'] = this.version;
    data['creationDate'] = this.creationDate;
    data['modifiedBy'] = this.modifiedBy;
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['status'] = this.status;
    return data;
  }


  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.deviceType}';
  }

  static List<AppPublishModel> fromJsonList(List list) {
    return list.map((item) => AppPublishModel.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(AppPublishModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => deviceType!;
}