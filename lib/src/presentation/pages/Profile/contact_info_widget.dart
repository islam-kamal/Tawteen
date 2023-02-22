import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Profile/educational_data_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';

class ContactInfoWidget extends StatelessWidget {
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
                                isContactInfo: true),
                              ),

                              Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                    child: Shared.text_widget(
                                        text: kmobilenumber.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width,
                                    child: CustomTextField(
                                      hint: knationalIdentificationNumber.tr(),
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      isMobile: true,
                                      errorMessage: kEnter_the_identity.tr(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kemail.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  Container(
                                    width: Shared.width ,
                                    child: CustomTextField(
                                      hint: kfirstName.tr(),
                                      alignment: translator.activeLanguageCode == 'ar'
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      isEmail: true,
                                      errorMessage: kEnter_the_identity.tr(),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kregion.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  CustomProvinceDropDown(
                                    hint: kregion.tr(),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                    child: Shared.text_widget(
                                        text: kcity.tr(),
                                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ),
                                  CustomCitiesDropDown(
                                    hint: kcity.tr(),
                                  ),


                                  Padding(
                                      padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                      child: CustomButtonWidget(
                                        button_text: kNext.tr(),
                                        width: Shared.width ,
                                        height: Shared.width * 0.13,
                                        onPress: () {
                                          customAnimatedPushNavigation(context, EductionalDataWidget());
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
/*    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:  profilePagesIndictor(context: context),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
              child: Shared.text_widget(
                  text: knationalIdentificationNumber.tr(),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            Container(
              width: Shared.width,
              child: CustomTextField(
                hint: knationalIdentificationNumber.tr(),
                alignment: translator.activeLanguageCode == 'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                isMobile: true,
                errorMessage: kEnter_the_identity.tr(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
              child: Shared.text_widget(
                  text: kfirstName.tr(),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            Container(
              width: Shared.width ,
              child: CustomTextField(
                hint: kfirstName.tr(),
                alignment: translator.activeLanguageCode == 'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                isEmail: true,
                errorMessage: kEnter_the_identity.tr(),
               ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
              child: Shared.text_widget(
                  text: klastname.tr(),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            CustomDropDown(
              hint: "الرياض",
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
              child: Shared.text_widget(
                  text: kdateofbirth.tr(),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            CustomDropDown(
              hint: "اختر المنطقة",
            ),


            Padding(
                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                child: CustomButtonWidget(
                  button_text: kNext.tr(),
                  width: Shared.width ,
                  height: Shared.width * 0.11,
                  onPress: () {},
                )),
          ],
        ));*/
  }
}
