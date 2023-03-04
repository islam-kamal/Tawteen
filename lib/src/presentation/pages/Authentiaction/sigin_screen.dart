import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:code/src/presentation/bloc/Nafath_Bloc/nafath_bloc.dart';
import 'package:code/src/presentation/pages/Authentiaction/SignUp/signup_personal_info_widget.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
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
                listener: (context, state) async {
                  if(state is Loading){
                    print("Loading");
                    Shared.showLoadingDialog(context: context);
                  }
                  else if(state is Done){
                    print("Done");
                    Shared.dismissDialog(context: context);
                      customAnimatedPushNavigation(context, ProfilePersonalInfoWidget());
                  }
                  else if(state is SendNafthRequestDone){
                    print("SendNafthRequestDone");
                    Shared.dismissDialog(context: context);
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(kplease_use_number_in_nafath_app.tr()),
                        content: Text("${state.model!.random!}"),
                        actions: <Widget>[
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                       /*       Shared.userEntity = new UserEntity(
                                nationality_id: state.nationalId
                              );*/
                            //  print("*****Shared.nationality_id  : ${ Shared.nafathInfoEntity!.id }");
                              nafath_bloc.add(CheckNafathStatusEvent(
                                random: state.model!.random!.toString(),
                                transId: state.model!.transId!.toString(),
                                nationalId: state.nationalId
                              ));
                            },
                            child: Text("Ok",style: TextStyle(color: kGreenColor),),
                          ),
                        ],
                      ),
                    );
                  }
                  else if(state is ErrorSendNafthRequest){
                   Shared.dismissDialog(context: context);
                    print("ErrorSendNafthRequest");
                    Shared.showSnackBarView(
                        backend_message:  state.message,
                        error_status: true,
                      sigin_button: false
                    );
                  }
                  else if(state is NafathCheckStatusDone){
                    print("NafathCheckStatusDone");
                    Shared.dismissDialog(context: context);
                    Shared.nafathInfoEntity = new NafathInfoEntity(
                      id: await sharedPreferenceManager.readInt(CachingKey.NATIONALITY_ID),
                      arFirst: await sharedPreferenceManager.readString(CachingKey.ArFirst),
                      arFather: await sharedPreferenceManager.readString(CachingKey.ArFather),
                      enFirst: await sharedPreferenceManager.readString(CachingKey.EnFirst),
                      enFather: await sharedPreferenceManager.readString(CachingKey.EnFather),
                      gender: await sharedPreferenceManager.readString(CachingKey.Gender),
                      dobG: await sharedPreferenceManager.readString(CachingKey.DobG),
                      email: await sharedPreferenceManager.readString(CachingKey.EMAIL),
                      city_id: await sharedPreferenceManager.readString(CachingKey.CITY_ID),
                      city_name_ar: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
                      city_name_en: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
                      phone:  await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER),
                    );
                    nafath_bloc.add(ApplicantCheckExistEvent(
                        nationalId: state.nationalId
                    ));

                  }
                  else if(state is ErrorNafathCheckStatus){
                    Shared.dismissDialog(context: context);
                    print("ErrorNafathCheckStatus");
                    Shared.showSnackBarView(
                        backend_message:  state.message!,
                        error_status: true,
                        sigin_button: false
                    );
                  }
                  else if(state is CheckApplicantExistDone){
                    print("CheckApplicantExistDone");
                    Shared.dismissDialog(context: context);

                    if(state.indicator == "1"){
                      print("there is user : ${state.indicator.toString()}");
                      nafath_bloc.add(GetApplicantDataEvent(
                          nationalId:Shared.nafathInfoEntity!.id.toString()
                      ));
                    }else{
                      customAnimatedPushNavigation(
                          context, SignUpPersonalInfoWidget()
                      );
                    }


                  }
                  else if(state is ErrorCheckApplicantExist){
                    print("ErrorCheckApplicantExist");
                    Shared.dismissDialog(context: context);
                    /*
                    Shared.showSnackBarView(
                        error_status: true,
                        backend_message:  state.message!,
                        sigin_button: false
                    );*/
                    customAnimatedPushNavigation(context, SignUpPersonalInfoWidget());
                  }
                  else if(state is GetApplicantDataDone){
                    print("GetApplicantDataDone");

                    Shared.dismissDialog(context: context);
                  nafath_bloc.add(loginClickEvent());

                  }
                  else if(state is ErrorGetApplicantData){
                    print("ErrorGetApplicantData");
                    Shared.dismissDialog(context: context);
                    Shared.showSnackBarView(
                        error_status: true,
                        backend_message:  state.message!,
                        sigin_button: false
                    );
                  }

                  else if(state is SiginDone){
                    print("SiginDone");
                    Shared.dismissDialog(context: context);
                    customAnimatedPushNavigation(context, Index());
                  }
                  else if(state is ErrorSigin){
                    print("ErrorGetApplicantData ");
                    Shared.dismissDialog(context: context);
                    Shared.showSnackBarView(
                        error_status: true,
                        backend_message:  state.message!??"",
                        sigin_button: false
                    );
                  }

                  else if(state is ErrorLoading){
                  Shared.dismissDialog(context: context);
                    print("ErrorLoading");
                   Shared.showSnackBarView(
                       error_status: true,
                        backend_message:  state.message!,
                     sigin_button: false
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
                        child: Form(
                          key: identityFormKey,
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
                          ),
                        ),),

                      Padding(
                          padding: EdgeInsets.symmetric(
                          vertical: Shared.width * 0.03),
                          child:   CustomButtonWidget(
                            button_text: kLogin.tr(),
                            width: Shared.width * 0.9,
                            height: Shared.width * 0.13,
                            onPress: ()async{
                              nafath_bloc.add(loginClickEvent());
                       /*       if(identityFormKey.currentState!.validate()){
                                nafath_bloc.add(
                                 SendNafathRequestEvent(
                                    nationalId: identity_numbrerController.text//"1094486956"
                                )
                                );
                              }else{
                                Shared.showSnackBarView(
                                    message: kEnter_the_identity,
                                    error_status: true,
                                    sigin_button: false
                                );
                              }*/

                              },
                          )
                      ),

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
                                email: await sharedPreferenceManager.readString(CachingKey.EMAIL),
                                city_id: await sharedPreferenceManager.readString(CachingKey.CITY_ID),
                                city_name_ar: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
                                city_name_en: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
                                phone:  await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER),
                              );
                               customAnimatedPushNavigation(
                                  context, SignUpPersonalInfoWidget()
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