import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_attachments.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';

class ApplyJobPersonInfo extends StatefulWidget{
  Widget? route;
  ApplyJobPersonInfo({this.route});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ApplyJobPersonInfoState();
  }

}

class ApplyJobPersonInfoState extends State<ApplyJobPersonInfo>{


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
                icon:  true,
              route: widget.route
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
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.06,horizontal: 0),
                                child:  ApplyJobIndicator(context: context,),
                              ),

                              Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                              child: Column(
                                children: [

                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kfirstName.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width,
                                    child: CustomTextField(
                                      hint:translator.activeLanguageCode == 'ar'?
                                      Shared.nafathInfoEntity!.arFirst!.toString() :  Shared.nafathInfoEntity!.enFirst!.toString() ,
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      errorMessage: kEnter_the_identity.tr(),
                                      isEditable: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: klastname.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width,
                                    child: CustomTextField(
                                      hint:translator.activeLanguageCode == 'ar'?
                                      Shared.nafathInfoEntity!.arFamily!.toString() :  Shared.nafathInfoEntity!.enFamily!.toString() ,

                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      errorMessage: kEnter_the_identity.tr(),
                                      isEditable: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kmobilenumber.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width,
                                    child: CustomTextField(
                                      hint: Shared.nafathInfoEntity!.phone.toString(),
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      isMobile: true,
                                      isEditable: false,
                                      errorMessage: kEnter_the_phone_correctly.tr(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kemail.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width ,
                                    child: CustomTextField(
                                      hint: Shared.nafathInfoEntity!.email.toString(),
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      isEmail: true,
                                      isEditable: false,
                                      errorMessage: kEnter_email_correctly.tr(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kcity.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                             /*     CustomCitiesDropDown(
                                    hint: kcity.tr(),
                                    select_city_status: true,
                                  ),*/
                                  Container(
                                    width: Shared.width ,
                                    child: CustomTextField(
                                      hint:translator.activeLanguageCode == "ar" ? Shared.nafathInfoEntity!.city_name_ar:  Shared.nafathInfoEntity!.city_name_en,
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      isEmail: true,
                                      isEditable: false,
                                      errorMessage: kEnter_email_correctly.tr(),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                      child: CustomButtonWidget(
                                        button_text: kNext.tr(),
                                        width: Shared.width,
                                        height: Shared.width * 0.13,
                                        onPress: () {
                                          customAnimatedPushNavigation(context, AttachmentWidget(
                                            route: widget.route,
                                          ));
                                        },
                                      )),
                                ],
                              ),)
                            ],
                          ))//PersonalInfoWidget()
                  ),

                )),
          ),

        ),
      ),
    );
  }

}