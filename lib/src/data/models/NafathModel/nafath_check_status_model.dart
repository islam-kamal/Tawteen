import 'package:code/src/Base/common/file_export.dart';
/*

class NafathCheckStatusModel extends BaseMappable{
  int? id;
  int? idVersion;
  String? arFirst;
  String? arFather;
  String? arGrand;
  String? arFamily;
  String? enFirst;
  String? enFather;
  String? enGrand;
  String? enFamily;
  String? arTwoNames;
  String? enTwoNames;
  String? arFullName;
  String? enFullName;
  String? gender;
  String? idIssueDateG;
  int? idIssueDateH;
  String? idExpiryDateG;
  int? idExpiryDateH;
  int? nationality;
  String? language;
  String? arNationality;
  String? enNationality;
  String? dobG;
  int? dobH;
  String? status;

  NafathCheckStatusModel(
      {this.id,
        this.idVersion,
        this.arFirst,
        this.arFather,
        this.arGrand,
        this.arFamily,
        this.enFirst,
        this.enFather,
        this.enGrand,
        this.enFamily,
        this.arTwoNames,
        this.enTwoNames,
        this.arFullName,
        this.enFullName,
        this.gender,
        this.idIssueDateG,
        this.idIssueDateH,
        this.idExpiryDateG,
        this.idExpiryDateH,
        this.nationality,
        this.language,
        this.arNationality,
        this.enNationality,
        this.dobG,
        this.dobH,
        this.status});

  NafathCheckStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    idVersion = json['IdVersion'];
    arFirst = json['ArFirst'];
    arFather = json['ArFather'];
    arGrand = json['ArGrand'];
    arFamily = json['ArFamily'];
    enFirst = json['EnFirst'];
    enFather = json['EnFather'];
    enGrand = json['EnGrand'];
    enFamily = json['EnFamily'];
    arTwoNames = json['ArTwoNames'];
    enTwoNames = json['EnTwoNames'];
    arFullName = json['ArFullName'];
    enFullName = json['EnFullName'];
    gender = json['Gender'];
    idIssueDateG = json['IdIssueDateG'];
    idIssueDateH = json['IdIssueDateH'];
    idExpiryDateG = json['IdExpiryDateG'];
    idExpiryDateH = json['IdExpiryDateH'];
    nationality = json['Nationality'];
    language = json['Language'];
    arNationality = json['ArNationality'];
    enNationality = json['EnNationality'];
    dobG = json['DobG'];
    dobH = json['DobH'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IdVersion'] = this.idVersion;
    data['ArFirst'] = this.arFirst;
    data['ArFather'] = this.arFather;
    data['ArGrand'] = this.arGrand;
    data['ArFamily'] = this.arFamily;
    data['EnFirst'] = this.enFirst;
    data['EnFather'] = this.enFather;
    data['EnGrand'] = this.enGrand;
    data['EnFamily'] = this.enFamily;
    data['ArTwoNames'] = this.arTwoNames;
    data['EnTwoNames'] = this.enTwoNames;
    data['ArFullName'] = this.arFullName;
    data['EnFullName'] = this.enFullName;
    data['Gender'] = this.gender;
    data['IdIssueDateG'] = this.idIssueDateG;
    data['IdIssueDateH'] = this.idIssueDateH;
    data['IdExpiryDateG'] = this.idExpiryDateG;
    data['IdExpiryDateH'] = this.idExpiryDateH;
    data['Nationality'] = this.nationality;
    data['Language'] = this.language;
    data['ArNationality'] = this.arNationality;
    data['EnNationality'] = this.enNationality;
    data['DobG'] = this.dobG;
    data['DobH'] = this.dobH;
    data['status'] = this.status;
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    idVersion = json['IdVersion'];
    arFirst = json['ArFirst'];
    arFather = json['ArFather'];
    arGrand = json['ArGrand'];
    arFamily = json['ArFamily'];
    enFirst = json['EnFirst'];
    enFather = json['EnFather'];
    enGrand = json['EnGrand'];
    enFamily = json['EnFamily'];
    arTwoNames = json['ArTwoNames'];
    enTwoNames = json['EnTwoNames'];
    arFullName = json['ArFullName'];
    enFullName = json['EnFullName'];
    gender = json['Gender'];
    idIssueDateG = json['IdIssueDateG'];
    idIssueDateH = json['IdIssueDateH'];
    idExpiryDateG = json['IdExpiryDateG'];
    idExpiryDateH = json['IdExpiryDateH'];
    nationality = json['Nationality'];
    language = json['Language'];
    arNationality = json['ArNationality'];
    enNationality = json['EnNationality'];
    dobG = json['DobG'];
    dobH = json['DobH'];
    status = json['status'];
    return NafathCheckStatusModel(id: id,idExpiryDateG: idExpiryDateG,idExpiryDateH: idExpiryDateH,
        idIssueDateG: idExpiryDateG, idIssueDateH: idExpiryDateH,status: status,arFamily: arFamily,
        arFather: arFather,arFirst: arFirst,arFullName: arFullName,
    arGrand: arGrand,arNationality: arNationality,arTwoNames: arTwoNames,dobG: dobG,dobH: dobH,enGrand: enGrand,
    enFamily: enFamily,enFather: enFather,enFirst: enFirst,enFullName: enFullName,enNationality: enNationality,
    enTwoNames: enTwoNames,gender: gender,idVersion: idVersion,language: language,nationality: nationality);
  }
}
*/




