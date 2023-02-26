

import 'package:code/src/Base/common/file_export.dart';
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
class ErrorLoadingProduct extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? sku;
  String? indicator;
  String? message;
  ErrorLoadingProduct({this.sku='',this.model,this.message,this.indicator,this.general_model});
  @override
  String toString() {
    return indicator!;
    // TODO: implement toString
  }

}
class ErrorLoadingWishListToCart extends AppState{
  Mappable? model;
  List<dynamic>? general_model;
  final String? id;
  String? indicator;
  String? message;
  ErrorLoadingWishListToCart({this.id='',this.model,this.message,this.indicator,this.general_model});
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
