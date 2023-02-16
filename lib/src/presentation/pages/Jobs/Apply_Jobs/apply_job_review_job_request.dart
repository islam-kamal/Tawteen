import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Profile/personal_info_widget.dart';
import 'package:code/src/presentation/widgets/custom_skills_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:provider/provider.dart';


class ReviewJobRequestWidget extends StatelessWidget {


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
                                child:  ApplyJobIndicator(
                                    context: context,
                                    isApplyJobInfo: true,
                                    isApplyJobAttachment: true,
                                    isApplyJobReviewRequest: true),
                              ),

                           Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                           child: Column(
                             children: [
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                 child: Shared.text_widget(
                                     text: kname.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),
                               Container(
                                 width: Shared.width,
                                 child: CustomTextField(
                                   hint: kfirstName.tr(),
                                   alignment: translator.activeLanguageCode == 'ar'
                                       ? TextAlign.right
                                       : TextAlign.left,
                                   errorMessage: kEnter_the_identity.tr(),
                                   isEditable: false,
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                 child: Shared.text_widget(
                                     text: kmobilenumber.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),
                               Container(
                                 width: Shared.width,
                                 child: CustomTextField(
                                   hint: kmobilenumber.tr(),
                                   alignment: translator.activeLanguageCode == 'ar'
                                       ? TextAlign.right
                                       : TextAlign.left,
                                   isMobile: true,
                                   isEditable: false,
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
                                   hint: kemail.tr(),
                                   alignment: translator.activeLanguageCode == 'ar'
                                       ? TextAlign.right
                                       : TextAlign.left,
                                   isEmail: true,
                                   isEditable: false,
                                   errorMessage: kEnter_the_identity.tr(),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                 child: Shared.text_widget(
                                     text: kcity.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),
                               CustomDropDown(
                                 hint: "الرياض",
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                 child: Shared.text_widget(
                                     text: kattachments.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),
                               Container(
                                 width: Shared.width ,
                                 child:  ListView.builder(
                                     itemCount: 3,
                                     shrinkWrap: true,
                                     itemBuilder: (context, index){

                                       return Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                         child:  attachment(

                                         ),);
                                     }),
                               ),

                               Padding(
                                   padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                   child: CustomButtonWidget(
                                     button_text: ksend.tr(),
                                     width: Shared.width,
                                     height: Shared.width * 0.13,
                                     onPress: () {
                                     customAnimatedPushNavigation(context, ThanksScreen());

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

  Widget attachment(){
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kInactiveColor)
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(Icons.attach_file,color: kBlackColor,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text("certificate.pdf"),)
          ],
        )
    );
  }
}
