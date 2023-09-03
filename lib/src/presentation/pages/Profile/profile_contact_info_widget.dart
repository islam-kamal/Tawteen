import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/bloc/Experience_Bloc/experience_bloc.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:code/src/presentation/pages/Profile/profile_educational_data_widget.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class ProfileContactInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileContactInfoWidgetState();
  }
}

class ProfileContactInfoWidgetState extends State<ProfileContactInfoWidget> {
  var phone_controller = TextEditingController();
  var email_controller = TextEditingController();
  final profileFormKey = GlobalKey<FormState>();
  final fileFormKey = GlobalKey<FormState>();
  var file_name = TextEditingController();
  bool upload_file_loading = false;
  List<Attachment>? resumes_list = [];
  var applicant_id;

  @override
  void initState() {
    get_attachments();
    experienceBloc.add(GetExperienceEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectProvinceProvider =
        Provider.of<SelectProvinceProvider>(context, listen: false);
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
                route: ProfilePersonalInfoWidget()),
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
                              key: profileFormKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Shared.width * 0.06),
                                    child: profilePagesIndictor(
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
                                              vertical: Shared.width * 0.02,
                                              horizontal: Shared.width * 0.03),
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
                                            formKey: profileFormKey,
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
                                              vertical: Shared.width * 0.02,
                                              horizontal: Shared.width * 0.03),
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
                                            formKey: profileFormKey,
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
                                              vertical: Shared.width * 0.02,
                                              horizontal: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kregion.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomProvinceDropDown(
                                          hint: kregion.tr(),
                                          province:
                                              Shared.profileModel!.province,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02,
                                              horizontal: Shared.width * 0.03),
                                          child: Shared.text_widget(
                                              text: kcity.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomCitiesDropDown(
                                          hint: kcity.tr(),
                                          cities_depend_region_status:
                                              selectProvinceProvider
                                                  .cities_depend_region_status,
                                          city_name: Shared.profileModel!.city,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Shared.width * 0.02,
                                                  horizontal:
                                                      Shared.width * 0.03),
                                              child: Shared.text_widget(
                                                  text: kresume.tr(),
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          document_type: "1");
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: kGreenColor,
                                                ))
                                          ],
                                        ),
                                        BlocBuilder(
                                          bloc: attachments_bloc,
                                          builder: (context, state) {
                                            if (state is Loading) {
                                              resumes_list = [];
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  top: Shared.width * 0.1,
                                                ),
                                                child: Center(
                                                    child: Shared.spinkit),
                                              );
                                            } else if (state is Done) {
                                              resumes_list = [];
                                              return StreamBuilder<
                                                      AttachmentModel>(
                                                  stream: attachments_bloc
                                                      .all_attachments_subject,
                                                  builder: (context, snapshot) {
                                                    switch (snapshot
                                                        .connectionState) {
                                                      case ConnectionState.none:
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: Shared.width *
                                                                0.1,
                                                          ),
                                                          child: Center(
                                                              child: Shared
                                                                  .spinkit),
                                                        );
                                                      case ConnectionState.done:
                                                        return Text('');
                                                      case ConnectionState
                                                          .waiting:
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: Shared.width *
                                                                0.1,
                                                          ),
                                                          child: Center(
                                                              child: Shared
                                                                  .spinkit),
                                                        );
                                                      case ConnectionState
                                                          .active:
                                                        if (snapshot.hasError) {
                                                          return Center(
                                                            child: Text(snapshot
                                                                .error
                                                                .toString()),
                                                          );
                                                        } else {
                                                          snapshot.data!.data!
                                                              .forEach(
                                                                  (element) {
                                                            if (element
                                                                    .refIdType! ==
                                                                1) {
                                                              resumes_list!
                                                                  .add(element);
                                                            }
                                                          });
                                                          return Column(
                                                            children: [
                                                              Container(
                                                                width: Shared
                                                                    .width,
                                                                child: ListView
                                                                    .builder(
                                                                        /*snapshot.data!.data!.where((element) => element.refIdType == 1)*/
                                                                        itemCount:
                                                                            resumes_list!
                                                                                .length,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          sharedPreferenceManager.writeData(
                                                                              CachingKey.RESUME_URL,
                                                                              resumes_list![index].filePath);
                                                                          return Padding(
                                                                              padding: EdgeInsets.symmetric(vertical: 5),
                                                                              child: Container(
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: kInactiveColor)),
                                                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                                                  child: Row(
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
                                                                                            onTap: () {
                                                                                              attachments_bloc.add(DeleteAttachmentEvent(attachmentId: resumes_list![index].id.toString()));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.delete_outlined,
                                                                                              color: kRedColor,
                                                                                            ),
                                                                                          )),
                                                                                    ],
                                                                                  )));
                                                                        }),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    }
                                                  });
                                            } else if (state is ErrorLoading) {
                                              return no_data_widget(
                                                  context: context);
                                            }
                                            return Container();
                                          },
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Shared.width * 0.1),
                                            child: CustomButtonWidget(
                                              button_text: kNext.tr(),
                                              width: Shared.width,
                                              height: Shared.width * 0.13,
                                              onPress: () {
                                                if (profileFormKey.currentState!
                                                        .validate() &&
                                                    validateInputs(context,
                                                        ctx: context)) {
                                                  sharedPreferenceManager
                                                      .writeData(
                                                          CachingKey
                                                              .MOBILE_NUMBER,
                                                          phone_controller
                                                              .text);
                                                  sharedPreferenceManager
                                                      .writeData(
                                                          CachingKey.EMAIL,
                                                          email_controller
                                                              .text);
                                                  customAnimatedPushNavigation(
                                                      context,
                                                      ProfileEductionalDataWidget());
                                                }
                                              },
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              )))),
                )),
          ),
        ),
      ),
    );
  }

  Widget upload_attachment_bottom_sheet({String? document_type}) {
    return StatefulBuilder(builder: (context, setState) {
      return InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: Shared.width * 0.5,
              child: Column(children: [
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
                                await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'pdf', 'doc'],
                                ).then((value) async {
                                  setState(() {
                                    upload_file_loading = true;
                                  });
                                  if (value != null) {
                                    await attachment_repository
                                        .uploadAttachment(
                                            title: file_name.text,
                                            refId: applicant_id,
                                            // if document_type= 1 indicate that will upload resume if document_type= 2 indicate that will upload Certification
                                            refIdType: "${document_type}",
                                            refObj: "3",
                                            subRefId: "0",
                                            createAttachements: value.files)
                                        .then((value) {
                                      setState(() {
                                        if (value) {
                                          upload_file_loading = false;
                                          Navigator.pop(context);
                                          get_attachments();
                                        } else {
                                          upload_file_loading = false;
                                        }
                                      });
                                    });
                                  } else {
                                    setState(() {
                                      upload_file_loading = false;
                                    });
                                  }
                                });
                              },
                            )
                          ],
                        ),
                ),
              ])));
    });
  }

  void get_attachments() async {
    await sharedPreferenceManager
        .readString(CachingKey.MOBILE_NUMBER)
        .then((value) {
      phone_controller.text = value;
    });
    await sharedPreferenceManager
        .readString(CachingKey.EMAIL)
        .then((value) => email_controller.text = value);
    await sharedPreferenceManager
        .readInt(CachingKey.APPLICANT_ID)
        .then((value) {
      applicant_id = value.toString();
      attachments_bloc.add(GetAllAttachmentsEvent(
          applicationId: value.toString(), applicationTypeId: "3"));
    });
  }

  bool validateInputs(BuildContext context,
      {var scaffoldKey, required var ctx}) {
    if (!EmailValidator.validate(email_controller.text)) {
      Shared.showSnackBarView(
          error_status: true,
          message: kEnter_email_correctly,
          sigin_button: false);
      return false;
    }

    return true;
  }
}
