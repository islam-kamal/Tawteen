import 'dart:developer';
import 'dart:io';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:get/get.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class Shared {
  static showLoadingDialog({required BuildContext context}) {
    showDialog(
        context: context,
        useSafeArea: true,
        barrierDismissible: false,
        builder: (ctx) => SpinKitWave(
              color: Colors.white,
              size: 38.0,
            ));
  }

  static dismissDialog({required BuildContext context}) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  static final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  static void showSnackBarView({ String? message, String? backend_message,
    bool? error_status,  bool? sigin_button}) {

    var snackBar = SnackBar(
        content: Text( backend_message?? translator.translate(message!),
          style: TextStyle(color: error_status!? kWhiteColor :kGreenColor,),
        ),
      backgroundColor: error_status? kRedColor :kWhiteColor,
      action:  sigin_button!? SnackBarAction(
        label: translator.translate(ksignin),
        textColor: kBlackColor,
        onPressed: () {
          customAnimatedPushNavigation(navigatorKey.currentContext!, SiginScreen());
        },
      ): null,
    );
    // Step 3
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  static Widget text_widget ({String? text,TextStyle?textStyle}){
    return Row(
      children: [
        Text("$text",style: textStyle,)
      ],
    );
  }

  static double width = ScreenUtil.defaultSize.width;
  static double height = ScreenUtil.defaultSize.height;
  static const token = "Token";
  static const languageCode = "language_code";
  static List<ExperienceEntity> user_experinces = [];
  static List<String> applicant_skills = [];
  static NafathInfoEntity? nafathInfoEntity ;
 // static UserEntity? userEntity;
  static String? vistor_value;
}

