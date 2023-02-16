import 'dart:developer';
import 'dart:io';

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

  static showSnackBar({required GlobalKey<ScaffoldState> scaffoldKey,
      required String message, BuildContext? context, Color? color}) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: kWhiteColor),
      ),
      backgroundColor: color,
    ));
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
