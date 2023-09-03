import 'dart:async';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/Base/common/image_manger.dart';
import 'package:code/src/data/repositories/AppPublishRepo/app_publish_repository.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:code/src/presentation/pages/Authentiaction/sigin_screen.dart';
import 'package:code/src/presentation/pages/Home/home_screen.dart';
import 'package:code/src/presentation/pages/Jobs/job_details_screen.dart';
import 'package:code/src/presentation/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _showVersionChecker(context);

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
     arFamily:  await sharedPreferenceManager.readString(CachingKey.ArFamily),
     enFamily: await sharedPreferenceManager.readString(CachingKey.EnFamily),
     arGrand:  await sharedPreferenceManager.readString(CachingKey.ArGrand),
    enGrand: await sharedPreferenceManager.readString(CachingKey.EnGrand),
    status: await sharedPreferenceManager.readString(CachingKey.status),
   arFullName: await sharedPreferenceManager.readString(CachingKey.ArFullName),
   enFullName: await sharedPreferenceManager.readString(CachingKey.EnFullName),
  dobH: await sharedPreferenceManager.readInt(CachingKey.DobH),
  nationality: await sharedPreferenceManager.readInt(CachingKey.Nationality),
  enTwoNames: await sharedPreferenceManager.readString(CachingKey.EnTwoNames),
  arTwoNames: await sharedPreferenceManager.readString(CachingKey.ArTwoNames),
  enNationality: await sharedPreferenceManager.readString(CachingKey.EnNationality),
  arNationality: await sharedPreferenceManager.readString(CachingKey.ArNationality),
     //   city_id:  await sharedPreferenceManager.readInt(CachingKey.CITY_ID),
      city_name_ar:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
      city_name_en:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
    );
  }

  void authetication_fun(){
    Timer(Duration(seconds: 2), () async {
      try {
        checkAuthentication(await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN));
      } catch (e) {
        checkAuthentication(null!);
      }
    });
  }

  void checkAuthentication(String token) async {
    if (token == "null" ) {
      Shared.vistor_value = 'visitor';
      customAnimatedPushNavigation(context, Index());
      var profileProvider = Provider.of<ProfileProvider>(context,listen: false);
      profileProvider.changeProfileStatus( status: false);
    }else if(JwtDecoder.isExpired(token)){
      Shared.vistor_value = 'visitor';
      customAnimatedPushNavigation(context, Index());
      var profileProvider = Provider.of<ProfileProvider>(context,listen: false);
      profileProvider.changeProfileStatus( status: false);
    } else{
      getUserData();
      var profileProvider = Provider.of<ProfileProvider>(context,listen: false);
      profileProvider.changeProfileStatus( status: true);
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
              Image.asset(ImageAssets.secondary_logo,
                   height: Shared.width * 0.15,
               width: Shared.width * 0.5,
               color: kWhiteColor,
               ),

               ],
             )


           ),
          ],
        )
      ),
    );
  }

  _showVersionChecker(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //  String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    await appPublishRepository.getAppPublishInfo().then((value) async {

        int? min_app_version =  Platform.isAndroid ? value[0].version : value[1].version;
        Shared.apple_test = Platform.isAndroid ? 0 : value[1].isPublish!;

        if (min_app_version != "") {
          print("buildNumber : ${buildNumber}");
          if (int.parse(buildNumber) >=  min_app_version!) {
            authetication_fun();
          } else {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "update_app".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                content: Text("update_avilable_content".tr()),
                actions: [
                  TextButton(
                    child: Text("cancel".tr()),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                        "update_now".tr()),
                    onPressed: () {
                      Platform.isAndroid
                          ? _launchURL(value[0].url??"https://play.google.com/store/apps")
                          : _launchURL(value[1].url??"https://www.apple.com/app-store/");
                    },
                  )
                ],
              ),
            );
          }
        } else {
          authetication_fun();
        }

    });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
