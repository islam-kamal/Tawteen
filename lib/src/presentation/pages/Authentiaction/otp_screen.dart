import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/navigtor.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/Base/connectivity/network_indicator.dart';
import 'package:code/src/Base/safe_area/page_container.dart';
import 'package:code/src/presentation/pages/Authentiaction/sigin_screen.dart';
import 'package:code/src/presentation/pages/Home/home_screen.dart';
import 'package:code/src/presentation/widgets/custom_button_widget.dart';
import 'package:code/src/presentation/widgets/custom_text_field_widget.dart';
import 'package:code/src/presentation/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:code/src/Base/common/image_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OtpScreenState();
  }

}

class OtpScreenState extends State<OtpScreen>{
  var identity_numbrerController = TextEditingController();
  final identityFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return NetworkIndicator(
      child: PageContainer(
          child: Directionality(
              textDirection: translator.activeLanguageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              child:Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,color: kGreenColor,),
                onPressed: (){
                  customAnimatedPushNavigation(context, SiginScreen() );

                },
              ),
            ),
              body:  Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.logo,
                        width: 200.w,
                        height: 54.16.h,
                      ),

                      Padding(padding: EdgeInsets.symmetric(
                          vertical: Shared.width * 0.05, ),
                        child:   Text(kEnterVerificationCode.tr(),
                          maxLines: 2,
                          style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),),
                      ),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: Shared.width * 0.04),
                        child: OTPTextField(
                            length: 4,
                            width: MediaQuery.of(context).size.width * 0.7,
                            fieldWidth: Shared.width * 0.15,
                            style: TextStyle(
                                fontSize: 17
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                            },

                        ),),

                      Padding(padding: EdgeInsets.symmetric(
                          vertical: Shared.width * 0.05),
                          child:   CustomButtonWidget(
                            button_text: kNext.tr(),
                            width: Shared.width * 0.9,
                            height: Shared.width * 0.13,
                            onPress: (){
                              var tabeControllerProvider = Provider.of<TabControllerProvider>(context,listen: false);
                              tabeControllerProvider.changeTab(0);
                              customAnimatedPushNavigation(context, Index(

                              ) );
                            },
                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${kDidntReceiveCode.tr()}",
                            style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: kGreyColor),),

                       InkWell(
                         onTap: (){

                         },
                         child:    Text("${kSendAgain.tr()} ",
                           style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),

                       )
                        ],
                      )

                    ],
                  ),
                ),
              )
          )
      ),
    );
  }

}