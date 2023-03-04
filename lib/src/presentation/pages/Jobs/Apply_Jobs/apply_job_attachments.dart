import 'dart:io';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/domain/entities/resume_entity.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttachmentWidgetState();
  }

}
class AttachmentWidgetState extends State<AttachmentWidget> {
  List<ResumeEntity> resume_list = [
    ResumeEntity(title: "mohamed_ali_cv", selected: true, remove: () {}),
    ResumeEntity(title: "ahmed_khaled_cv", selected: false, remove: () {}),
    ResumeEntity(title: "osman_ibrahem_cv", selected: false, remove: () {}),
  ];

  final fileFormKey = GlobalKey<FormState>();
  var file_name = TextEditingController();
  bool upload_file_loading = false;
Attachment? attachment;
  @override
  void initState() {
    attachments_bloc.add(GetAllAttachmentsEvent(
      applicationId: "21",
      applicationTypeId: "3"
    ));
    super.initState();
  }
  String? seleted_resume_id = "1" ;
  String? seleted_certifications_id = "1" ;
  List<Attachment>? resumes_list = [];
  List<Attachment>? certifications_list = [];
  @override
  Widget build(BuildContext context) {
    resumes_list = [];
    certifications_list = [];
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
                          child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                        child: ApplyJobIndicator(
                            context: context,
                            isApplyJobInfo: true,
                            isApplyJobAttachment: true),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Shared.width * 0.06),
                          child: BlocBuilder(
                            bloc: attachments_bloc,
                            builder: (context,state){
                              if(state is Loading){
                                resumes_list = [];
                                 certifications_list = [];
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
                                            snapshot.data!.data!.forEach((element) {
                                              if(element.refIdType == 1){
                                                resumes_list!.add(element);
                                              }else{
                                                certifications_list!.add(element);
                                              }
                                            });
                                            return     Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: Shared.width * 0.02),
                                                      child: Shared.text_widget(
                                                          text: kresume.tr(),
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {

                                                          showModalBottomSheet(
                                                            isScrollControlled: true,
                                                            context: context,
                                                            isDismissible: false,
                                                            shape: OutlineInputBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(ScreenUtil.defaultSize.width * 0.1),
                                                                    topRight:Radius.circular( ScreenUtil.defaultSize.width * 0.1)
                                                                ),
                                                                borderSide: BorderSide(color: kWhiteColor)
                                                            ),
                                                            builder: (context) {
                                                              return  upload_attachment_bottom_sheet(
                                                                  document_type: "1"
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.add_circle,
                                                          color: kGreenColor,
                                                        ))
                                                  ],
                                                ),
                                                resumes_list!.isEmpty ? no_data_widget():     Container(
                                                  width: Shared.width,
                                                  child: ListView.builder(
                                                      itemCount: resumes_list!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                            padding: EdgeInsets.symmetric(vertical: 5),
                                                            child:   Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    border: Border.all(color: kInactiveColor)),
                                                                padding: EdgeInsets.symmetric(vertical: 10),
                                                                child:  Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 5,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                                          child: Text(resumes_list![index].title!),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: InkWell(
                                                                          onTap:  (){
                                                                            attachments_bloc.add(DeleteAttachmentEvent(
                                                                                attachmentId: resumes_list![index].id.toString()
                                                                            ));
                                                                          },
                                                                          child: Icon(
                                                                            Icons.delete_outlined,
                                                                            color: kRedColor,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: InkWell(
                                                                          onTap: (){
                                                                            setState(() {
                                                                              seleted_resume_id = resumes_list![index].id.toString();
                                                                            });
                                                                            sharedPreferenceManager.writeData(CachingKey.JOB_ID, resumes_list![index].filePath);
                                                                          },
                                                                          child: Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color: resumes_list![index].id.toString() == seleted_resume_id ? kGreenColor : kGreyColor,
                                                                          ),
                                                                        )),
                                                                  ],

                                                                )

                                                            )


                                                        );
                                                      }),
                                                ),


                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: Shared.width * 0.02),
                                                      child: Shared.text_widget(
                                                          text: kcertifications.tr(),
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 15)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          showModalBottomSheet(
                                                            isScrollControlled: true,
                                                            context: context,
                                                            isDismissible: false,
                                                            shape: OutlineInputBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(ScreenUtil.defaultSize.width * 0.1),
                                                                    topRight:Radius.circular( ScreenUtil.defaultSize.width * 0.1)
                                                                ),
                                                                borderSide: BorderSide(color: kWhiteColor)
                                                            ),
                                                            builder: (context) {
                                                              return  upload_attachment_bottom_sheet(
                                                                  document_type: "2"
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.add_circle,
                                                          color: kGreenColor,
                                                        ))
                                                  ],
                                                ),
                                                /*Container(
                                width: Shared.width,
                                child: ListView.builder(
                                    itemCount: resume_list.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: attachment_shape(
                                          title: resume_list[index].title,
                                          remove: (){

                                          },
                                          selected: resume_list[index].selected,
                                        ),
                                      );
                                    }),
                              ),*/
                                                resumes_list!.isEmpty ? no_data_widget():    Container(
                                                  width: Shared.width,
                                                  child: ListView.builder(
                                                      itemCount: certifications_list!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                            padding: EdgeInsets.symmetric(vertical: 5),
                                                            child:   Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    border: Border.all(color: kInactiveColor)),
                                                                padding: EdgeInsets.symmetric(vertical: 10),
                                                                child:  Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 5,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                                          child: Text(certifications_list![index].title!),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: InkWell(
                                                                          onTap:  (){
                                                                            attachments_bloc.add(DeleteAttachmentEvent(
                                                                                attachmentId:certifications_list![index].id.toString()
                                                                            ));
                                                                          },
                                                                          child: Icon(
                                                                            Icons.delete_outlined,
                                                                            color: kRedColor,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: InkWell(
                                                                          onTap: (){
                                                                            setState(() {
                                                                              seleted_certifications_id = certifications_list![index].id.toString();
                                                                            });
                                                                            sharedPreferenceManager.writeData(CachingKey.JOB_ID, certifications_list![index].filePath);
                                                                          },
                                                                          child: Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color: certifications_list![index].id.toString() == seleted_certifications_id ? kGreenColor : kGreyColor,
                                                                          ),
                                                                        )),
                                                                  ],

                                                                )

                                                            )


                                                        );
                                                      }),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: Shared.width * 0.1),
                                                    child: CustomButtonWidget(
                                                      button_text: kNext.tr(),
                                                      width: Shared.width,
                                                      height: Shared.width * 0.13,
                                                      onPress: () {
                                                        if(resumes_list!.isEmpty || certifications_list!.isEmpty){
                                                          Shared.showSnackBarView(
                                                              message:  kupload_rsumes_message,
                                                              error_status: true,
                                                              sigin_button: false
                                                          );
                                                        }else{
                                                          customAnimatedPushNavigation(
                                                              context, ReviewJobRequestWidget());
                                                        }

                                                      },
                                                    )),
                                              ],
                                            );
                                          }

                                      }
                                    });

                              }else if(state is ErrorLoading){
                                return no_data_widget(context: context);
                              }
                              return Container();
                            },
                          )
                         )
                    ],
                  )) //PersonalInfoWidget()
                      ),
                )),
          ),
        ),
      ),
    );
  }

  Widget attachment_shape({String? title, bool? selected, Function()? remove}) {
    return  Row(
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(title!),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: remove,
                child: Icon(
                  Icons.delete_outlined,
                  color: kRedColor,
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: remove,
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: selected! ? kGreenColor : kGreyColor,
                ),
              )),
        ],

    );
  }

  Widget upload_attachment_bottom_sheet({String? document_type}){
    return StatefulBuilder(builder: (context, setState)
    {
      return Container(
        height: Shared.width * 0.5,
        child: Center(
          child: upload_file_loading ? Shared.spinkit :  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Shared.width * 0.6,
                child: CustomTextField(
                  formKey: fileFormKey,
                  controller: file_name,
                  hint: kfacilityname.tr(),
                  lablel: kfacilityname.tr(),
                  alignment: translator.activeLanguageCode == 'ar'
                      ? TextAlign.right
                      : TextAlign.left,
                ),
              ),
              IconButton(
                icon: Icon(Icons.cloud_upload_sharp),
                onPressed: () async {

                  await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                  ).then((value) async {
                    print("result : ${value!.files}");
                    setState(() {
                      upload_file_loading = true;
                    });
                    await   attachment_repository.uploadAttachment(
                        title: file_name.text,
                        refId: "21",
                        // if document_type= 1 indicate that will upload resume if document_type= 2 indicate that will upload Certification
                        refIdType: "${document_type}",
                        refObj: "3",
                        subRefId: "0",
                        createAttachements:value.files
                    ).then((value){
                      print("value : ${value}");
                      setState(() {
                        if(value){
                          upload_file_loading = false;
                          Navigator.pop(context);
                          attachments_bloc.add(GetAllAttachmentsEvent(
                              applicationId: "21",
                              applicationTypeId: "3"
                          ));
                        }else{
                          upload_file_loading = false;
                        }

                      });
                    });
                  });


                },
              )
            ],
          ),
        ),
      );
    });

  }
}
