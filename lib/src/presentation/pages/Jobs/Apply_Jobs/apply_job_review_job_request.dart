import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/apply_job_bloc.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_attachments.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:provider/provider.dart';

class ReviewJobRequestWidget extends StatefulWidget{
  Widget? route;
  ReviewJobRequestWidget({this.route});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReviewJobRequestWidgetState();
  }

}
class ReviewJobRequestWidgetState extends State<ReviewJobRequestWidget> {

  @override
  void initState() {
    get_attachments();
    super.initState();
  }
  void get_attachments()async{
    await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID).then((value){
      attachments_bloc.add(GetAllAttachmentsEvent(
          applicationId: value.toString(),
          applicationTypeId: "3"
      ));
    });

  }
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
                icon: true,
                route: AttachmentWidget(
                  route: widget.route,
                )
            ),
            backgroundColor: kWhiteColor,
            body: BlocListener(
            bloc: apply_job_bloc,
            listener: (context, state) {
            if(state is ApplyJobLoading){
            Shared.showLoadingDialog(context: context);
            }
            else if(state is ApplyJobDone){
            Shared.dismissDialog(context: context);

            customAnimatedPushNavigation(context, ThanksScreen());

            }
            else if(state is ApplyJobErrorLoading){
            Shared.dismissDialog(context: context);
            Shared.showSnackBarView(
                error_status: true,
                backend_message:  state.message,
                sigin_button: false
            );
            }
            },
            child:  Container(
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

                           Padding(
                             padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
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
                                   hint:translator.activeLanguageCode == 'ar'?
                                   "${Shared.nafathInfoEntity!.arFirst!.toString()} ${Shared.nafathInfoEntity!.arFather!.toString()}" :   "${Shared.nafathInfoEntity!.enFirst!.toString()} ${Shared.nafathInfoEntity!.enFather!.toString()}" ,

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
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
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
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                 child: Shared.text_widget(
                                     text: kcity.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),
                         /*      CustomCitiesDropDown(
                                 hint: kcity.tr(),
                                 select_city_status: true,
                               ),*/
                               Container(
                                 width: Shared.width ,
                                 child: CustomTextField(
                                   hint:translator.activeLanguageCode == "ar" ? Shared.applicant_city_ar ?? Shared.nafathInfoEntity!.city_name_ar
                                       : Shared.applicant_city_en?? Shared.nafathInfoEntity!.city_name_en,
                                   alignment: translator.activeLanguageCode == 'ar'
                                       ? TextAlign.right
                                       : TextAlign.left,
                                   isEmail: true,
                                   isEditable: false,
                                //   errorMessage: kEnter_email_correctly.tr(),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                 child: Shared.text_widget(
                                     text: kattachments.tr(),
                                     textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                               ),

                               BlocBuilder(
                                 bloc: attachments_bloc,
                                 builder: (context,state){
                                   if(state is Loading){
                                     return Padding(
                                       padding: EdgeInsets.only(top: Shared.width * 0.1, ),
                                       child: Center(
                                           child: Shared.spinkit
                                       ),
                                     );
                                   }else if(state is Done){
                                     return StreamBuilder<AttachmentModel>(
                                         stream: attachments_bloc.all_attachments_subject,
                                         builder: (context,snapshot){

                                           switch (snapshot.connectionState) {
                                             case ConnectionState.none:
                                               return Padding(
                                                 padding: EdgeInsets.only(top:Shared.width * 0.1, ),
                                                 child: Center(
                                                     child: Shared.spinkit
                                                 ),
                                               );
                                             case ConnectionState.done:
                                               return Text('');
                                             case ConnectionState.waiting:
                                               return Padding(
                                                 padding: EdgeInsets.only(top:Shared.width * 0.1, ),
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
                                                 return  Container(
                                                   width: Shared.width,
                                                   child: ListView.builder(
                                                       itemCount: snapshot.data!.data!.length,
                                                       shrinkWrap: true,
                                                       physics: NeverScrollableScrollPhysics(),
                                                       itemBuilder: (context, index) {
                                                         return Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                                         child: attachment(
                                                             title:  "${snapshot.data!.data![index].title} - ${snapshot.data!.data![index].fileName}"
                                                         ),);
                                                       }),
                                                 );
                                               }

                                           }
                                         });

                                   }else if(state is ErrorLoading){
                                     return no_data_widget(context: context);
                                   }
                                   return Container();
                                 },
                               ),

         /*                      Container(
                                 width: Shared.width,
                                 child: ListView.builder(
                                     itemCount: Shared.job_review_attachments_list.length,
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemBuilder: (context, index) {
                                       return attachment(
                                           title:  Shared.job_review_attachments_list[index]
                                       );
                                     }),
                               ),*/

                               Padding(
                                   padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                   child: CustomButtonWidget(
                                     button_text: ksend.tr(),
                                     width: Shared.width,
                                     height: Shared.width * 0.13,
                                     onPress: () {
                                       apply_job_bloc.add(ApplyJobEvent());
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
      )   );

  }

  Widget attachment({String? title}){
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kInactiveColor)
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(Icons.attach_file,color: kBlackColor,),),
        Expanded(
          flex: 9,
          child:  Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text("${title}",
            maxLines: 5,),))
          ],
        )
    );
  }
}
