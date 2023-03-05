import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/bloc/Initatives_Bloc/initatives_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
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
  var file_name = TextEditingController();
  bool upload_file_loading = false;
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
                  iniatives_id: widget.initativesDetails!.id.toString(),
                  screen: InitativesDetailsScreen(),
                )),
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
                          child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Shared.text_widget(
                              text: kfullname.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                        Container(
                          width: Shared.width,
                          child: CustomTextField(
                            alignment: translator.activeLanguageCode == 'ar'
                                ? TextAlign.right
                                : TextAlign.left,
                            errorMessage: kEnter_full_name.tr(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.03),
                          child: Shared.text_widget(
                              text: knationalIdentificationNumber.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                        Container(
                          width: Shared.width,
                          child: CustomTextField(
                            alignment: translator.activeLanguageCode == 'ar'
                                ? TextAlign.right
                                : TextAlign.left,
                            errorMessage: kEnter_the_identity.tr(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.02),
                          child: Shared.text_widget(
                              text: kmobilenumber.tr(),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                        Container(
                          width: Shared.width,
                          child: CustomTextField(
                            alignment: translator.activeLanguageCode == 'ar'
                                ? TextAlign.right
                                : TextAlign.left,
                            isMobile: true,
                            errorMessage: kEnter_the_phone_correctly.tr(),
                          ),
                        ),



                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Shared.width * 0.02),
                          child: ListView.builder(
                              itemCount: widget.initativesDetails!.initiativeDocument!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Shared.width * 0.02),
                                      child: Shared.text_widget(
                                          text: widget
                                              .initativesDetails!
                                              .initiativeDocument![index]
                                              .fileName
                                              .toString(),
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                    upload_file_loading
                                        ? Icon(
                                            Icons.check_circle,
                                            color: kGreenColor,
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                isDismissible: false,
                                                shape: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(ScreenUtil
                                                                    .defaultSize
                                                                    .width *
                                                                0.1),
                                                        topRight: Radius
                                                            .circular(ScreenUtil
                                                                    .defaultSize
                                                                    .width *
                                                                0.1)),
                                                    borderSide: BorderSide(
                                                        color: kWhiteColor)),
                                                builder: (context) {
                                                  return upload_attachment_bottom_sheet(
                                                      document_type: "2");
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.add_circle,
                                              color: kGreenColor,
                                            ))
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
                                    initatives_bloc.add(ApplyInitativeEvent());
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
                                    Navigator.pop(context);
                                  },
                                )),
                          ],
                        )
                      ],
                    ),
                  )) //PersonalInfoWidget()
                      ),
                )),
          ),
        ),
      ),
    );
  }

  Widget upload_attachment_bottom_sheet({String? document_type}) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        height: Shared.width * 0.5,
        child: Center(
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
                          await attachment_repository
                              .uploadAttachment(
                                  title: file_name.text,
                                  refId: await sharedPreferenceManager.readString(CachingKey.APPLICANT_ID),
                                  // if document_type= 1 indicate that will upload resume if document_type= 2 indicate that will upload Certification
                                  refIdType: "${document_type}",
                                  refObj: "3",
                                  subRefId: "0",
                                  createAttachements: value.files)
                              .then((value) {
                            print("value : ${value}");
                            setState(() async {
                              if (value) {
                                upload_file_loading = false;
                                Navigator.pop(context);

                              } else {
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
