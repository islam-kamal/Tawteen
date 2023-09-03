import 'dart:async';

import 'package:localize_and_translate/localize_and_translate.dart';


mixin Validator {
  var username_validator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError("username is incorrect".tr());
    } else {
      sink.add(username);
    }
  });

  var firstname_validator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError("user name is incorrect".tr());
    } else {
      sink.add(username);
    }
  });
  var lastname_validator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError("last name is incorrect".tr());
    } else {
      sink.add(username);
    }
  });

  var phone_validator = StreamTransformer<String, String>.fromHandlers(
      handleData: (phone, sink) async {
    Pattern pattern =
        r'^(009665|009715|00965|9665|9715|\+9665||\+9715|\+9655|05|5)(5|0|3|6|4|9|1|8|7|2)([0-9]{7})?$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(phone) || phone.length < 8) {
      sink.addError("phone is incorrect!".tr());
    } else {
      if (!phone.startsWith(RegExp(
          r'(009665|009715|00965|9665|9715|\+9665||\+9715|\+965|05|5)'))) {
        phone = "00966" + phone;
      }
      sink.add(phone);
    }
  });

  var email_validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email)) {
      sink.addError("email is incorrect!".tr());
    } else {
      sink.add(email);
    }
  });

  var password_validator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 8 || password.isEmpty) {
      sink.addError("password is incorrect".tr());
    } else {
      sink.add(password);
    }
  });

  var code_validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (code, sink) {
    if (code.length < 4) {
      sink.addError("otp code is incorrect".tr());
    } else {
      sink.add(code);
    }
  });

  var input_number_validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
    if (input.isEmpty) {
      sink.addError("input is incorrect".tr());
    } else {
      sink.add(input);
    }
  });

  var input_text_validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (text, sink) {
    if (text.isEmpty) {
      sink.addError("input is incorrect".tr());
    } else {
      sink.add(text);
    }
  });

  var credit_card_number_validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (input, sink) {
    if (input.length < 16) {
      sink.addError('رقم البطاقة الائتمانية غير صحيح');
    } else {
      sink.add(input);
    }
  });
}
