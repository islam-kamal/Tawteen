import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/models/InitativesModel/previous_initative_details_model.dart';
import 'package:code/src/data/models/InitativesModel/previous_initatives_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/domain/entities/document_entity.dart';
import 'package:code/src/domain/entities/initatives_upload_files_entity.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/bloc/Initatives_Bloc/initatives_bloc.dart';
import 'package:code/src/presentation/bloc/Previous_Initatives_Bloc/previous_initatives_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/previous_initatives_screen.dart';
import 'package:file_picker/file_picker.dart';

class UpdateAppliedInitativeScreen extends StatefulWidget {
  String? previous_iniative_id;
  UpdateAppliedInitativeScreen({this.previous_iniative_id});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UpdateAppliedInitativeScreenState();
  }
}

class UpdateAppliedInitativeScreenState
    extends State<UpdateAppliedInitativeScreen> {
  final fileFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  var file_name = TextEditingController();
  var phone_controller = TextEditingController();
  var nationality_id_controller = TextEditingController();
  var fullname_controller = TextEditingController();
  bool upload_file_loading = false;


  @override
  void initState() {
    previousInitativesBloc.add(GetPreviousInitativeDtailsEvent(
        iniatives_id: widget.previous_iniative_id!));

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBarWidget.appBarWidget(
                context: context, icon: true, route: PreviousIntativesScreen()),
            backgroundColor: kWhiteColor,
            body: BlocListener(
                bloc: initatives_bloc,
                listener: (context, state) async {
                  if (state is UpdateAppliedInitativeLoading) {
                    print("Loading");
                    Shared.showLoadingDialog(context: context);
                  }
                  else if (state is UpdateAppliedInitativeDone) {
                    print("Done");
                    Shared.dismissDialog(context: context);
                    customAnimatedPushNavigation(context, ThanksScreen());
                  }
                  else if (state is UpdateAppliedInitativeErrorLoading) {
                    print("ErrorLoading : ${state.message}");
                    Shared.dismissDialog(context: context);
                    Shared.showSnackBarView(
                        error_status: true,
                        backend_message: state.message,
                        sigin_button: false);
                  }
                },
                child: Container(
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
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Shared.width * 0.06),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Shared.width * 0.02),
                                          child: BlocBuilder(
                                            bloc: previousInitativesBloc,
                                            builder: (context, state) {
                                              if (state is Loading) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    top: Shared.width * 0.1,
                                                  ),
                                                  child: Center(
                                                      child: Shared.spinkit),
                                                );
                                              }
                                              else if (state is Done) {
                                                return StreamBuilder<PreviousIntativeDetailsModel>(
                                                    stream: previousInitativesBloc.previous_initative_details_subject,
                                                    builder: (context, snapshot) {
                                                      switch (snapshot.connectionState) {
                                                        case ConnectionState.none:
                                                          return Padding(
                                                            padding: EdgeInsets.only(
                                                              top: Shared.width * 0.1,
                                                            ),
                                                            child: Center(child: Shared.spinkit),
                                                          );
                                                        case ConnectionState.done:
                                                          return Container();
                                                        case ConnectionState.waiting:
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top:
                                                                  Shared.width *
                                                                      0.1,
                                                            ),
                                                            child: Center(
                                                                child: Shared
                                                                    .spinkit),
                                                          );
                                                        case ConnectionState.active:
                                                          if (snapshot.hasError) {
                                                            return Center(
                                                              child: Text(snapshot
                                                                  .error
                                                                  .toString()),
                                                            );
                                                          }
                                                          else {
                                                            fullname_controller.text = snapshot.data!.data![0].fullName!;
                                                            nationality_id_controller.text = snapshot.data!.data![0].noId.toString();
                                                            phone_controller.text =  snapshot.data!.data![0].phone!;
                                                            return Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
                                                                  child: Shared.text_widget(text: kfullname.tr(), textStyle: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                          fontSize: 15)),
                                                                ),
                                                                Container(
                                                                  width: Shared.width,
                                                                  child: CustomTextField(
                                                                    controller: fullname_controller,
                                                                   // hint: snapshot.data!.data![0].fullName,
                                                                    isEditable: false,
                                                                    alignment: translator.activeLanguageCode == 'ar'
                                                                        ? TextAlign.right : TextAlign.left,
                                                                    errorMessage:
                                                                        kEnter_full_name
                                                                            .tr(),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          Shared.width *
                                                                              0.03),
                                                                  child: Shared.text_widget(
                                                                      text: knationalIdentificationNumber
                                                                          .tr(),
                                                                      textStyle: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              15)),
                                                                ),
                                                                CustomTextField(
                                                                  formKey: formKey,
                                                             //     hint: snapshot.data!.data![0].noId.toString(),
                                                                  controller: nationality_id_controller,
                                                                  isEditable: false,
                                                                  alignment: translator.activeLanguageCode ==
                                                                          'ar'
                                                                      ? TextAlign
                                                                          .right
                                                                      : TextAlign
                                                                          .left,
                                                                  identity:
                                                                      true,
                                                                  errorMessage:
                                                                      kEnter_the_identity
                                                                          .tr(),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          Shared.width *
                                                                              0.02),
                                                                  child: Shared.text_widget(
                                                                      text: kmobilenumber
                                                                          .tr(),
                                                                      textStyle: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              15)),
                                                                ),
                                                                Container(
                                                                  width: Shared.width,
                                                                  child: CustomTextField(
                                                                    controller: phone_controller,
                                                              //      hint: snapshot.data!.data![0].phone,
                                                                    isEditable: false,
                                                                    alignment: translator.activeLanguageCode == 'ar'
                                                                        ? TextAlign.right
                                                                        : TextAlign.left,
                                                                    isMobile: true,
                                                                    errorMessage: kEnter_the_phone_correctly.tr(),
                                                                  ),
                                                                ),

                                                                snapshot.data!.data![0].attachments!.isEmpty ? Container()
                                                                    :  Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical: Shared.width * 0.03),
                                                                      child: Shared.text_widget(
                                                                          text: kattachments.tr(),
                                                                          textStyle: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15)),
                                                                    ),
                                                                /*    InkWell(
                                                                      onTap: () {

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
                                                                              id: snapshot.data!.data![0].id.toString()
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add_circle,
                                                                        color: kGreenColor,
                                                                      ),
                                                                    )*/
                                                                  ],
                                                                ),

                                                                Container(
                                                                  width: Shared.width,
                                                                  child: ListView.builder(
                                                                          itemCount: snapshot.data!.data![0].attachments!.length,
                                                                          shrinkWrap: true,
                                                                          physics: NeverScrollableScrollPhysics(),
                                                                          itemBuilder: (context, index) {
                                                                            print("snapshot.data!.data! : ${snapshot.data!.data![0].toJson()}");
                                                                            return Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Expanded(
                                                                                        flex: 4,
                                                                                        child: Container(
                                                                                            padding: EdgeInsets.symmetric(vertical: 10),
                                                                                            child: Row(
                                                                                              children: [
                                                                                              Expanded(
                                                                                              flex: 1,
                                                                                              child: Icon(
                                                                                                  Icons.attach_file,
                                                                                                  color: kBlackColor,
                                                                                              )),
                                                                                            Expanded(
                                                                                              flex: 9,
                                                                                              child:  Padding(
                                                                                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                                                                                  child: Text("${snapshot.data!.data![0].attachments![index].title} - ${snapshot.data!.data![0].attachments![index].fileName}",
                                                                                                  maxLines: 3,),
                                                                                              )    )
                                                                                              ],
                                                                                            ))),
                                                                                    Expanded(
                                                                                        flex: 1,
                                                                                        child: Align(

                                                                                          child: InkWell(
                                                                                            onTap: () {
                                                                                          /*    attachments_bloc.add(
                                                                                                  DeleteAttachmentEvent(attachmentId: snapshot.data!.data![0]
                                                                                                      .attachments![index].id.toString(),
                                                                                                  attachmentInitative: true,
                                                                                                    previous_iniative_id: widget.previous_iniative_id!
                                                                                                  ));*/

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
                                                                                                      id: snapshot.data!.data![0].attachments![index].refId.toString(),
                                                                                                    attachment_id: snapshot.data!.data![0].attachments![index].id.toString()
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child:  Image.asset(
                                                                                              ImageAssets.editIcon,
                                                                                              height: 15,
                                                                                              color: kYellowColor,
                                                                                            )
                                                                                          ),
                                                                                          alignment: translator.activeLanguageCode == 'ar'?
                                                                                          Alignment.centerLeft : Alignment.centerRight,
                                                                                        )),
                                                                                  ],
                                                                                ),
                                                                                Divider()
                                                                              ],
                                                                            );
                                                                          }),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                            Shared.width * 0.1),
                                                                        child: CustomButtonWidget(
                                                                          button_text: kupdate.tr(),
                                                                          width: Shared.width * 0.4,
                                                                          height: Shared.width * 0.13,
                                                                          onPress: () {
                                                                            customAnimatedPushNavigation(context, PreviousIntativesScreen());
                                                                          },
                                                                        )),
                                                                    Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                            Shared.width * 0.1),
                                                                        child: CustomButtonWidget(
                                                                          button_text: kcancel.tr(),
                                                                          width: Shared.width * 0.4,
                                                                          height: Shared.width * 0.13,
                                                                          color: kInactiveColor,
                                                                          onPress: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        )),
                                                                  ],
                                                                )
                                                              ],
                                                            );
                                                          }
                                                      }
                                                    });
                                              }
                                              else if (state is ErrorLoading) {
                                                return no_data_widget(context: context);
                                              }
                                              return Container();
                                            },
                                          ),
                                        ),

                                      ],
                                    ),
                                  ))) //PersonalInfoWidget()
                          ),
                    ))),
          ),
        ),
      ),
    );
  }

  Widget upload_attachment_bottom_sheet({String? id , String? attachment_id}){
    return StatefulBuilder(builder: (context, setState)
    {
      return  Container(
          height: Shared.width * 0.5,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Shared.width * 0.05,
                        vertical: Shared.width * 0.05),
                    child: CircleAvatar(
                      radius: Shared.width / 20,
                      backgroundColor: kGreyColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: kWhiteColor,
                          size: Shared.width / 17,
                        ),
                        onPressed: () {
                          Navigator.pop(context);

                          upload_file_loading = false;
                        },
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: upload_file_loading ? Shared.spinkit :  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Shared.width * 0.6,
                      child: CustomTextField(
                        formKey: fileFormKey,
                        controller: file_name,
                        hint: kfile_name.tr(),
                        lablel: kfile_name.tr(),
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
                          allowedExtensions: [ 'pdf'],

                        ).then((value) async {
                          print("result : ${value!.files}");
                          setState(() {
                            upload_file_loading = true;
                          });
                          await   attachment_repository.updateInitativeAttachment(
                              title: file_name.text,
                              refId: id.toString(),
                              // if document_type= 1 indicate that will upload resume if document_type= 2 indicate that will upload Certification
                              refIdType: "3",
                              refObj: "9",
                              subRefId: "0",
                              createAttachements:value.files,
                              attachmentId: attachment_id.toString()
                          ).then((value){
                            print("value : ${value}");
                            setState(()  {
                              if(value){
                                upload_file_loading = false;
                                Navigator.pop(context);
                                previousInitativesBloc.add(GetPreviousInitativeDtailsEvent(
                                    iniatives_id: widget.previous_iniative_id!));
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
            ],
          )

      );
    });

  }
}


