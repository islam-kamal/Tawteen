import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/bloc/Nafath_Bloc/nafath_bloc.dart';
import 'package:code/src/presentation/pages/Authentiaction/signup_screen.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/pages/Profile/personal_info_widget.dart';
import 'package:code/src/presentation/widgets/custom_scroll_calendar.dart';

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
            body: BlocListener(
                bloc: nafath_bloc,
                listener: (context, state) {
                  if(state is Loading){
                    print("Loading");
                    Shared.showLoadingDialog(context: context);
                  }else if(state is Done){
                    print("Done");
                    Shared.dismissDialog(context: context);

                    customAnimatedPushNavigation(
                        context, SignUpScreen());

                  }else if(state is ErrorLoading){
                    print("ErrorLoading");
                    Shared.showSnackBarView(
                        title_status: false,
                        backend_message:  state.message!,
                        backgroundColor: kRedColor,
                        success_icon: false
                    );
                  }
                },
                child:   Center(
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


                              nafath_bloc.add(NafathActionEvent(
                                nationalId: "1129184063"
                              ));
                          /*    customAnimatedPushNavigation(
                                  context, CustomScrollCalendar()
                              );*/


                            },
                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${kDontHaveAndAccount.tr()}",
                            style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: kGreyColor),),

                          InkWell(
                            onTap: (){
                               customAnimatedPushNavigation(
                                  context, PersonalInfoWidget()
                              );
                            },
                            child:Text("${kRegisterNow.tr()} ",
                              style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                          )
                        ],
                      )

                    ],
                  ),
                )
            )


          ,
          )
        )
      ),
    );
  }

}