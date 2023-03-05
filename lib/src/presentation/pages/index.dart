/*
import 'package:code/src/Base/common/image_manger.dart';
import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/shared.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:code/src/presentation/pages/Home/home_screen.dart';
import 'package:code/src/presentation/pages/Profile/update_profile_screen.dart';
import 'package:code/src/presentation/pages/Settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class Index extends StatefulWidget {
  int index;
  Index({required this.index});
  @override
  _State createState() => _State(index: this.index);
}
class _State extends State<Index> {
  int index;
  _State({required this.index});
  int _currentIndex=0;
  List<Widget>itemsUi=[
    HomeScreen(),
    UpdateProfileScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection:translator.activeLanguageCode == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          body:itemsUi[_currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kGreenColor,
              selectedFontSize: Shared.width * 0.04,
              unselectedFontSize: Shared.width * 0.04,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedItemColor: kGreyColor,

              currentIndex: _currentIndex,

              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon:ImageIcon(AssetImage(ImageAssets.home),
                      size: Shared.width * 0.08,),
                  label:  khome.tr(),

                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(ImageAssets.profile),
                      size: Shared.width * 0.08,),
                  label:  kprofile.tr(),
                ),BottomNavigationBarItem(
                    icon:  ImageIcon(AssetImage(ImageAssets.settings),
                      size: Shared.width * 0.08,),
                  label:  ksettings.tr(),
                ),


              ]),),
      ),
    );
  }
}
*/

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  int currentIndex = 0;
var indexKey = GlobalKey();
  @override
  void initState() {

    var screenTitleProvider =
        Provider.of<ScreenTitleProvider>(context, listen: false);

    setState(() {
      screenTitleProvider.setTitleFromIndex(0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenTitleProvider = Provider.of<ScreenTitleProvider>(context);
    var tabeControllerProvider = Provider.of<TabControllerProvider>(context);

    return Scaffold(
      key: indexKey,
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: MyMaterial.app_langauge == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: PersistentTabView(
            context,
            navBarHeight: Shared.width * 0.22,
            onItemSelected: (index) {
              screenTitleProvider.setTitleFromIndex(index);
            },
            controller: tabeControllerProvider.controller,

            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: kWhiteColor, // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              //animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style6, // Choose the nav bar style with this property.
          ),
        ));
  }

  List<Widget> _buildScreens() {
    return [HomeScreen(), ProfilePersonalInfoWidget(), SettingsScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(ImageAssets.home),
          size: Shared.width * 0.08,
        ),
        title: khome.tr(),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(ImageAssets.profile),
        ),
        iconSize: Shared.width * 0.2,
        title: kprofile.tr(),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(ImageAssets.settings),
          size: Shared.width * 0.08,
        ),
        title: ksettings.tr(),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

class ScreenTitleProvider extends ChangeNotifier {
  String? title = 'الرئيسية';
  int currentIndex = 0;

  void setTitleFromIndex(int index) {
    currentIndex = index;
    title = mapIndexTitle(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void setTitle(String? t) {
    title = t;
    notifyListeners();
  }

  String mapIndexTitle(int i) {
    switch (i) {
      case 0:
        return 'الرئيسية';
      case 1:
        return 'طلباتي';
      case 2:
        return 'الملف الشخصي';

      default:
        return 'المزيد';
    }
  }
}

class TabControllerProvider extends ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  changeTab(int index) {
    controller.jumpToTab(index);
    notifyListeners();
  }
}
