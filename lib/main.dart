import 'dart:io';

import 'package:code/src/Base/Notifications/local_notification_service.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/previous_initatives_screen.dart';
import 'package:code/src/presentation/pages/Jobs/Previous_Jobs/previous_jobs_screen.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'src/presentation/widgets/calendar.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (message != null) {
    final routeMessage = message.data['Type'];
    if (Shared.vistor_value != "visitor") {
      switch (routeMessage) {
        case "Jobs":
          Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  PreviousJobsScreen(
                    notification_job_id: message.data['RefId'],
                  )));
          break;
        case "Initiatives":
          Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  PreviousIntativesScreen(
                    notification_job_id: message.data['RefId'],
                  )));
          break;
      }
    }
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/i18n/',
  );

  await Firebase.initializeApp();


  /// maintain the push message if the application is closed
 FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);



  await ScreenUtil.ensureScreenSize();

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: TabControllerProvider()),
      ChangeNotifierProvider.value(value: ScreenTitleProvider()),
      ChangeNotifierProvider.value(value: SelectProvinceProvider()),
      ChangeNotifierProvider.value(value: ProfileProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalizedApp(
        child:MyMaterial()
      ) ),
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
    await sharedPreferenceManager.readString(CachingKey.APP_LANGUAGE).then((value) {
      if (value == '') {
        MyMaterial.app_langauge = translator.activeLanguageCode;
      } else {
        MyMaterial.app_langauge = value;
      }
    });
    String? device_token = await FirebaseMessaging.instance.getToken();
    sharedPreferenceManager.writeData(CachingKey.DEVICE_TOKEN, device_token);
  }

  @override
  void initState() {
    get_Static_data();
    _fcmConfigure(context);

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
          theme: ThemeData(fontFamily: 'DINNextLTArabic'),
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

  Future<void> _fcmConfigure(BuildContext context) async {
    LocalNotificationService.initialize(context);
    final _firebaseMessaging = FirebaseMessaging.instance;


    String? device_token = await FirebaseMessaging.instance.getToken();
    sharedPreferenceManager.writeData(CachingKey.DEVICE_TOKEN, device_token);
    print("device token : ${device_token}");

    ///required by IOS permissions
    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    // //get the current device token
    // _getCustomerNotification();

    ///gives you the message on which use taps
    ///and it opened from the terminated state
    _firebaseMessaging.getInitialMessage().then((message) async {
      // get the remote message when your app opened from push notification while in background state
      RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

// check if it is exists
      if (initialMessage != null) {
        // check the data property within RemoteMessage and do navigate based on it


      if (initialMessage != null) {
    final routeMessage = initialMessage.data['Type'];
        if (Shared.vistor_value == "visitor") {
          switch (routeMessage) {
            case "Jobs":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PreviousJobsScreen(
                        notification_job_id: 94.toString(),
                      )));
              break;
            case "Initiatives":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PreviousIntativesScreen()));
              break;
          }
        }
      }
      }
    });

    ///app open on ForeGround. notification will not be visibile but you will receive the data
    FirebaseMessaging.onMessage.listen((message) {


      if (message.notification != null) {
        LocalNotificationService.display(message);
      }

   if (message != null) {
        final routeMessage = message.data['Type'];
        if (Shared.vistor_value != "visitor") {
          switch (routeMessage) {
            case "Jobs":
              Navigator.push(
                  navigatorKey.currentState!.context,
                  MaterialPageRoute(
                      builder: (context) => /* JobDetailsScreen(
                        job_id: message.data['RefId'],
                        screen: PreviousJobsScreen(),
                        show_cancellation_status: true,
                        previous_job_status: message.data['Status'] == 10? true : false,
                        //     image_path: baseUrl + previous_job.attachments!.firstWhere((element) => element.status ==1).filePath!
                      )*/

                        PreviousJobsScreen(
                          notification_job_id: message.data['RefId']
                      )

                  ));
              break;
            case "Initiatives":
         /*     customAnimatedPushNavigation(context, InitativesDetailsScreen(
                iniatives_id: message.data['RefId'],
               previous_iniative_id: message.data['RequestInitativeId'],
                screen: PreviousIntativesScreen(),
                show_cancellation_status: true,
                previous_iniatives_status: message.data['Status'] == 8 ||
                    message.data['Status'] == 10? true : false,
                update_previous_iniatives_status: true,
              ));*/
            Navigator.push(
                  navigatorKey.currentState!.context,
                  MaterialPageRoute(
                      builder: (context) => PreviousIntativesScreen(
                          notification_job_id: message.data['RefId']
                      )));
              break;
          }
        }
      }
    });

    ///app in background and not terminated when you click on the notification this should be triggered
    FirebaseMessaging.onMessageOpenedApp.listen((message) {

      if (message != null) {
        final routeMessage = message.data['Type'];
        if (Shared.vistor_value != "visitor") {
          switch (routeMessage) {
            case "Jobs":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>

                PreviousJobsScreen(
                        notification_job_id: message.data['RefId'],
                      )

              ));
              break;
            case "Initiatives":
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PreviousIntativesScreen(
                          notification_job_id: message.data['RefId']
                      )));

    /*          customAnimatedPushNavigation(context, InitativesDetailsScreen(
                iniatives_id: message.data['RefId'],
                screen: PreviousIntativesScreen(),
                previous_iniative_id: message.data['RequestInitativeId'],
                show_cancellation_status: true,
                previous_iniatives_status: message.data['Status'] == 8 ||
                    message.data['Status'] == 10? true : false,
                update_previous_iniatives_status: true,
              ));*/
              break;
          }
        }
      }
    });

    FirebaseMessaging.onBackgroundMessage((message)async{
      await Firebase.initializeApp();

      if (message != null) {
        final routeMessage = message.data['Type'];
        if (Shared.vistor_value != "visitor") {
          switch (routeMessage) {
            case "Jobs":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>JobDetailsScreen(
                    job_id: message.data['RefId'],
                    screen: PreviousJobsScreen(),
                    show_cancellation_status: true,
                    previous_job_status: message.data['Status'] == 10? true : false,
                    //     image_path: baseUrl + previous_job.attachments!.firstWhere((element) => element.status ==1).filePath!
                  )



              ));
              break;
            case "Initiatives":
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PreviousIntativesScreen(
                       notification_job_id: message.data['RefId']
                       )));
        /*      customAnimatedPushNavigation(context, InitativesDetailsScreen(
                iniatives_id: message.data['RefId'],
                previous_iniative_id: message.data['RequestInitativeId'],
                screen: PreviousIntativesScreen(),
                show_cancellation_status: true,
                previous_iniatives_status: message.data['Status'] == 8 ||
                    message.data['Status'] == 10? true : false,
                update_previous_iniatives_status: true,
              ));*/
              break;
          }
        }
      }
    });

  }




}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}