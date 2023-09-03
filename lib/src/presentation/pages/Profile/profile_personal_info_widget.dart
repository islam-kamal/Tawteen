import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:code/src/presentation/widgets/profile_pages_indicator.dart';
import 'package:code/src/presentation/widgets/unathorized_user_widget.dart';
import 'package:provider/provider.dart';
class ProfilePersonalInfoWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePersonalInfoWidgetState();
  }

}
class ProfilePersonalInfoWidgetState extends State<ProfilePersonalInfoWidget> {

  @override
  void initState() {
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
                  child:  Shared.vistor_value == 'visitor' ?
                  UnAuthorizedUserWidget()
                      : Scrollbar(
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                            Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.06),
                                  child:  profilePagesIndictor(context: context,),
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
                                Shared.nafathInfoEntity!.arFamily!.toString() :  Shared.nafathInfoEntity!.enFamily!.toString(),

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
                                hint: Shared.nafathInfoEntity!.dobG.toString().substring(0,10),
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
                            BlocListener(
                                bloc: profileBloc,
                                listener: (context, state) {
                                  if(state is Loading){
                                    Shared.showLoadingDialog(context: context);
                                  }
                                  else if(state is Done){
                                    Shared.dismissDialog(context: context);
                                    customAnimatedPushNavigation(context, ProfileContactInfoWidget());
                                  }
                                  else if(state is ErrorLoading){
                                    Shared.dismissDialog(context: context);
                                    Shared.showSnackBarView(
                                        error_status: true,
                                        backend_message:  state.message!,
                                        sigin_button: false
                                    );
                                  }

                                },
                            child:    Padding(
                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                                child: CustomButtonWidget(
                                  button_text: kNext.tr(),
                                  width: Shared.width,
                                  height: Shared.width * 0.13,
                                  onPress: () {
                                    profileBloc.add(GetProfileDataEvent());
                                  },
                                )),)

                          ],
                        )
                      )

                            ],
                          )
                      )//PersonalInfoWidget()
                  )  ,

                )),
          ),

        ),
      ),
    );

  }
}


