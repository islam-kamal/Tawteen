import 'package:code/src/Base/common/file_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/i18n/',
  );


  await ScreenUtil.ensureScreenSize();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: TabControllerProvider()),
      ChangeNotifierProvider.value(value: ScreenTitleProvider())
    ],
    child: LocalizedApp(
        child:MyMaterial()
    ),
  ));
}
var navigatorKey = GlobalKey<NavigatorState>();



class MyMaterial extends StatefulWidget{
  static var app_langauge;

  @override
  MyMaterialState createState() => MyMaterialState();

  static void setLocale(BuildContext context, Locale newLocale) {
    MyMaterialState? state = context.findAncestorStateOfType();

    app_langauge = newLocale.languageCode;
    state?.setState(() => state.local = newLocale);
  }

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<MyMaterialState>()?.restartApp();
  }
}
class MyMaterialState extends State<MyMaterial> {

  Locale? local;
  Key? key = UniqueKey();
  void restartApp() {
    setState(() {
      get_Static_data();
      key = UniqueKey();
    });
  }

  void get_Static_data() async {
    await PreferenceManager.getInstance()!
        .getString(Shared.languageCode).then((value) {
      if (value == '') {
        MyMaterial.app_langauge = translator.activeLanguageCode;
      } else {
        MyMaterial.app_langauge = value;
      }
    });
  }

  @override
  void initState() {
    get_Static_data();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          locale: local,
          supportedLocales: translator.locals(),

          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],

          home: SplashScreen(),
        );
      },
    );
  }
}