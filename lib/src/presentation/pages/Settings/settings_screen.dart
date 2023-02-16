import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/Base/common/preference_manager.dart';
import 'package:code/src/presentation/pages/Settings/privacy_screen.dart';
import 'package:code/src/presentation/pages/Settings/terms_screen.dart';
import 'package:code/src/presentation/widgets/contact_us_dialog.dart';
import 'package:code/src/presentation/widgets/custom_dropdown.dart';

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
                  welcome(),
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
                                height: Shared.height * 0.8,
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
                                      } else {
                                        return Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: Shared.width * 0.02,
                                            ),
                                            child: settings_element(
                                              icon: settings_data[index].screen,
                                              text: settings_data[index].title,
                                              function:
                                                  settings_data[index].function,
                                            ));
                                      }
                                    }),
                              )
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
                  " مؤيد الأمين",
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            )),
            Expanded(
                child: InkWell(
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
              onTap: () {
                showDialog(
                  context: navigatorKey.currentContext!,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Container(
                        child: Text("الوظائف السابقة"),
                      ),
                      alignment: Alignment.center,
                    );
                  },
                );
              },
            ))
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
                Expanded(flex: 5, child: Text(text!)),
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
    MyMaterial.setLocale(context, Locale('${lang}'));
    PreferenceManager.getInstance()!.saveString(Shared.languageCode, lang!);
  }
}
