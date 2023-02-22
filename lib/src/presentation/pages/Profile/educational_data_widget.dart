import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Profile/personal_info_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eduction_majors_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_eductional_level.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_skills_dropdown.dart';
import 'package:code/src/presentation/widgets/applicant_experience_widget.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:provider/provider.dart';

class EductionalDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EductionalDataWidgetState();
  }
}

class EductionalDataWidgetState extends State<EductionalDataWidget> {
  String _currText = '';

  List<String> text = [kyes.tr(), kno.tr()];
  bool? hasExperience = false;
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child:Scaffold(
            appBar: AppBarWidget.appBarWidget(
                context: context,
                icon: false
            ),
            backgroundColor: kWhiteColor,
            body:  Container(
                color: kGreenColor,
                child:Container(
                  height: Shared.height,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Shared.width * 0.08),
                        topLeft: Radius.circular(Shared.width * 0.08)),
                  ),
                  child:  Scrollbar(
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                                child:  profilePagesIndictor(
                                    context: context,
                                    isPersonalData: true,
                                    isContactInfo: true,
                                    isEductionalData: true),
                              ),

                              Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kmajor.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  CustomEductionMajorDropDown(
                                    hint: kmajor.tr(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: keducationlevel.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  CustomEductionalLevelDropDown(
                                    hint: keducationlevel.tr(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                    child: Shared.text_widget(
                                        text: kskills.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  CustomSkillsDropdown(
                                    hint: krequiredskills.tr(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                    child: Shared.text_widget(
                                        text: kisthereexperience.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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

                      hasExperience! ? ApplicantExperienceWidget() : Container(),

                                  Padding(
                                      padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                      child: CustomButtonWidget(
                                        button_text: kupdate.tr(),
                                        width: Shared.width,
                                        height: Shared.width * 0.13,
                                        onPress: () async {
                                        var tabeControllerProvider = Provider.of<TabControllerProvider>(context,listen: false);
                                          tabeControllerProvider.changeTab(0);
                                },
                                      )),
                                ],
                              ),)
                            ],
                          )) //PersonalInfoWidget()
                  ),

                )),
          ),

        ),
      ),
    );

  }
}
