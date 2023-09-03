import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/domain/entities/document_entity.dart';
import 'package:code/src/domain/entities/initatives_upload_files_entity.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/bloc/Initatives_Bloc/initatives_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_screen.dart';
import 'package:file_picker/file_picker.dart';

class ApplyInitativeScreen extends StatefulWidget {
  InitativesDetails? initativesDetails;
  ApplyInitativeScreen({this.initativesDetails});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ApplyInitativeScreenState();
  }
}

class ApplyInitativeScreenState extends State<ApplyInitativeScreen> {
  final fileFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  var file_name = TextEditingController();
  var phone_controller = TextEditingController();
  var nationality_id_controller = TextEditingController();
  var fullname_controller = TextEditingController();
  bool upload_file_loading = false;
  var applicant_id;
  var nationality_id;
  var mobile_number;
  bool? upload_file_status = false;
  List<DocumentEntity> documents_list = [];
  List<PlatformFile>? files = [];
  List<InitativeUploadFilesEntity> initative_files = [];

  @override
  void initState() {
    widget.initativesDetails!.initiativeDocument!.forEach((element) {
      documents_list.add(DocumentEntity(
          status: false,
          fileName: element.fileName,
          initiativeId: element.initiativeId));
    });
    get_attachments();
    super.initState();
  }

