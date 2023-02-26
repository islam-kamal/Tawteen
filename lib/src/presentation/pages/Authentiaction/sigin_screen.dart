import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/presentation/bloc/Nafath_Bloc/nafath_bloc.dart';
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
                      customAnimatedPushNavigation(context, PersonalInfoWidget());
                  }else if(state is SendNafthRequestDone){
                    print("SendNafthRequestDone");
                    Shared.dismissDialog(context: context);
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Show Alert Dialog Box"),
                        content: Text("${state.model!.random!}"),
                        actions: <Widget>[
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();

                              nafath_bloc.add(CheckNafathStatusEvent(
                                random: state.model!.random!.toString(),
                                transId: state.model!.transId!.toString(),
                                nationalId: state.nationalId
                              ));
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  } else if(state is ErrorLoading){
                  //  Shared.dismissDialog(context: context);
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
                            onPress: ()async{
                            await  sharedPreferenceManager.readString(CachingKey.ArFirst).then((value){
                                print("value : ${value}");
                              });

                              nafath_bloc.add(SendNafathRequestEvent(
                                nationalId: "1094486956"
                              ));



                            },
                          )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${kDontHaveAndAccount.tr()}",
                            style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: kGreyColor),),

                          InkWell(
                            onTap: () async {
                              Shared.nafathInfoEntity = new NafathInfoEntity(
                                id: await sharedPreferenceManager.readInt(CachingKey.NATIONALITY_ID),
                                arFirst: await sharedPreferenceManager.readString(CachingKey.ArFirst),
                                arFather: await sharedPreferenceManager.readString(CachingKey.ArFather),
                                enFirst: await sharedPreferenceManager.readString(CachingKey.EnFirst),
                                enFather: await sharedPreferenceManager.readString(CachingKey.EnFather),
                                gender: await sharedPreferenceManager.readString(CachingKey.Gender),
                                dobG: await sharedPreferenceManager.readString(CachingKey.DobG),
                              );
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