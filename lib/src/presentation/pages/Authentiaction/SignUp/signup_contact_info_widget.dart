import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Authentiaction/SignUp/signup_educational_data_widget.dart';
import 'package:code/src/presentation/pages/Profile/profile_educational_data_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:code/src/presentation/widgets/signup_pages_indicator.dart';
import 'package:email_validator/email_validator.dart';

class SignUpContactInfoWidget extends StatelessWidget {
  var phone_controller = TextEditingController();
  var email_controller = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

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
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Form(
                              key: signupFormKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Shared.width * 0.06),
                                    child: SignUpPagesIndictor(
                                        context: context,
                                        isPersonalData: true,
                                        isContactInfo: true),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Shared.width * 0.06),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02),
                                          child: Shared.text_widget(
                                              text: kmobilenumber.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: phone_controller,
                                            hint: kmobilenumber.tr(),
                                            formKey: signupFormKey,
                                            alignment:
                                                translator.activeLanguageCode ==
                                                        'ar'
                                                    ? TextAlign.right
                                                    : TextAlign.left,
                                            isMobile: true,
                                            errorMessage:
                                                kEnter_the_phone_correctly.tr(),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kemail.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          width: Shared.width,
                                          child: CustomTextField(
                                            controller: email_controller,
                                            formKey: signupFormKey,
                                            hint: kemail.tr(),
                                            alignment:
                                                translator.activeLanguageCode ==
                                                        'ar'
                                                    ? TextAlign.right
                                                    : TextAlign.left,
                                            isEmail: true,
                                            errorMessage:
                                                kEnter_email_correctly.tr(),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kregion.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomProvinceDropDown(
                                          hint: kregion.tr(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kcity.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomCitiesDropDown(
                                          hint: kcity.tr(),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Shared.width * 0.1),
                                            child: CustomButtonWidget(
                                              button_text: kNext.tr(),
                                              width: Shared.width,
                                              height: Shared.width * 0.13,
                                              onPress: () {
                                                if (signupFormKey.currentState!
                                                        .validate() && validateInputs(context, ctx: context)) {
                                                  sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, phone_controller.text);
                                                  sharedPreferenceManager.writeData(CachingKey.EMAIL, email_controller.text);
                                                  customAnimatedPushNavigation(
                                                      context,
                                                      SignUpEductionalDataWidget ());
                                                }
                                              },
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ))) //PersonalInfoWidget()
                      ),
                )),
          ),
        ),
      ),
    );
  }

  bool validateInputs(BuildContext context,
      {var scaffoldKey, required var ctx}) {
    if (!EmailValidator.validate(email_controller.text)) {
      Shared.showSnackBarView(
          error_status: true,
          message: kEnter_email_correctly,
          sigin_button: false
          );
      return false;
    }

    return true;
  }
}