class NafathCheckStatusModel extends BaseMappable {
  String? status;
  Person? person;

  NafathCheckStatusModel({this.status, this.person});

  NafathCheckStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    status = json['status'];
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    return NafathCheckStatusModel(status: status,person: person);
  }
}

class Person {
  int? id;
  String? arFullName;
  String? enFullName;
  int? dobH;
  String? dobG;
  String? gender;
  String? arFirst;
  String? enFirst;
  String? arFamily;
  String? enFamily;
  String? arFather;
  String? enFather;
  String? arGrand;
  String? enGrand;
  int? idVersion;
  String? dIssueDateG;
  int? idIssueDateH;
  String? idExpiryDateG;
  int? idExpiryDateH;
  int? nationality;
  String? enNationality;
  String? arNationality;
  String? language;

  Person(
      {this.id,
        this.arFullName,
        this.enFullName,
        this.dobH,
        this.dobG,
        this.gender,
        this.arFirst,
        this.enFirst,
        this.arFamily,
        this.enFamily,
        this.arFather,
        this.enFather,
        this.arGrand,
        this.enGrand,
        this.idVersion,
        this.dIssueDateG,
        this.idIssueDateH,
        this.idExpiryDateG,
        this.idExpiryDateH,
        this.nationality,
        this.enNationality,
        this.arNationality,
        this.language});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arFullName = json['arFullName'];
    enFullName = json['enFullName'];
    dobH = json['dobH'];
    dobG = json['dobG'];
    gender = json['gender'];
    arFirst = json['arFirst'];
    enFirst = json['enFirst'];
    arFamily = json['arFamily'];
    enFamily = json['enFamily'];
    arFather = json['arFather'];
    enFather = json['enFather'];
    arGrand = json['arGrand'];
    enGrand = json['enGrand'];
    idVersion = json['idVersion'];
    dIssueDateG = json['dIssueDateG'];
    idIssueDateH = json['idIssueDateH'];
    idExpiryDateG = json['idExpiryDateG'];
    idExpiryDateH = json['idExpiryDateH'];
    nationality = json['nationality'];
    enNationality = json['enNationality'];
    arNationality = json['arNationality'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['arFullName'] = this.arFullName;
    data['enFullName'] = this.enFullName;
    data['dobH'] = this.dobH;
    data['dobG'] = this.dobG;
    data['gender'] = this.gender;
    data['arFirst'] = this.arFirst;
    data['enFirst'] = this.enFirst;
    data['arFamily'] = this.arFamily;
    data['enFamily'] = this.enFamily;
    data['arFather'] = this.arFather;
    data['enFather'] = this.enFather;
    data['arGrand'] = this.arGrand;
    data['enGrand'] = this.enGrand;
    data['idVersion'] = this.idVersion;
    data['dIssueDateG'] = this.dIssueDateG;
    data['idIssueDateH'] = this.idIssueDateH;
    data['idExpiryDateG'] = this.idExpiryDateG;
    data['idExpiryDateH'] = this.idExpiryDateH;
    data['nationality'] = this.nationality;
    data['enNationality'] = this.enNationality;
    data['arNationality'] = this.arNationality;
    data['language'] = this.language;
    return data;
  }
}