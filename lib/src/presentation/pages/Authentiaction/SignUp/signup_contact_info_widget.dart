import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/domain/entities/document_entity.dart';
import 'package:code/src/domain/entities/initatives_upload_files_entity.dart';
import 'package:code/src/presentation/bloc/Attachment_Bloc/attachment_bloc.dart';
import 'package:code/src/presentation/pages/Authentiaction/SignUp/signup_educational_data_widget.dart';
import 'package:code/src/presentation/pages/Profile/profile_educational_data_widget.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:code/src/presentation/widgets/signup_pages_indicator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';

class SignUpContactInfoWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpContactInfoWidgetState();
  }

}
class SignUpContactInfoWidgetState extends State<SignUpContactInfoWidget> {
  var phone_controller = TextEditingController();
  var email_controller = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  final fileFormKey = GlobalKey<FormState>();
  var file_name = TextEditingController();
  bool upload_file_loading = false;
  List<Attachment>? resumes_list = [];
  bool? upload_file_status = false;
  List<DocumentEntity> documents_list = [];
  List<PlatformFile>? files = [];

  var province_id , city_id;


  @override
  void initState() {
    sharedPreferenceManager.removeData(CachingKey.CITY_ID);
    sharedPreferenceManager.removeData(CachingKey.PROVINCE_ID);
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
                                    padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06),
                                    child: Column(
                                      children: [
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
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

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
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kregion.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomProvinceDropDown(
                                          hint: kregion.tr(),
                                          isRegister: true,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: Shared.text_widget(
                                              text: kcity.tr(),
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        CustomCitiesDropDown(
                                          hint: kcity.tr(),
                                          cities_depend_region_status: true,
                                          isRegister: true,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

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

                                        Shared.signup_attachments.isEmpty ? Container()
                                            :  Padding(
                                          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                          child: ListView.builder(
                                              itemCount: Shared.signup_attachments.length,
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
                                                              text: Shared.signup_attachments[index].filename.toString(),
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  fontSize: 15)),
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: IconButton(
                                                            onPressed: () async {
                                                              Shared.signup_attachments.removeAt(index);
                                                              setState(() {

                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: kRedColor,
                                                            ))),
                                                  ],
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
                                              onPress: () async {
                                               // get_attachments();
                                                await sharedPreferenceManager.readString(CachingKey.PROVINCE_ID).then((value) async {
                                                  province_id = value.toString();
                                                  await sharedPreferenceManager.readString(CachingKey.CITY_ID).then((value){
                                                    city_id = value.toString();

                                                    if (signupFormKey.currentState!
                                                        .validate() && validateInputs(context, ctx: context)) {
                                                      sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, phone_controller.text);
                                                      sharedPreferenceManager.writeData(CachingKey.EMAIL, email_controller.text);
                                                      customAnimatedPushNavigation(
                                                          context,
                                                          SignUpEductionalDataWidget ());
                                                    }/*else{
                                                      Shared.showSnackBarView(
                                                          error_status: true,
                                                          message: kEnter_email_correctly,
                                                          sigin_button: false
                                                      );
                                                    }*/

                                                  });
                                                });


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
    if (province_id == "null") {
      Shared.showSnackBarView(
          error_status: true,
          message: kselect_province,
          sigin_button: false
      );
      return false;
    }
    if (city_id == "null") {
      Shared.showSnackBarView(
          error_status: true,
          message: kselect_city,
          sigin_button: false
      );
      return false;
    }


    return true;
  }

  Widget upload_attachment_bottom_sheet({String? document_type,int? index}) {
    return  Container(
          height: Shared.width * 0.9,
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
                      setState(() {
                        upload_file_loading = false;
                      });
                      if(value != null)
                      Shared.signup_attachments.add(InitativeUploadFilesEntity(
                        filename: file_name.text,
                        files: value.files,
                      ));
                      setState(() {

                      });

                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ),
          ),
         ])
        );
  }

}



