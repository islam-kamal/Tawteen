import 'dart:async';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/Base/common/image_manger.dart';
import 'package:code/src/presentation/pages/Authentiaction/sigin_screen.dart';
import 'package:code/src/presentation/pages/Home/home_screen.dart';
import 'package:code/src/presentation/pages/Jobs/job_details_screen.dart';
import 'package:code/src/presentation/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
 Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>Index()
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset(ImageAssets.splash,
                width: Shared.width * 0.4,

              ),

            ),
           Positioned(
             bottom: Shared.width * 0.1,
             right: 0,
             left: 0,
             child: Column(
               children: [
                 Text(kDevelopmentAndOperation.tr(),style: TextStyle(color: kWhiteColor,fontSize: 12),),
                 Image.asset(ImageAssets.splash_logo,
                   width: Shared.width * 0.4,
                 )

               ],
             )


           ),
          ],
        )
      ),
    );
  }
}
