import 'package:code/src/Base/common/file_export.dart';

class SiginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SiginScreenState();
  }

}

class SiginScreenState extends State<SiginScreen>{
  var identity_numbrerController = TextEditingController();
  final identityFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
            textDirection: translator.activeLanguageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
            backgroundColor: kWhiteColor,
            body: Center(
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
                      vertical: Shared.width * 0.02),
                    child:   Text(kLoginNafath.tr(),
                      style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  ),
                  Padding(padding: EdgeInsets.symmetric(
                      vertical: Shared.width * 0.06),
                    child: Container(
                      width: Shared.width * 0.9,
                      child: CustomTextField(
                          formKey: identityFormKey,
                          hint: kidentity_number.tr(),
                          controller: identity_numbrerController,
                          alignment: translator.activeLanguageCode == 'ar' ?TextAlign.right : TextAlign.left,
                          identity: true,
                          errorMessage: kEnter_the_identity.tr(),
                         icon: Icon(
                              Icons.account_circle_outlined,
                           color: kGreyColor,
                          )
                      ),
                    ),),

                  Padding(padding: EdgeInsets.symmetric(
                      vertical: Shared.width * 0.03),
                      child:   CustomButtonWidget(
                        button_text: kLogin.tr(),
                        width: Shared.width * 0.9,
                        height: Shared.width * 0.13,
                        onPress: (){
                         customAnimatedPushNavigation(
                             context, OtpScreen()
                         );
                        },
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${kDontHaveAndAccount.tr()}",
                        style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: kGreyColor),),

                      InkWell(
                        onTap: (){

                        },
                        child:Text("${kRegisterNow.tr()} ",
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