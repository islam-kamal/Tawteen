import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomButtonWidget extends StatelessWidget{
  String? button_text;
  Function()? onPress;
  double? width;
  double? height;
  Color? color;
  CustomButtonWidget({this.button_text,this.onPress, this.width , this.height,this.color = kGreenColor });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
        width: width,
        height: height,
        child:ElevatedButton(
      child: Text(button_text!,style: TextStyle(fontSize: 16,color: kWhiteColor),),

      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,

          textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold)),

        ) );
  }

}