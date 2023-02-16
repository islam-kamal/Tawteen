import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/resume_entity.dart';
import 'package:flutter/material.dart';

class AttachmentWidget extends StatelessWidget {
  List<ResumeEntity> resume_list = [
    ResumeEntity(
      title: "mohamed_ali_cv",
      selected: true,
      remove: (){

      }
    ),
    ResumeEntity(
        title: "ahmed_khaled_cv",
        selected: false,
        remove: (){

        }
    ),
    ResumeEntity(
        title: "osman_ibrahem_cv",
        selected: false,
        remove: (){

        }
    ),
  ];
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
                                    isApplyJobAttachment: true),
                              ),

                            Padding(padding: EdgeInsets.symmetric(horizontal:  Shared.width * 0.06),
                            child:  Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                      child: Shared.text_widget(
                                          text: kresume.tr(),
                                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ),
                                  IconButton(onPressed: (){

                                        }, icon: Icon(Icons.add_circle,color: kGreenColor,))

                                  ],
                                ),
                                Container(
                                  width: Shared.width ,
                                  child:  ListView.builder(
                                      itemCount: resume_list.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index){

                                        return Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                          child:  attachment_shape(
                                            title: resume_list[index].title,
                                            remove: resume_list[index].remove,
                                            selected:resume_list[index].selected,
                                          ),);
                                      }),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                      child: Shared.text_widget(
                                          text: kcertifications.tr(),
                                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                    ),
                                   IconButton(onPressed: (){

                                        }, icon: Icon(Icons.add_circle,color: kGreenColor,))

                                  ],
                                ),
                                Container(
                                  width: Shared.width ,
                                  child:  ListView.builder(
                                      itemCount: resume_list.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index){

                                        return Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                          child:  attachment_shape(
                                            title: resume_list[index].title,
                                            remove: resume_list[index].remove,
                                            selected:resume_list[index].selected,
                                          ),);
                                      }),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                    child: CustomButtonWidget(
                                      button_text: kNext.tr(),
                                      width: Shared.width ,
                                      height: Shared.width * 0.13,
                                      onPress: () {
                                        customAnimatedPushNavigation(context, ReviewJobRequestWidget());
                                      },
                                    )),
                              ],
                            ))
                            ],
                          )) //PersonalInfoWidget()
                  ),

                )),
          ),

        ),
      ),
    );

  }

  Widget attachment_shape({String? title , bool? selected, Function()? remove}){
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kInactiveColor)
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(title!),
              )
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: remove,
                child: Icon(Icons.delete_outlined,color: kRedColor,),
              )
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: remove,
                child: Icon(Icons.check_circle_outline_rounded,
                  color:selected! ? kGreenColor : kGreyColor,),
              )
          ),
        ],
      ),
    );
  }
}