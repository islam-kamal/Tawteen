import 'dart:developer';
import 'dart:io';
import 'package:code/src/data/models/ProfileModel/profile_experience_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_model.dart';
import 'package:code/src/data/models/ProfileModel/profile_skills_model.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/initatives_upload_files_entity.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:get/get.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:provider/provider.dart';

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
          textDirection: translator.activeLanguageCode == 'en'? TextDirection.ltr : TextDirection.rtl,
        ),
      backgroundColor: error_status? kRedColor :kWhiteColor,
      action:  sigin_button!? SnackBarAction(
        label: translator.translate(ksignin),
        textColor: kBlackColor,
        onPressed: () {
          var profileProvider = Provider.of<ProfileProvider>(navigatorKey.currentContext!,listen: false);
          profileProvider.changeProfileStatus( status: false);
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


  static JobStatus status_color(int? status){
    switch(status){
      case 1:
        return JobStatus(
            color: kBlackColor,
            status: translator.translate( kactive)
        );
        break;
      case 2:
        return JobStatus(
            color: kRedColor,
            status: translator.translate(kdeleted)
        );
        break;
      case 3:
        return JobStatus(
            color: kInactiveColor,
            status: translator.translate(kunderVerified)
        );
        break;
      case 4:
        return JobStatus(
            color: kPrimaryColor,
            status: translator.translate(ksuspended)
        );
        break;
      case 5:
        return JobStatus(
            color: kRedColor,
            status: translator.translate(krejected)
        );
        break;
      case 6:
        return JobStatus(
            color: kRedColor,
            status:translator.translate(kcancelled)
        );
        break;
      case 7:
        return JobStatus(
            color: kGreenColor,
            status:translator.translate( kaccepted)
        );
        break;
      case 8:
        return JobStatus(
            color: kYellowColor,
            status:translator.translate( kpending)
        );
        break;
      case 9:
        return JobStatus(
            color: kWhiteColor,
            status:translator.translate( kall)
        );
        break;
      case 10:
        return JobStatus(
            color: kYellowColor,
            status: translator.translate(kunderProcessing)
        );
        break;
      case 11:
        return JobStatus(
            color: kHaviyGreenColor,
            status: translator.translate(kfinalApprove)
        );
      default:
        return JobStatus(
            color: kAvailableColor,
            status: translator.translate(kactive)
        );

    }
  }



  static SearchSpecficJobsEntity searchSpecficJobsEntity = new SearchSpecficJobsEntity();
  static double width = ScreenUtil.defaultSize.width;
  static double height = ScreenUtil.defaultSize.height;
  static const token = "Token";
  static const languageCode = "language_code";
  static List<ExperienceEntity> user_experinces = [];
  static List<String> applicant_skills = [];
  static NafathInfoEntity? nafathInfoEntity ;
  static ProfileData? profileModel;
  static   List<ProfileSkills>? profileSkills = [];
  static   List<ExperienceEntity>? profile_experiences  = [];
  static List<InitativeUploadFilesEntity> signup_attachments = [];
 // static UserEntity? userEntity;
  static String? vistor_value;
  static List<String> job_review_attachments_list = [];

  static int start_timer = 0;
  static String? applicant_city_ar = "";
  static String? applicant_city_en="";
  static String? notification_device_token = "";
  static int apple_test = 0;
}

class JobStatus{
  Color? color;
  String? status;
  JobStatus({this.color,this.status});
}