import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/experience_entity.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/custom_scroll_calendar.dart';
import 'package:flutter/cupertino.dart';

class ApplicantExperienceWidget extends StatefulWidget {
  bool? register_status;
  ApplicantExperienceWidget({this.register_status= false});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ApplicantExperienceWidgetState();
  }
}

class ApplicantExperienceWidgetState extends State<ApplicantExperienceWidget> {
  var description_Controller = TextEditingController();
  var facility_Controller = TextEditingController();
  final addExperienceFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: translator.activeLanguageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
            child: SingleChildScrollView(
                child: Form(
                    key: addExperienceFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Row(children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Container(
                                child: Icon(Icons.close_rounded),
                                decoration: BoxDecoration(
                                    border: Border.all(color: kBlackColor),
                                    borderRadius: BorderRadius.circular(30)),
                                width: ScreenUtil.defaultSize.width * 0.1,
                                height: ScreenUtil.defaultSize.width * 0.1,
                                // color: Colors.red,
                              ),
                            )
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Shared.text_widget(
                              text: kJobtitle.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ),
                        CustomJobTitlesDropDown(
                          hint: kJobtitle.tr(),
                          isRegister: true,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Shared.text_widget(
                              text: kfacilityname.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ),
                        Container(
                          width: Shared.width,
                          child: CustomTextField(
                            formKey: addExperienceFormKey,
                            controller: facility_Controller,
                            hint: kfacilityname.tr(),
                            alignment: translator.activeLanguageCode == 'ar'
                                ? TextAlign.right
                                : TextAlign.left,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomScrollCalendar(
                              start_year: true,
                            ),
                            CustomScrollCalendar(),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Shared.text_widget(
                              text: kdescription.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ),
                        Container(
                          width: Shared.width,
                          child: CustomTextField(
                            formKey: addExperienceFormKey,
                            controller: description_Controller,
                            hint: kdescription.tr(),
                            isNotes: true,
                            alignment: translator.activeLanguageCode == 'ar'
                                ? TextAlign.right
                                : TextAlign.left,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Shared.width * 0.05),
                            child: CustomButtonWidget(
                              button_text: kaddexperience.tr(),
                              width: Shared.width,
                              height: Shared.width * 0.13,
                              onPress: () async {
                                if(widget.register_status!){
                                  Shared.user_experinces.add(ExperienceEntity(
                                      cityId: await sharedPreferenceManager
                                          .readString(CachingKey.CITY_ID),
                                      provinceId: await sharedPreferenceManager
                                          .readString(CachingKey.PROVINCE_ID),
                                      jobTitleId: await sharedPreferenceManager
                                          .readString(CachingKey.JOB_TITLE_ID),
                                      startMonth: await sharedPreferenceManager
                                          .readString(CachingKey.START_MONTH),
                                      startYear: await sharedPreferenceManager
                                          .readString(CachingKey.START_YEAR),
                                      endMonth: await sharedPreferenceManager
                                          .readString(CachingKey.END_MONTH),
                                      endYear: await sharedPreferenceManager
                                          .readString(CachingKey.END_YEAR),
                                      description: description_Controller.text,
                                      countryId: 1,
                                      address: "",
                                      createBy: "",
                                      jobRoleName:  await sharedPreferenceManager
                                          .readString(translator.activeLanguageCode =='ar' ?
                                      CachingKey.JOB_TITLE_NAME_AR : CachingKey.JOB_TITLE_NAME_EN),
                                      orgField: "",
                                      orgName: facility_Controller.text));
                                }else{
                                  Shared.profile_experiences!.add(ExperienceEntity(
                                  cityId: await sharedPreferenceManager.readInt(CachingKey.CITY_ID),
                                  provinceId: await sharedPreferenceManager.readInt(CachingKey.PROVINCE_ID),
                                  jobTitleId: await sharedPreferenceManager.readString(CachingKey.JOB_TITLE_ID),
                                  startMonth: await sharedPreferenceManager.readString(CachingKey.START_MONTH),
                                  startYear: await sharedPreferenceManager.readString(CachingKey.START_YEAR),
                                  endMonth: await sharedPreferenceManager.readString(CachingKey.END_MONTH),
                                  endYear: await sharedPreferenceManager.readString(CachingKey.END_YEAR),
                                  description: description_Controller.text,
                                  countryId: 1,
                                  address: "",
                                  createBy: "",
                                  jobRoleName:  await sharedPreferenceManager
                                      .readString(translator.activeLanguageCode =='ar' ?
                                  CachingKey.JOB_TITLE_NAME_AR : CachingKey.JOB_TITLE_NAME_EN),
                                  orgField: "",
                                  orgName: facility_Controller.text));
                                }

                                Navigator.pop(context);
                              },
                            )),
                      ],
                    )))));
  }
}
