import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Authentiaction/SignUp/signup_contact_info_widget.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:code/src/presentation/widgets/signup_pages_indicator.dart';
import 'package:code/src/presentation/widgets/unathorized_user_widget.dart';
class SignUpPersonalInfoWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpPersonalInfoWidgetState();
  }

}
class SignUpPersonalInfoWidgetState extends State<SignUpPersonalInfoWidget> {


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
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                            Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                                  child:  SignUpPagesIndictor(context: context,),
                                ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                              child: Shared.text_widget(
                                  text: knationalIdentificationNumber.tr(),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Container(
                              width: Shared.width,
                              child: CustomTextField(
                                hint: Shared.nafathInfoEntity!.id!.toString(),
                                alignment: translator.activeLanguageCode == 'ar'
                                    ? TextAlign.right
                                    : TextAlign.left,
                                isEditable: false,
                                errorMessage: kEnter_the_identity.tr(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                              child: Shared.text_widget(
                                  text: kfirstName.tr(),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Container(
                              width: Shared.width,
                              child: CustomTextField(
                                hint: translator.activeLanguageCode == 'ar' ?
                                Shared.nafathInfoEntity!.arFirst!.toString() :  Shared.nafathInfoEntity!.enFirst!.toString(),
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
                                hint: translator.activeLanguageCode == 'ar' ?
                                Shared.nafathInfoEntity!.arFather!.toString() :  Shared.nafathInfoEntity!.enFather!.toString(),

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
                                  text: kdateofbirth.tr(),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Container(
                              width: Shared.width,
                              child: CustomTextField(
                                hint: Shared.nafathInfoEntity!.dobG.toString(),
                                alignment: translator.activeLanguageCode == 'ar'
                                    ? TextAlign.right
                                    : TextAlign.left,
                                errorMessage: kEnter_the_identity.tr(),
                                isEditable: false,
                                sufficIcon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: kGreenColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                              child: Shared.text_widget(
                                  text: kgender.tr(),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                            Container(
                              width: Shared.width,
                              child: CustomTextField(
                                hint: Shared.nafathInfoEntity!.gender == "M"? kmale.tr() : kfemale.tr(),
                                alignment: translator.activeLanguageCode == 'ar'
                                    ? TextAlign.right
                                    : TextAlign.left,
                                errorMessage: kEnter_the_identity.tr(),
                                isEditable: false,
                                sufficIcon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: kGreenColor,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                child: CustomButtonWidget(
                                  button_text: kNext.tr(),
                                  width: Shared.width,
                                  height: Shared.width * 0.13,
                                  onPress: () {
                                    customAnimatedPushNavigation(context, SignUpContactInfoWidget());
                                  },
                                )),
                          ],
                        )
                      )

                            ],
                          )
                      )//PersonalInfoWidget()
                  ),

                )),
          ),

        ),
      ),
    );

  }
}
