import 'dart:convert';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/NafathModel/applicant_data_model.dart';
import 'package:code/src/data/repositories/AppPublishRepo/app_publish_repository.dart';
import 'package:code/src/data/repositories/NafathRepo/nafath_repository.dart';
import 'package:code/src/data/repositories/ProfileRepo/profile_repository.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:code/src/presentation/bloc/Nafath_Bloc/nafath_bloc.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:code/src/presentation/pages/Authentiaction/SignUp/signup_personal_info_widget.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:code/src/presentation/widgets/custom_scroll_calendar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;




class SiginScreen extends StatefulWidget {
  bool? from_profile;
  SiginScreen({this.from_profile=false});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SiginScreenState();
  }
}

class SiginScreenState extends State<SiginScreen> {
  var identity_numbrerController = TextEditingController();
  final identityFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return WillPopScope(
      onWillPop: () async {
        Shared.vistor_value == 'visitor';
        customAnimatedPushNavigation(context, Index());
        return true;
      },
      child: NetworkIndicator(
        child: PageContainer(
            child: Directionality(
                textDirection: translator.activeLanguageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Scaffold(
                  backgroundColor: kWhiteColor,
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        if(widget.from_profile!){
                          var tabeControllerProvider = Provider.of<TabControllerProvider>(context, listen: false);
                          tabeControllerProvider.changeTab(index: 0);

                        }else{
                          customAnimatedPushNavigation(context, Index());

                        }

                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: kBlackColor,
                    ),
                    backgroundColor: kWhiteColor,
                    elevation: 0,
                  ),
                  body: BlocListener(
                      bloc: nafath_bloc,
                      listener: (context, state) async {
                        if (state is Loading) {
                          Shared.showLoadingDialog(context: context);
                        }
                        else if (state is Done) {
                          Shared.dismissDialog(context: context);
                          customAnimatedPushNavigation(
                              context, ProfilePersonalInfoWidget());
                        }
                        else if (state is SendNafthRequestDone) {
                          Shared.dismissDialog(context: context);
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title:
                                  Text(knafath_message.tr(),
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,),

                              content:  Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: kGreyColor)
                                      ),
                                      child: Text("${state.model!.random!}",),
                                    ),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Shared.width * 0.3,

                                      child:  OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();

                                      },
                                      child: Text(
                                        kcancel.tr(),
                                        style: TextStyle(color: kGreenColor),
                                      ),
                                      )  ),
                                    Container(
                                        width: Shared.width * 0.3,

                                        child:  OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                   nafath_bloc.add(CheckNafathStatusEvent(
                                            random: state.model!.random!.toString(),
                                            transId:
                                            state.model!.transId!.toString(),
                                            nationalId: state.nationalId));
                                      },
                                      child: Text(
                                        kconfirm.tr(),
                                        style: TextStyle(color: kGreenColor),
                                      ),
                                    )),

                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        else if (state is ErrorSendNafthRequest) {
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              backend_message: state.message,
                              error_status: true,
                              sigin_button: false);
                        }
                        else if (state is NafathCheckStatusDone) {

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
                          );

                          nafath_bloc.add(ApplicantCheckExistEvent(
                              nationalId: state.nationalId));
                        }
                        else if (state is ErrorNafathCheckStatus) {
                          Shared.dismissDialog(context: context);
                          Shared.vistor_value == 'visitor';
                          Shared.showSnackBarView(
                              backend_message: state.message!,
                              error_status: true,
                              sigin_button: false);
                        }
                        else if (state is CheckApplicantExistDone) {
                          Shared.dismissDialog(context: context);

                          if (state.indicator == "1") {
                            nafath_bloc.add(GetApplicantDataEvent(
                                nationalId:
                                    Shared.nafathInfoEntity!.id.toString()));
                          } else {
                            customAnimatedPushNavigation(
                                context, SignUpPersonalInfoWidget());
                          }
                        }
                        else if (state is ErrorCheckApplicantExist) {
                          print("ErrorCheckApplicantExist");
                          Shared.dismissDialog(context: context);

                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message: state.message!,
                              sigin_button: false);
                          //     customAnimatedPushNavigation(context, SignUpPersonalInfoWidget());
                        }
                        else if (state is GetApplicantDataDone) {

                          Shared.dismissDialog(context: context);
                          nafath_bloc.add(loginClickEvent());
                        }
                        else if (state is ErrorGetApplicantData) {
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message: state.message!,
                              sigin_button: false);
                        }
                        else if (state is SiginDone) {
                          Shared.vistor_value = '';
                          Shared.dismissDialog(context: context);
                          if(widget.from_profile!){
                            Navigator.pop(context);
                           var tabeControllerProvider = Provider.of<TabControllerProvider>(context, listen: false);
                            tabeControllerProvider.changeTab(index: 0);
                          }else{
                            customAnimatedPushNavigation(context, Index());
                          }
                         await AuthenticationRepository.saveFcmToken(
                              device_token: await sharedPreferenceManager.readString(CachingKey.DEVICE_TOKEN),
                              applicantId: state.model!.data!.applicationId.toString()).then((value){
                            if(value.succeeded!) {
                              print("device token registered Successfuly");
                            }else{
                              print("device token registered Faield");
                            }
                          });


                        }
                        else if (state is ErrorSigin) {
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message: state.message! ?? "",
                              sigin_button: false);
                        }
                        else if (state is ErrorLoading) {
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message: state.message!,
                              sigin_button: false);
                        }
                        else if (state is EmptyField) {
                          Shared.dismissDialog(context: context);
                          customAnimatedPushNavigation(context, SiginScreen());
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message: knafath_expire.tr(),
                              sigin_button: false);
                        }
                      },
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.logo,
                                width: 250.w,
                                //  height: 120.16.h,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Shared.width * 0.05),
                                child: Text(
                                  kLoginNafath.tr(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Shared.width * 0.06),
                                child: Form(
                                  key: identityFormKey,
                                  child: Container(
                                    width: Shared.width * 0.9,
                                    child: CustomTextField(
                                        formKey: identityFormKey,
                                        hint: kidentity_number.tr(),
                                        controller: identity_numbrerController,
                                        alignment:
                                        translator.activeLanguageCode == 'ar'
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        identity: true,
                                        errorMessage: kEnter_the_identity.tr(),
                                        icon: Icon(
                                          Icons.account_circle_outlined,
                                          color: kGreyColor,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: CustomButtonWidget(
                                    button_text: kLogin.tr(),
                                    width: Shared.width * 0.9,
                                    height: Shared.width * 0.13,
                                    onPress: () async {
                                      Shared.start_timer = 0;
                                      FocusManager.instance.primaryFocus?.unfocus();

                                      await appPublishRepository.getAppPublishInfo().then((value) async {
                                        if(Platform.isAndroid){
                                          if( value[0].isPublish == 0){
                                            if (identityFormKey.currentState!.validate()) {
                                              nafath_bloc.add(SendNafathRequestEvent(
                                                  nationalId: identity_numbrerController.text
                                              )
                                              );
                                            }
                                            else {
                                              Shared.showSnackBarView(
                                                  message: kEnter_the_identity,
                                                  error_status: true,
                                                  sigin_button: false);
                                            }

                                          }
                                          else{
                                            sharedPreferenceManager.writeData(CachingKey.APPLICANT_ID, 181);
                                            await profile_Repository.getProfileData().then((value){
                                              if(value!.succeeded!){

                                                sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, value.data!.phone);

                                                sharedPreferenceManager.writeData(CachingKey.NATIONALITY_ID, value.data!.idNo);
                                                sharedPreferenceManager.writeData(CachingKey.ArFullName, value.data!.name);
                                                sharedPreferenceManager.writeData(CachingKey.EnFullName, value.data!.nameEn);
                                                sharedPreferenceManager.writeData(CachingKey.ArFirst, value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.ArFather, value.data!.secondName);
                                                sharedPreferenceManager.writeData(CachingKey.ArFamily, value.data!.thirdName);
                                                sharedPreferenceManager.writeData(CachingKey.ArGrand, value.data!.lastName);
                                                sharedPreferenceManager.writeData(CachingKey.Gender, value.data!.gender);
                                                sharedPreferenceManager.writeData(CachingKey.DobG, value.data!.birthdate);
                                                sharedPreferenceManager.writeData(CachingKey.DobH, 14120425);
                                                sharedPreferenceManager.writeData(CachingKey.EnFirst, value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.EnFather, value.data!.secondName);
                                                sharedPreferenceManager.writeData(CachingKey.EnFamily, value.data!.thirdName);
                                                sharedPreferenceManager.writeData(CachingKey.EnGrand, value.data!.lastName);
                                                sharedPreferenceManager.writeData(CachingKey.IdExpiryDateH, value.data!.birthdateHijri);
                                                sharedPreferenceManager.writeData(CachingKey.IdExpiryDateG, value.data!.birthdate);
                                                sharedPreferenceManager.writeData(CachingKey.Nationality, 1);
                                                sharedPreferenceManager.writeData(CachingKey.ArNationality, value.data!.nationality);
                                                sharedPreferenceManager.writeData(CachingKey.EnNationality, value.data!.nationality);
                                                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_En,"التويم");
                                                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_AR, "التويم");
                                                sharedPreferenceManager.writeData(CachingKey.CITY_ID, 5);
                                                sharedPreferenceManager.writeData(CachingKey.ArTwoNames, value.data!.firstName +" "+ value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.EnTwoNames, value.data!.firstName +" "+ value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.status, value.data!.status.toString());
                                                sharedPreferenceManager.writeData(CachingKey.EMAIL, value.data!.email);

                                              }else{
                                              }
                                            }).whenComplete((){
                                              if (identityFormKey.currentState!.validate()) {
                                                nafath_bloc.add(loginClickEvent());
                                              }
                                            });

                                          }

                                        }
                                        else{
                                          if(value[1].isPublish == 0){
                                            if (identityFormKey.currentState!.validate()) {
                                              nafath_bloc.add(SendNafathRequestEvent(
                                                  nationalId: identity_numbrerController.text
                                              ));
                                            }
                                            else {
                                              Shared.showSnackBarView(
                                                  message: kEnter_the_identity,
                                                  error_status: true,
                                                  sigin_button: false);
                                            }

                                          }
                                          else{
                                            sharedPreferenceManager.writeData(CachingKey.APPLICANT_ID, 181);
                                            await profile_Repository.getProfileData().then((value){
                                              if(value!.succeeded!){

                                                sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, value.data!.phone);

                                                sharedPreferenceManager.writeData(CachingKey.NATIONALITY_ID, value.data!.idNo);
                                                sharedPreferenceManager.writeData(CachingKey.ArFullName, value.data!.name);
                                                sharedPreferenceManager.writeData(CachingKey.EnFullName, value.data!.nameEn);
                                                sharedPreferenceManager.writeData(CachingKey.ArFirst, value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.ArFather, value.data!.secondName);
                                                sharedPreferenceManager.writeData(CachingKey.ArFamily, value.data!.thirdName);
                                                sharedPreferenceManager.writeData(CachingKey.ArGrand, value.data!.lastName);
                                                sharedPreferenceManager.writeData(CachingKey.Gender, value.data!.gender);
                                                sharedPreferenceManager.writeData(CachingKey.DobG, value.data!.birthdate);
                                                sharedPreferenceManager.writeData(CachingKey.DobH, 14120425);
                                                sharedPreferenceManager.writeData(CachingKey.EnFirst, value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.EnFather, value.data!.secondName);
                                                sharedPreferenceManager.writeData(CachingKey.EnFamily, value.data!.thirdName);
                                                sharedPreferenceManager.writeData(CachingKey.EnGrand, value.data!.lastName);
                                                sharedPreferenceManager.writeData(CachingKey.IdExpiryDateH, value.data!.birthdateHijri);
                                                sharedPreferenceManager.writeData(CachingKey.IdExpiryDateG, value.data!.birthdate);
                                                sharedPreferenceManager.writeData(CachingKey.Nationality, 1);
                                                sharedPreferenceManager.writeData(CachingKey.ArNationality, value.data!.nationality);
                                                sharedPreferenceManager.writeData(CachingKey.EnNationality, value.data!.nationality);
                                                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_En,"التويم");
                                                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_AR, "التويم");
                                                sharedPreferenceManager.writeData(CachingKey.CITY_ID, 5);
                                                sharedPreferenceManager.writeData(CachingKey.ArTwoNames, value.data!.firstName +" "+ value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.EnTwoNames, value.data!.firstName +" "+ value.data!.firstName);
                                                sharedPreferenceManager.writeData(CachingKey.status, value.data!.status.toString());
                                                sharedPreferenceManager.writeData(CachingKey.EMAIL, value.data!.email);

                                              }else{
                                              }
                                            }).whenComplete((){
                                              if (identityFormKey.currentState!.validate()) {
                                                nafath_bloc.add(loginClickEvent());
                                              }
                                            });

                                          }
                                        }


                                      });


                                    },
                                  )),


                            // we do this condition because apple refuse show google play and huweii solagn
                        Shared.apple_test == 0 ?   Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Shared.width * 0.06,
                                      bottom: Shared.width * 0.03
                                  ),
                                  child:  Divider(indent: 30,endIndent: 30,),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: Shared.width * 0.02,
                                        bottom: Shared.width * 0.01
                                    ),
                                    child: Text(
                                      kdownload_nafath.tr(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Shared.width * 0.03,horizontal: Shared.width * 0.05),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child:    Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Shared.width * 0.02),
                                                child:InkWell(
                                                  onTap: ()async{
                                                 launchUrl(Uri.parse("https://appgallery.huawei.com/app/C106870695"));
                                                  },
                                                  child: Image.asset(ImageAssets.huawei_store,
                                                    height: Shared.width * 0.12,
                                                    // width: Shared.width * 0.3,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )   )
                                        ),
                                        Expanded(
                                            child:    Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Shared.width * 0.02),
                                                child:InkWell(
                                                  onTap: (){
                                                    launchUrl(Uri.parse("https://apps.apple.com/sa/app/%D9%86%D9%81%D8%A7%D8%B0-nafath/id1598909871"));
                                                  },
                                                  child: Image.asset(ImageAssets.apple_store,
                                                    height: Shared.width * 0.12,
                                                    // width: Shared.width * 0.3,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )   )
                                        ),
                                        Expanded(
                                            child:  Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Shared.width * 0.02),
                                            child:InkWell(
                                              onTap: (){
                                                launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=sa.gov.nic.myid"));
                                              },
                                              child: Image.asset(ImageAssets.google_play,
                                                height: Shared.width * 0.12,
                                                // width: Shared.width * 0.3,
                                                fit: BoxFit.fitWidth,),
                                            ))),
                                      ],
                                    )
                                )
                              ],
                            ) : Container()

                            ],
                          ),
                        ),
                      )),
                ))),
      ),
    );
  }


}
