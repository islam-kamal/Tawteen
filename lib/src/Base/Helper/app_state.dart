

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AuthenticationModel/sigin_model.dart';
import 'package:code/src/data/models/NafathModel/applicant_data_model.dart';
import 'package:code/src/data/models/NafathModel/applicant_exist_model.dart';
import 'package:code/src/data/models/NafathModel/nafath_check_status_model.dart';
import 'package:code/src/data/models/NafathModel/nafath_rquest_model.dart';

abstract class AppState {
  get model =>null;
}
class Start extends AppState{

}

class Loading extends AppState{
  final String? indicator;
  Mappable? model;
  Loading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class ApplyJobLoading extends AppState{
  final String? indicator;
  Mappable? model;
  ApplyJobLoading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class ProfileSkillsLoading extends AppState{
  final String? indicator;
  Mappable? model;
  ProfileSkillsLoading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class ProfileSkillsDone extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  ProfileSkillsDone({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class ProfileSkillsErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  ProfileSkillsErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}

class ProfileExperienceLoading extends AppState{
  final String? indicator;
  Mappable? model;
  ProfileExperienceLoading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class ProfileExperienceDone extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  ProfileExperienceDone({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class ProfileExperienceErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  ProfileExperienceErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}


class ApplyInitativeLoading extends AppState{
  final String? indicator;
  Mappable? model;
  ApplyInitativeLoading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class ApplyInitativeDone extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  ApplyInitativeDone({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class ApplyInitativeErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  ApplyInitativeErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}

class UpdateAppliedInitativeLoading extends AppState{
  final String? indicator;
  Mappable? model;
  UpdateAppliedInitativeLoading({this.model , this.indicator});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }
}
class UpdateAppliedInitativeDone extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  UpdateAppliedInitativeDone({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class UpdateAppliedInitativeErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  UpdateAppliedInitativeErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}

class Done extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  Done({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class ApplyJobDone extends AppState{
  Mappable? model;
  final String? indicator;
  List<dynamic>? general_model;
  var general_value;
  ApplyJobDone({this.model , this.indicator,this.general_model, this.general_value});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class SendNafthRequestDone extends AppState{
   NafathRequestModel? model;
  final String? indicator;
   final String? nationalId;
  SendNafthRequestDone({this.model , this.indicator,this.nationalId});

  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class NafathCheckStatusDone extends AppState{
  NafathCheckStatusModel? model;
  final String? indicator;
  final String? nationalId;
  NafathCheckStatusDone({this.model , this.indicator,this.nationalId});
  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class CheckApplicantExistDone extends AppState{
  ApplicantExistModel? model;
  final String? indicator;
  final String? nationalId;
  CheckApplicantExistDone({this.model , this.indicator,this.nationalId});
  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class GetApplicantDataDone extends AppState{
  ApplicantDataModel? model;
  final String? indicator;
  final String? nationalId;
  GetApplicantDataDone({this.model , this.indicator,this.nationalId});
  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}
class SiginDone extends AppState{
  SignInModel? model;
  final String? indicator;
  final String? nationalId;
  SiginDone({this.model , this.indicator,this.nationalId});
  @override
  String toString() {
    return indicator!;

    // TODO: implement toString
  }

}

class ErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  ErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}
class ApplyJobErrorLoading extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  String? indicator;
  String? message;
  ApplyJobErrorLoading({this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return message!;
    // TODO: implement toString
  }

}
class ErrorCheckApplicantExist extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? sku;
  String? indicator;
  String? message;
  ErrorCheckApplicantExist({this.sku='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }

}
class ErrorSendNafthRequest extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? id;
  String? indicator;
  String? message;
  ErrorSendNafthRequest({this.id='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }

}
class ErrorNafathCheckStatus extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? id;
  String? indicator;
  String? message;
  ErrorNafathCheckStatus({this.id='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }

}
class ErrorGetApplicantData extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? id;
  String? indicator;
  String? message;
  ErrorGetApplicantData({this.id='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }

}
class ErrorSigin extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? id;
  String? indicator;
  String? message;
  ErrorSigin({this.id='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }
}

class EmptyField extends AppState{
  var value;
  EmptyField({this.value= 'بيانات الطلب غير مكتملة '});

  @override
  String toString() {
    return value!;
    // TODO: implement toString
  }


}

class RadioSelection extends AppState{
   var value;
  RadioSelection({this.value});

  @override
  String toString() {
    return value!;
  }


}
