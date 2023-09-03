import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/ProfileModel/profile_skills_model.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';
import 'package:code/src/presentation/bloc/Authentication_Bloc/SignupBloc/sign_up_bloc.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eduction_majors_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eductional_level.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_skills_dropdown.dart';
import 'package:code/src/presentation/widgets/applicant_experience_widget.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:provider/provider.dart';

class ProfileEductionalDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileEductionalDataWidgetState();
  }
}

class ProfileEductionalDataWidgetState extends State<ProfileEductionalDataWidget> {
  String _currText = '';
  var total_experience_controller = TextEditingController();
  var graduationYear_controller = TextEditingController();
  var university_controller = TextEditingController();
  bool? hasExperience = false;
  final profileFormKey = GlobalKey<FormState>();
  UserEductionEntity? userEductionEntity ;
  @override
  void initState() {
    if(Shared.profile_experiences!.isEmpty){
      hasExperience = false;
    }else{
      hasExperience = true;
      _currText = kyes.tr();
    }
    university_controller.text = Shared.profileModel!.university.toString();
    graduationYear_controller.text = Shared.profileModel!.graduationYear.toString();
    total_experience_controller.text = Shared.profileModel!.totalExperience.toString();
   profileBloc.add(GetProfileSkillsEvent());

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
            appBar: AppBarWidget.appBarWidget(
                context: context,
                icon: true,
                route: ProfileContactInfoWidget()),
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
                      bloc: profileBloc,
                      listener: (context, state) {
                        if(state is Loading){
                          Shared.showLoadingDialog(context: context);
                        }
                        else if(state is Done){
                          Shared.dismissDialog(context: context);
                       customAnimatedPushNavigation(context, HomeScreen());
                        }
                        else if(state is ErrorLoading){
                          Shared.dismissDialog(context: context);
                          Shared.showSnackBarView(
                              error_status: true,
                              backend_message:  state.message!,
                              sigin_button: false
                          );

                        }

                      },
                      child:  Scrollbar(
                          child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                                    child: profilePagesIndictor(
                                        context: context,
                                        isPersonalData: true,
                                        isContactInfo: true,
                                        isEductionalData: true),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
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
                                          eductionMajor: Shared.profileModel!.educationMajor,
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
                                          eductionalLevel: Shared.profileModel!.educationLevel,
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
                                          hint: Shared.profileModel!.jobTitle == null
                                              ? kJobtitle.tr() : Shared.profileModel!.jobTitle ,
                                          main_jobtitle_id: true,
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
                                          isProfie: true,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kuniversity.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: university_controller,
                                            hint: kuniversity.tr(),
                                            formKey: profileFormKey,
                                            alignment: translator.activeLanguageCode == 'ar'
                                                ? TextAlign.right
                                                : TextAlign.left,

                                            errorMessage:
                                            kEnter_university.tr(),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kgraduationyear.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: graduationYear_controller,
                                            formKey: profileFormKey,
                                            hint: kgraduationyear.tr(),
                                            alignment:
                                            translator.activeLanguageCode ==
                                                'ar'
                                                ? TextAlign.right
                                                : TextAlign.left,
                                            errorMessage:
                                            kEnter_graduationyear.tr(),
                                          ),
                                        ),

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
                                            child:   Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kInactiveColor),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child:     hasExperience! ?  Column(
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
                                                              hasExperience! ? Container()
                                                                  :    showModalBottomSheet(
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
                                                                    register_status: false,
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
                                              Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05,vertical: 5),
                                              child: Row(
                                                children: [
                                                  Text(kyearsexperience.tr()),
                                                  SizedBox(width: Shared.width * 0.1,),
                                                  Container(
                                                    width: Shared.width * 0.3,
                                                    height: Shared.width * 0.1,
                                                    child:CustomTextField(
                                                      controller: total_experience_controller,
                                                      formKey: profileFormKey,
                                                      hint: kyearsexperience.tr(),
                                                      isMobile: true,
                                                      isValidator: false,
                                                      alignment:  TextAlign.center,
                                                      errorMessage: kEnter_total_experience.tr(),
                                                    ),
                                                  ),
                                                ],
                                              ),)

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
                                                          hasExperience! ? Container() :      showModalBottomSheet(
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
                                                                register_status: false,
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

                                       hasExperience! ?        Padding(
                                         padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                          child: Container(
                                            width: Shared.width,
                                            child: Column(
                                              children: [

                                       BlocBuilder(
                                                  bloc: experienceBloc,
                                                  builder: (context,state){
                                                    if(state is ProfileExperienceLoading){
                                                      return Padding(
                                                        padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                                                        child: Center(
                                                            child: Shared.spinkit
                                                        ),
                                                      );
                                                    }else if(state is ProfileExperienceDone){

                                                      return StreamBuilder<List<ExperienceEntity>>(
                                                          stream: experienceBloc.experience_subject,
                                                          builder: (context,snapshot){
                                                            switch (snapshot.connectionState) {
                                                              case ConnectionState.none:
                                                                return Padding(
                                                                  padding: EdgeInsets.only(top:Shared.width * 0.4, ),
                                                                  child: Center(
                                                                      child: Shared.spinkit
                                                                  ),
                                                                );
                                                              case ConnectionState.done:
                                                                return Text('');
                                                              case ConnectionState.waiting:
                                                                return Padding(
                                                                  padding: EdgeInsets.only(top:Shared.width * 0.4, ),
                                                                  child: Center(
                                                                      child: Shared.spinkit
                                                                  ),
                                                                );
                                                              case ConnectionState.active:
                                                                if (snapshot.hasError) {
                                                                  return Center(
                                                                    child: Text(snapshot.error.toString()),
                                                                  );
                                                                }
                                                                else  {
                                                                  return     ListView.builder(
                                                                      itemCount: snapshot.data!.length,
                                                                      shrinkWrap: true,
                                                                      physics: NeverScrollableScrollPhysics(),
                                                                      itemBuilder: (context, index) {
                                                                        return Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01,horizontal: Shared.width * 0.01),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                                color: kWhiteColor,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                border: Border.all(color: kInactiveColor)),
                                                                            child: Column(
                                                                              children: [
                                                                                Padding(
                                                                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                                                                    child:    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                            flex: 5,
                                                                                            child:  Text(
                                                                                              "${ snapshot.data![index].jobRoleName} , ${ snapshot.data![index].orgName!}",
                                                                                              style: TextStyle(
                                                                                                  color: kBlackColor),
                                                                                              maxLines: 4,
                                                                                            ),),
                                                                                        Expanded(
                                                                                            flex: 1,
                                                                                            child:  IconButton(onPressed: (){
                                                                                   /*       experienceBloc.add(DeleteExperienceEvent(
                                                                                            experience_id:  snapshot.data![index].applicantId.toString()
                                                                                          ));*/
                                                                                          snapshot.data!.removeAt(index);
                                                                                          setState(() {

                                                                                          });
                                                                                        }, icon: Icon(Icons.delete,color: kRedColor,)))
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
                                                                                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                                                                                                    child: Text(
                                                                                                        kStartDate.tr(),
                                                                                                        style: TextStyle(
                                                                                                            color: kGreenColor,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontSize: 15))),
                                                                                                Text(
                                                                                                    "${ snapshot.data![index].startMonth}, ${snapshot.data![index].startYear}",
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
                                                                                                    "${ snapshot.data![index].endMonth}, ${snapshot.data![index].endYear}",
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
                                                                      });
                                                                }

                                                            }
                                                          });

                                                    }else if(state is ProfileExperienceErrorLoading){
                                                      return no_data_widget(context: context);
                                                    }
                                                    return Container();
                                                  },
                                                ),
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
                                                              register_status: false,
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
                                            )



                                            ,
                                          ),
                                        ) : Container(),


                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Shared.width * 0.1),
                                            child: CustomButtonWidget(
                                              button_text: kupdate.tr(),
                                              width: Shared.width,
                                              height: Shared.width * 0.13,
                                              onPress: () async {

                                                userEductionEntity = new UserEductionEntity(
                                                    graduationYear: int.parse(graduationYear_controller.text),
                                                    university: university_controller.text,
                                                    totalExperience:  int.parse(total_experience_controller.text)
                                                );
                                            profileBloc.add(ProfileUpdateEvent(
                                              userEductionEntity: userEductionEntity
                                            ));
                                              },
                                            )),


                                      ],
                                    ),
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
}
