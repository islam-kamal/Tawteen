import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SliderSimmer extends StatefulWidget {
  @override
  _SliderSimmerState createState() => _SliderSimmerState();
}

class _SliderSimmerState extends State<SliderSimmer> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(
          ScreenUtil().screenWidth, ScreenUtil().screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return Shimmer.fromColors(
          baseColor: kGreenColor,
          highlightColor: Colors.grey[350]!,
          child: Container(
            height: 100.h,
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
                color: kGreenColor, borderRadius: BorderRadius.circular(10.0)),
          ),
        );
      },
    );

  }
}
