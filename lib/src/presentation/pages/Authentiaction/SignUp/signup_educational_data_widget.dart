import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';
import 'package:code/src/presentation/bloc/Authentication_Bloc/SignupBloc/sign_up_bloc.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eduction_majors_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eductional_level.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_skills_dropdown.dart';
import 'package:code/src/presentation/widgets/applicant_experience_widget.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:code/src/presentation/widgets/signup_pages_indicator.dart';
import 'package:provider/provider.dart';

class SignUpEductionalDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpEductionalDataWidgetState();
  }
}

class SignUpEductionalDataWidgetState extends State<SignUpEductionalDataWidget> {
  String _currText = '';
  var total_experience_controller = TextEditingController();
  var graduationYear_controller = TextEditingController();
  var university_controller = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  UserEductionEntity? userEductionEntity ;
  bool? hasExperience = false;
  var eductional_major_id , eductional_level_id;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBarWidget.appBarWidget(context: context, icon: false),
            backgroundColor: kWhiteColor,
            body: Container(
                color: kGreenColor,
                child: Container(
                  height: Shared.height,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Shared.width * 0.08),
                        topLeft: Radius.circular(Shared.width * 0.08)),
                  ),
                  child: BlocListener(
                      bloc: signUpBloc,
                      listener: (context, state) {
                        if(state is Loading){
                          Shared.showLoadingDialog(context: context);
                        }
                        else if(state is Done){
                          Shared.dismissDialog(context: context);
                          customAnimatedPushNavigation(context, SiginScreen());
                       print("******** signUpBloc Done");

                        }
                        else if(state is ErrorLoading){
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message:  state.message!,
                              sigin_button: false
                          );
                          print("******** signUpBloc ErrorLoading");
                        }
                      },
                      child:  Scrollbar(
                          child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                                    child: SignUpPagesIndictor(
                                        context: context,
                                        isPersonalData: true,
                                        isContactInfo: true,
                                        isEductionalData: true),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Shared.width * 0.06),
                                    child: Form(
                                        key: signupFormKey,
                                        child: Column(
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kmajor.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomEductionMajorDropDown(
                                          hint: kmajor.tr(),
                                          isRegister: true,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: keducationlevel.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomEductionalLevelDropDown(
                                          hint: keducationlevel.tr(),
                                          isRegister: true,
                                        ),


                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kJobtitle.tr(),
                                              textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                        ),
                                        CustomJobTitlesDropDown(
                                          hint:kJobtitle.tr()  ,
                                          main_jobtitle_id: true,
                                          isRegister: true,
                                        ),


                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kskills.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomSkillsDropdown(
                                          hint: krequiredskills.tr(),
                                          isProfie: false,
                                        ),


                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kuniversity.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                        child:    Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: university_controller,
                                            hint: kuniversity.tr(),
                                            formKey: signupFormKey,
                                            alignment: translator.activeLanguageCode == 'ar'
                                                ? TextAlign.right
                                                : TextAlign.left,

                                            errorMessage:
                                            kEnter_university.tr(),
                                          ),
                                        )),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kgraduationyear.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                        child:   Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: graduationYear_controller,
                                            formKey: signupFormKey,
                                            hint: kgraduationyear.tr(),
                                            isMobile: true,
                                            isValidator: false,
                                            alignment:
                                            translator.activeLanguageCode ==
                                                'ar'
                                                ? TextAlign.right
                                                : TextAlign.left,

                                            errorMessage:
                                            kEnter_graduationyear.tr(),
                                          ),
                                        )    ),



                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kisthereexperience.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),

                                        Padding(
                                            padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                            child:     Container(
                                          width: Shared.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kInactiveColor),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child:          hasExperience! ?  Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: ListTile(
                                                        title: Text(kyes.tr()),
                                                        contentPadding: EdgeInsets.all(0),
                                                        horizontalTitleGap: 0,
                                                        leading: Radio<String?>(
                                                          value: kyes.tr(),
                                                          groupValue: _currText,
                                                          activeColor: kGreenColor,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _currText = value!;
                                                              hasExperience = true;
                                                              showModalBottomSheet(
                                                                isScrollControlled: true,
                                                                context: context,
                                                                shape: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(
                                                                            ScreenUtil.defaultSize
                                                                                .width *
                                                                                0.1),
                                                                        topRight: Radius.circular(
                                                                            ScreenUtil.defaultSize
                                                                                .width *
                                                                                0.1)),
                                                                    borderSide: BorderSide(
                                                                        color: kWhiteColor)),
                                                                builder: (context) {
                                                                  return ApplicantExperienceWidget(
                                                                    register_status: true,
                                                                  );
                                                                },
                                                              ).whenComplete(() {

                                                                setState(() {

                                                                });
                                                              });
                                                            });
                                                          },
                                                        ),
                                                      )),
                                                  Expanded(
                                                      child: ListTile(
                                                        title: Text(kno.tr()),
                                                        contentPadding: EdgeInsets.all(0),
                                                        horizontalTitleGap: 0,
                                                        leading: Radio<String?>(
                                                          value: kno.tr(),
                                                          activeColor: kGreenColor,
                                                          groupValue: _currText,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _currText = value!;
                                                              hasExperience = false;
                                                            });
                                                          },
                                                        ),
                                                      )),
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: Shared.width,
                                                height: Shared.width * 0.1,
                                                child: CustomTextField(
                                                  controller: total_experience_controller,
                                                  formKey: signupFormKey,
                                                  hint: kyearsexperience.tr(),
                                                  isMobile: true,
                                                  isValidator: false,
                                                  alignment: translator.activeLanguageCode == 'ar' ?
                                                      TextAlign.right : TextAlign.left,
                                                  errorMessage: kEnter_email_correctly.tr(),
                                                ),
                                              ),
                                            ],
                                          )
                                         : Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: ListTile(
                                                  title: Text(kyes.tr()),
                                                  contentPadding: EdgeInsets.all(0),
                                                  horizontalTitleGap: 0,
                                                  leading: Radio<String?>(
                                                    value: kyes.tr(),
                                                    groupValue: _currText,
                                                    activeColor: kGreenColor,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _currText = value!;
                                                        hasExperience = true;
                                                        showModalBottomSheet(
                                                          isScrollControlled: true,
                                                          context: context,
                                                          shape: OutlineInputBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(
                                                                      ScreenUtil.defaultSize
                                                                          .width *
                                                                          0.1),
                                                                  topRight: Radius.circular(
                                                                      ScreenUtil.defaultSize
                                                                          .width *
                                                                          0.1)),
                                                              borderSide: BorderSide(
                                                                  color: kWhiteColor)),
                                                          builder: (context) {
                                                            return ApplicantExperienceWidget(
                                                              register_status: true,
                                                            );
                                                          },
                                                        ).whenComplete(() {

                                                          setState(() {

                                                          });
                                                        });
                                                      });
                                                    },
                                                  ),
                                                )),
                                            Expanded(
                                                child: ListTile(
                                                  title: Text(kno.tr()),
                                                  contentPadding: EdgeInsets.all(0),
                                                  horizontalTitleGap: 0,
                                                  leading: Radio<String?>(
                                                    value: kno.tr(),
                                                    activeColor: kGreenColor,
                                                    groupValue: _currText,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _currText = value!;
                                                        hasExperience = false;
                                                      });
                                                    },
                                                  ),
                                                )),
                                            Expanded(
                                              child: Container(),
                                            ),
                                          ],
                                        ),
                                        )),

                                        hasExperience! ?  Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Container(
                                            width: Shared.width,
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                    itemCount: Shared.user_experinces.length,
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01,horizontal: Shared.width * 0.01),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: kWhiteColor,
                                                              borderRadius: BorderRadius.circular(10),
                                                              border: Border.all(color: kGreyColor)),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                                                  child:    Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "${ Shared.user_experinces[index].jobRoleName} , ",
                                                                            style: TextStyle(
                                                                                color: kBlackColor),
                                                                          ),
                                                                          Text(
                                                                            Shared.user_experinces[index].orgName!,
                                                                            style: TextStyle(
                                                                                color: kBlackColor),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      IconButton(onPressed: (){
                                                                        Shared.user_experinces.removeAt(index);
                                                                        setState(() {

                                                                        });
                                                                      }, icon: Icon(Icons.delete,color: kRedColor,))
                                                                    ],
                                                                  ) ),
                                                              Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                                                  child:  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                                                                  child: Text(
                                                                                      kStartDate.tr(),
                                                                                      style: TextStyle(
                                                                                          color: kGreenColor,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontSize: 15))),
                                                                              Text(
                                                                                  "${Shared.user_experinces[index].startMonth}, ${Shared.user_experinces[index].startYear}",
                                                                                  style: TextStyle(
                                                                                    //fontWeight: FontWeight.bold,
                                                                                      fontSize:
                                                                                      15)),
                                                                            ],
                                                                          )),
                                                                      Expanded(
                                                                          child: Column(
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                                                                                  child: Text(
                                                                                      kenddate.tr(),
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          kGreenColor,
                                                                                          fontWeight:
                                                                                          FontWeight
                                                                                              .normal,
                                                                                          fontSize:
                                                                                          15))),
                                                                              Text(
                                                                                  "${ Shared.user_experinces[index].endMonth}, ${Shared.user_experinces[index].endYear}",
                                                                                  style: TextStyle(
                                                                                    //fontWeight: FontWeight.bold,
                                                                                      fontSize:
                                                                                      15)),
                                                                            ],
                                                                          ))
                                                                    ],
                                                                  )
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),

                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: Shared.width * 0.02),
                                                  child: Row(
                                                    children: [
                                                      IconButton(onPressed: (){
                                                        showModalBottomSheet(
                                                          isScrollControlled: true,
                                                          context: context,
                                                          shape: OutlineInputBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(
                                                                      ScreenUtil.defaultSize
                                                                          .width *
                                                                          0.1),
                                                                  topRight: Radius.circular(
                                                                      ScreenUtil.defaultSize
                                                                          .width *
                                                                          0.1)),
                                                              borderSide: BorderSide(
                                                                  color: kWhiteColor)),
                                                          builder: (context) {
                                                            return ApplicantExperienceWidget(
                                                              register_status: true,
                                                            );
                                                          },
                                                        ).whenComplete(() {

                                                          setState(() {

                                                          });
                                                        });
                                                      }, icon: Icon(Icons.add_circle,color: kGreenColor,)
                                                      ),
                                                      Shared.text_widget(
                                                          text: kadditionalexperience.tr(),
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ) : Container(),



                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Shared.width * 0.1),
                                            child: CustomButtonWidget(
                                              button_text: kRegisterNow.tr(),
                                              width: Shared.width,
                                              height: Shared.width * 0.13,
                                              onPress: () async {
                                                await sharedPreferenceManager.readString(CachingKey.EDUCTION_MAJOR_ID).then((value) async {
                                                  eductional_major_id = value.toString();
                                                  await sharedPreferenceManager.readString(CachingKey.EDUCTIONAL_LEVEL_ID).then((value){
                                                    eductional_level_id = value.toString();

                                                    if (signupFormKey.currentState!.validate()
                                                        && validateInputs(context, ctx: context)) {
                                                      userEductionEntity = new UserEductionEntity(
                                                          graduationYear: int.parse(graduationYear_controller.text),
                                                          university: university_controller.text,
                                                          totalExperience: total_experience_controller.text.isEmpty ? 0 : int.parse(total_experience_controller.text)
                                                      );
                                                      signUpBloc.add(click(
                                                          signup_attachments:Shared.signup_attachments,
                                                          userEductionEntity: userEductionEntity
                                                      ));
                                                    }

                                                    /*   if(total_experience_controller.text.isEmpty &&    hasExperience!){
                                                  Shared.showSnackBarView(
                                                      error_status: true,
                                                      message: kEnter_experience_years,
                                                      sigin_button: false
                                                  );
                                                }
                                                else{
                                                  userEductionEntity = new UserEductionEntity(
                                                      graduationYear: int.parse(graduationYear_controller.text),
                                                      university: university_controller.text,
                                                      totalExperience: total_experience_controller.text.isEmpty ? 0 : int.parse(total_experience_controller.text)
                                                  );
                                                  signUpBloc.add(click(
                                                      signup_attachments:Shared.signup_attachments,
                                                      userEductionEntity: userEductionEntity
                                                  ));
                                                }*/
                                                  });
                                                });



                                              },
                                            )),
                                      ],
                                    )),
                                  )
                                ],
                              )) //PersonalInfoWidget()
                      ),
                ),


                )),
          ),
        ),
      ),
    );
  }

  bool validateInputs(BuildContext context,
      {var scaffoldKey, required var ctx}) {

    if (total_experience_controller.text.isEmpty &&    hasExperience!) {
      Shared.showSnackBarView(
          error_status: true,
          message: kEnter_experience_years,
          sigin_button: false
      );
      return false;
    }
    if (university_controller.text.isEmpty) {

      Shared.showSnackBarView(
          error_status: true,
          message: kenter.tr() + kuniversity.tr(),
          sigin_button: false
      );
      return false;
    }
    if (graduationYear_controller.text.isEmpty) {
      Shared.showSnackBarView(
          error_status: true,
          message: kenter.tr() +" "+ kgraduationyear.tr(),
          sigin_button: false
      );
      return false;
    }
    if (eductional_major_id == "null") {
      print("##eductional_major_id : ${eductional_major_id}");
      Shared.showSnackBarView(
          error_status: true,
          message: kenter+" "+ kmajor.tr(),
          sigin_button: false
      );
      return false;
    }

    if (eductional_level_id == "null") {
      print("##eductional_level_id : ${eductional_level_id}");
      Shared.showSnackBarView(
          error_status: true,
          message: kenter+" "+ keducationlevel.tr(),
          sigin_button: false
      );
      return false;
    }

    return true;
  }
}

