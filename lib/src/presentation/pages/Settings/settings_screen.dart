import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:code/src/presentation/pages/Settings/privacy_screen.dart';
import 'package:code/src/presentation/pages/Settings/terms_screen.dart';
import 'package:code/src/presentation/widgets/contact_us_dialog.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  bool? chang_language_status = false;

  @override
  Widget build(BuildContext context) {

    List<ElementEntity> settings_data = [
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.aboutus,
            ),
            color: kGreenColor,
          ),
          title: kaboutus.tr(),
          function: () {
            customAnimatedPushNavigation(
                navigatorKey.currentContext!, AboutUsScreen());
          }),
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.privacy,
            ),
            color: kGreenColor,
          ),
          title: kprivacy.tr(),
          function: () {
            customAnimatedPushNavigation(
                navigatorKey.currentContext!, PrivacyScreen());
          }),
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.terms,
            ),
            color: kGreenColor,
          ),
          title: kterms.tr(),
          function: () {
            customAnimatedPushNavigation(
                navigatorKey.currentContext!, TermsScreen());
          }),
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.language,
            ),
            color: kGreenColor,
          ),
          title: klanguage.tr(),
          function: () {}),
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.call,
            ),
            color: kGreenColor,
          ),
          title: kcontactus.tr(),
          function: () {
            showDialog(
              context: navigatorKey.currentContext!,
              builder: (ctx) => ContactUsDialog(
                context: ctx,
              ),
            );
          }),
      ElementEntity(
          screen: ImageIcon(
            AssetImage(
              ImageAssets.logout,
            ),
            color: kRedColor,
          ),
          title: klogout.tr(),
          function: () {
            sharedPreferenceManager.removeData(CachingKey.AUTH_TOKEN);
            Shared.vistor_value = "visitor";
            var profileProvider = Provider.of<ProfileProvider>(context,listen: false);
            profileProvider.changeProfileStatus( status: false);
            customAnimatedPushNavigation(
                navigatorKey.currentContext!, SiginScreen());
          }),
    ];
    return NetworkIndicator(
        child: PageContainer(
            child: Directionality(
      textDirection: translator.activeLanguageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBarWidget.appBarWidget(
          context: context,
          icon: false,
        ),
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Container(
              color: kHaviyGreenColor,
              child: Column(
                children: [
                  Shared.vistor_value == 'visitor' ? Container(height: Shared.width * 0.1): welcome(),
                  Container(
                      height: Shared.height,
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Shared.width * 0.1,
                            vertical: Shared.width * 0.01,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Shared.width * 0.05,
                                    vertical: Shared.width * 0.03),
                                child: Container(
                                  alignment:
                                      translator.activeLanguageCode == 'ar'
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: Text(
                                    ksettings.tr(),
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Shared.height * 0.6,
                                child: ListView.builder(
                                    itemCount: settings_data.length,
                                    itemBuilder: (context, index) {
                                      if (index == 3) {
                                        return Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02,
                                            ),
                                            child: settings_element(
                                              icon: settings_data[index].screen,
                                              text: MyMaterial.app_langauge ==
                                                      'en'
                                                  ? "English"
                                                  : "عربى",
                                              function: () {
                                                if (MyMaterial.app_langauge ==
                                                    'ar') {
                                                  final newLang = 'en';
                                                  _changeLang(lang: newLang);
                                                } else {
                                                  final newLang = 'ar';
                                                  _changeLang(lang: newLang);
                                                }
                                              },
                                            ));
                                      }else if(index ==5 && Shared.vistor_value == 'visitor'){
                                        return Container();
                                      } else {
                                        return Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02,
                                            ),
                                            child: settings_element(
                                              icon: settings_data[index].screen,
                                              text: settings_data[index].title,
                                              function: settings_data[index].function,
                                            ));
                                      }
                                    }),
                              ),
                             Container(
                                  alignment: Alignment.center,
                                  child: Text.rich(
                                      TextSpan(
                                          style: TextStyle(color: Colors.redAccent), //apply style to all
                                          children: [
                                            TextSpan(text: '${kcopy_rights.tr()} ©️',
                                                style: TextStyle(
                                                    color: kBlackColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                            TextSpan(text: ' ${krowad_alnaql.tr()} ' ,style: TextStyle(
                                                color: kGreenColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),),
                                            TextSpan(text: '${DateTime.now().year} ',style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),),
                                          ]
                                      ),textAlign: TextAlign.center,
                                  )

                               /*   Text(
                                   "جميع الحقوق محفوظة لمنصة ©️ رواد النقل 2023",
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),*/
                                ),

                            ],
                          )))
                ],
              )),
        ),
      ),
    )));
  }

  Widget welcome() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.1),
      child: Container(
        height: Shared.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
                child: Row(
                  children: [
                    Text(
                      kwelcome.tr(),
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      " ,  ${translator.activeLanguageCode == 'en' ? Shared.nafathInfoEntity!.enFirst!.toLowerCase()
                          : Shared.nafathInfoEntity!.arFirst!.toLowerCase()} ",

                      style: TextStyle(fontFamily: "DINNextLTArabic",fontWeight: FontWeight.bold,
                      color: kWhiteColor),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: kWhiteColor.withOpacity(0.7),
                  ),
                  SavedJobsDropDown(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget settings_element({Widget? icon, String? text, Function()? function}) {
    return InkWell(
        onTap: function,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 1, child: icon!),
                Expanded(flex: 5, child: Text(text!,style: TextStyle(color: text == klogout.tr() ? kRedColor : kBlackColor),)),
              ],
            ),
            Divider(
              color: kInactiveColor,
            )
          ],
        ));
  }

  void _changeLang({String? lang}) async {
    setState(() {
      translator.setNewLanguage(
        context,
        newLanguage: '${lang}',
        remember: true,
        restart: false,
      );
    });
    var screenTitleProvider = Provider.of<ScreenTitleProvider>(context, listen: false);
    setState(() {
      screenTitleProvider.setTitleFromIndex(0);
    });
    MyMaterial.setLocale(context, Locale('${lang}'));
    sharedPreferenceManager.writeData(CachingKey.APP_LANGUAGE, lang!);
  }
}
