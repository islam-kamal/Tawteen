import 'dart:developer';
import 'dart:io';
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

  static void showSnackBarView({bool? title_status, String? message, String? backend_message,
    Color? backgroundColor, bool? success_icon}) {
    Get.snackbar(
        translator.translate(title_status! ? kcongratulations: kfault ),
        backend_message?? translator.translate(message!),
        colorText: Colors.white,
        backgroundColor: backgroundColor ?? kRedColor,
        icon: success_icon! ? Image.asset(
          ImageAssets.congratulations,
          width: 30,
          height: 30,
          color: kWhiteColor,
        )
            : Image.asset(
          ImageAssets.error,
          width: 30,
          height: 30,
          color: kWhiteColor,
        )
    );
  }

  static double width = ScreenUtil.defaultSize.width;
  static double height = ScreenUtil.defaultSize.height;
  static const token = "Token";
  static const languageCode = "language_code";

  static Widget text_widget ({String? text,TextStyle?textStyle}){
    return Row(
        children: [
          Text("$text",style: textStyle,)
        ],
      );
  }
}
