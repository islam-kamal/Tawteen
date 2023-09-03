import 'package:code/src/Base/common/image_manger.dart';
import 'package:code/src/Base/common/navigtor.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/presentation/pages/Authentiaction/sigin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppBarWidget {
  static PreferredSizeWidget appBarWidget(
      {BuildContext? context, Widget? route, bool? icon}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(60.w), // here the desired height
        child: AppBar(
          backgroundColor: kGreenColor,
          elevation: 0,
          centerTitle: true,
        /*  flexibleSpace:Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(
                ImageAssets.appbar_logo,
                //color:Colors.transparent,
                width: 90.h,
                height: 60.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width:  10.w,),
              Image.asset(
                ImageAssets.tga_white_new,
                color: kWhiteColor,
                width: 90.h,
                height: 60.w,
                fit: BoxFit.contain,


              )
            ],
          ),*/
         title: Image.asset(
            ImageAssets.appbar_logo,
            //color:Colors.transparent,
            width: 90.h,
            height: 60.w,
          ),
          leading: icon! ? translator.activeLanguageCode == 'ar'
              ? IconButton(
                  onPressed: () {
                    customAnimatedPushNavigation(context!, route! );
                  },
                  icon: translator.locale.languageCode == "en"
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: kWhiteColor,
                        )
                      : Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                        ),
                )
              : IconButton(
                  onPressed: () {
                    customAnimatedPushNavigation(context!, route! );
                  },
                  icon: translator.locale.languageCode == "ar"
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: kWhiteColor,
                        )
                      : Icon(
                          Icons.arrow_back_ios,
                          color: kWhiteColor,
                        ),
                )
                : Container()

          /*       leading: icon! ? IconButton(
            icon: Icon(Icons.arrow_back_ios,color: kWhiteColor,),
            onPressed: (){
              customAnimatedPushNavigation(context!, route! );

            },
          ) : Container(),*/
        ));
  }
}