  void get_attachments() async {
    await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID).then((value) {
      applicant_id = value.toString();
      print("applicant_id : ${applicant_id}");
    });
    fullname_controller.text = translator.activeLanguageCode == 'ar'
        ? "${ Shared.nafathInfoEntity!.arFirst!} ${Shared.nafathInfoEntity!.arFather!}"
        : "${ Shared.nafathInfoEntity!.enFirst!} ${Shared.nafathInfoEntity!.enFather!}";
    phone_controller.text = Shared.nafathInfoEntity!.phone.toString();
    nationality_id_controller.text =  Shared.nafathInfoEntity!.id.toString();
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
                context: context,
                icon: true,
                route: InitativesDetailsScreen(
                  iniatives_id:    widget.initativesDetails!.id.toString(),
                  previous_iniatives_status: false,
                  screen: InitativesScreen(),
                )),
            backgroundColor: kWhiteColor,
            body: BlocListener(
                bloc: initatives_bloc,
                listener: (context, state) async {
                  if (state is ApplyInitativeLoading) {
                    print("Loading");
                    Shared.showLoadingDialog(context: context);
                  }
                  else if (state is ApplyInitativeDone) {
                    print("Done");
                    Shared.dismissDialog(context: context);
                    customAnimatedPushNavigation(context, ThanksScreen());


                  }
                  else if (state is ApplyInitativeErrorLoading) {
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
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                child: Shared.text_widget(
                                    text: kfullname.tr(),
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              Container(
                                width: Shared.width,
                                child: CustomTextField(
                                  controller: fullname_controller,
                                  alignment: translator.activeLanguageCode == 'ar'
                                      ? TextAlign.right
                                      : TextAlign.left,
                              //    errorMessage: kEnter_full_name.tr(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                child: Shared.text_widget(
                                    text: knationalIdentificationNumber.tr(),
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              Container(
                                  width: Shared.width,
                                  child:  CustomTextField(
                                  formKey: formKey,
                                  controller: nationality_id_controller,
                                  alignment: translator.activeLanguageCode == 'ar' ?TextAlign.right : TextAlign.left,
                                  identity: true,
                           //       errorMessage: kEnter_the_identity.tr(),

                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

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
                               alignment: translator.activeLanguageCode == 'ar'
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  isMobile: true,
                             //     errorMessage: kEnter_the_phone_correctly.tr(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Shared.width * 0.02),
                                child: ListView.builder(
                                    itemCount: documents_list.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 6,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                                                child: Shared.text_widget(
                                                    text: widget.initativesDetails!.initiativeDocument![index].fileName.toString(),
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15)),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: initative_files.isEmpty ? IconButton(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled:
                                                      true,
                                                      context: context,
                                                      isDismissible: false,
                                                      shape: OutlineInputBorder(
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(
                                                                  ScreenUtil
                                                                      .defaultSize
                                                                      .width *
                                                                      0.1),
                                                              topRight: Radius
                                                                  .circular(ScreenUtil
                                                                  .defaultSize
                                                                  .width *
                                                                  0.1)),
                                                          borderSide: BorderSide(
                                                              color:
                                                              kWhiteColor)),
                                                      builder: (context) {
                                                        return upload_attachment_bottom_sheet(
                                                          document_type: "2",
                                                          index: index
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: kGreenColor,
                                                  ))
                                                  : documents_list[index].status! ? Icon(
                                                Icons.check_circle,
                                                color: kGreenColor,
                                              )
                                                  : IconButton(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled:
                                                      true,
                                                      context: context,
                                                      isDismissible: false,
                                                      shape: OutlineInputBorder(
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(
                                                                  ScreenUtil
                                                                      .defaultSize
                                                                      .width *
                                                                      0.1),
                                                              topRight: Radius
                                                                  .circular(ScreenUtil
                                                                  .defaultSize
                                                                  .width *
                                                                  0.1)),
                                                          borderSide: BorderSide(
                                                              color:
                                                              kWhiteColor)),
                                                      builder: (context) {
                                                        return upload_attachment_bottom_sheet(
                                                          document_type: "2",
                                                          index: index
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: kGreenColor,
                                                  ))),
                                        ],
                                      );
                                    }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Shared.width * 0.1),
                                      child: CustomButtonWidget(
                                        button_text: ksend.tr(),
                                        width: Shared.width * 0.4,
                                        height: Shared.width * 0.13,
                                        onPress: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                       //   if (formKey.currentState!.validate() ) {
                                          print("nationality_id_controller.text : ${nationality_id_controller.text}");
                                          print("phone_controller.text: ${phone_controller.text}");
                                          print("fullname_controller.text : ${fullname_controller.text}");
                                          if(initative_files.isNotEmpty && documents_list.isNotEmpty){
                                            initatives_bloc
                                                .add(ApplyInitativeEvent(
                                                phone: phone_controller.text,
                                                nationality_id: nationality_id_controller.text,
                                                fullname: fullname_controller.text,
                                                initstive_files: initative_files
                                            ));

                                          }else{
                                            Shared.showSnackBarView(
                                                error_status: true,
                                                message:  kupload_initative_files.tr(),
                                                sigin_button: false
                                            );
                                          }

                                        //  }

                                        },
                                      )),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Shared.width * 0.1),
                                      child: CustomButtonWidget(
                                        button_text: kcancel.tr(),
                                        width: Shared.width * 0.4,
                                        height: Shared.width * 0.13,
                                        color: kInactiveColor,
                                        onPress: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          customAnimatedPushNavigation(context, InitativesDetailsScreen(
                                            iniatives_id:    widget.initativesDetails!.id.toString(),
                                            previous_iniatives_status: false,
                                            screen: InitativesScreen(),
                                          ));
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        )


                      )) //PersonalInfoWidget()
                          ),
                    ))),
          ),
        ),
      ),
    );
  }

  Widget upload_attachment_bottom_sheet({String? document_type,int? index}) {
    return Container(
      height: Shared.width * 0.5,
      child: Column(
        children: [
         Row(
           children: [
            Padding(padding: EdgeInsets.symmetric(
                horizontal: Shared.width * 0.05,
            vertical: Shared.width * 0.05),child:  CircleAvatar(
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
            ),)
           ],
         ),
          Center(
            child: upload_file_loading
                ? Shared.spinkit
                : Column(
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
                    upload_file_loading = true;
                    await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    ).then((value) async {
                    //  print("result : ${value!.files}");
                      setState(() {
                        upload_file_loading = false;
                      });
                    //  print("value : ${value}");
                      if(value != null)
                      initative_files.add(InitativeUploadFilesEntity(
                        filename: file_name.text,
                        files: value.files,
                      )
                      );
                      documents_list[index!].status = true;
                      setState(() {

                      });

                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ),
          ),
        ],
      )

    );
  }

}

