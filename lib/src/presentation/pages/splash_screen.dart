import 'dart:async';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/Base/common/image_manger.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:code/src/presentation/pages/Authentiaction/sigin_screen.dart';
import 'package:code/src/presentation/pages/Home/home_screen.dart';
import 'package:code/src/presentation/pages/Jobs/job_details_screen.dart';
import 'package:code/src/presentation/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
/*    //add default token until login through nafath
    sharedPreferenceManager.writeData(CachingKey.AUTH_TOKEN,
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwianRpIjoiYzFmOTQwMGQtMDkzNS00YjhhLWEyZTYtMzg4NDdmYTcwNmRhIiwiZW1haWwiOiJpa2FtYWxAbWFzdGVyLXdvcmtzLnNhIiwidWlkIjoiMTEyZTI4NmEtMjMyMS00MjJhLTk3ZjItNWE3NTAzOTY3MWM5IiwiaXAiOiIxMC4yMTcuOTcuMTcxIiwidXNlclR5cGVJZCI6IjMiLCJyb2xlcyI6IkFwcGxpY2FudCIsImV4cCI6MTY3ODA5NDcxNywiaXNzIjoiSWRlbnRpdHkiLCJhdWQiOiJJZGVudGl0eVVzZXIifQ.0277R07Cr33XyigKsb8tEAAuSTXq0pvibPcRqKHVqWY");
   */
    authetication_fun();

    super.initState();
  }

  getUserData()async{
    Shared.nafathInfoEntity = new NafathInfoEntity(
      id: await sharedPreferenceManager.readInt(CachingKey.NATIONALITY_ID),
      arFirst: await sharedPreferenceManager.readString(CachingKey.ArFirst),
      arFather: await sharedPreferenceManager.readString(CachingKey.ArFather),
      enFirst: await sharedPreferenceManager.readString(CachingKey.EnFirst),
      enFather: await sharedPreferenceManager.readString(CachingKey.EnFather),
      gender: await sharedPreferenceManager.readString(CachingKey.Gender),
      dobG: await sharedPreferenceManager.readString(CachingKey.DobG),
      email: await sharedPreferenceManager.readString(CachingKey.EMAIL),
      phone:  await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER),
      city_id:  await sharedPreferenceManager.readString(CachingKey.CITY_ID),
      city_name_ar:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
      city_name_en:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
    );
  }

  void authetication_fun(){
    Timer(Duration(seconds: 0), () async {
      try {
        checkAuthentication(await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN));
      } catch (e) {
        checkAuthentication(null!);
      }
    });
  }

  void checkAuthentication(String token) async {
    print("token : ${token} : ${token == "null"}" );
    bool tokenhasExpired = JwtDecoder.isExpired(token);

    if (token == "null" || tokenhasExpired) {
      Shared.vistor_value = 'visitor';
      customAnimatedPushNavigation(context, Index());
      print("Shared.vistor_value  : ${Shared.vistor_value }");
    }else{
      getUserData();
      customAnimatedPushNavigation(context, Index());
    }

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
