import 'package:code/src/Base/common/file_export.dart';

class NafathRequestModel extends BaseMappable{
  String? transId;
  int? random;

  NafathRequestModel({this.transId, this.random});

  NafathRequestModel.fromJson(Map<String, dynamic> json) {
    transId = json['transId'];
    random = json['random'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transId'] = this.transId;
    data['random'] = this.random;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    transId = json['transId'];
    random = json['random'];
    return NafathRequestModel(transId: transId,random: random);
  }
}