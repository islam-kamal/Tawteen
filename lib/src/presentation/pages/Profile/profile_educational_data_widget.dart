import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/presentation/bloc/Authentication_Bloc/SignupBloc/sign_up_bloc.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
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

  bool? hasExperience = false;
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
                        }else if(state is Done){
                          Shared.dismissDialog(context: context);
                       print("******** signUpBloc Done");

                        }else if(state is ErrorLoading){
                          Shared.dismissDialog(context: context);
                   //       customAnimatedPushNavigation(context, SiginScreen());
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
                                    child: profilePagesIndictor(
                                        context: context,
                                        isPersonalData: true,
                                        isContactInfo: true,
                                        isEductionalData: true),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Shared.width * 0.06),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kmajor.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomEductionMajorDropDown(
                                          hint: kmajor.tr(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: keducationlevel.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomEductionalLevelDropDown(
                                          hint: keducationlevel.tr(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02),
                                          child: Shared.text_widget(
                                              text: kskills.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomSkillsDropdown(
                                          hint: krequiredskills.tr(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02),
                                          child: Shared.text_widget(
                                              text: kisthereexperience.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          height: Shared.width * 0.13,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kInactiveColor),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Row(
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
                                                              return ApplicantExperienceWidget();
                                                            },
                                                          );
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
                                        ),


                                        hasExperience! ?        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                          child: Container(
                                            width: Shared.width,
                                            child: Column(
                                              children: [
                                                BlocBuilder(
                                                  bloc: experienceBloc,
                                                  builder: (context,state){
                                                    if(state is Loading){
                                                      return Padding(
                                                        padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                                                        child: Center(
                                                            child: Shared.spinkit
                                                        ),
                                                      );
                                                    }else if(state is Done){
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
                                                                                border: Border.all(color: kGreyColor)),
                                                                            child: Column(
                                                                              children: [
                                                                                Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.01),
                                                                                    child:    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          children: [
                                                                                            Text(
                                                                                              "${ snapshot.data![index].jobRoleName} , ",
                                                                                              style: TextStyle(
                                                                                                  color: kBlackColor),
                                                                                            ),
                                                                                            Text(
                                                                                              snapshot.data![index].orgName,
                                                                                              style: TextStyle(
                                                                                                  color: kBlackColor),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        IconButton(onPressed: (){
                                                                                          snapshot.data!.removeAt(index);
                                                                                          setState(() {

                                                                                          });
                                                                                        }, icon: Icon(Icons.delete,color: kRedColor,))
                                                                                      ],
                                                                                    ) ),
                                                                                Padding(
                                                                                    padding: EdgeInsets.symmetric(
                                                                                        horizontal: Shared.width * 0.01),
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
                                                                                                    "${ snapshot.data![index].startMonth}, ${Shared.user_experinces[index].startYear}",
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
                                                                                                    "${ snapshot.data![index].endMonth}, ${Shared.user_experinces[index].endYear}",
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

                                                    }else if(state is ErrorLoading){
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
                                                            return ApplicantExperienceWidget();
                                                          },
                                                        );
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
                                          /*      var tabeControllerProvider = Provider.of<TabControllerProvider>(context, listen: false);
                                                tabeControllerProvider.changeTab(0);*/
                                                signUpBloc.add(click());
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
