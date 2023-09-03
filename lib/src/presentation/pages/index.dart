
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
    var screenTitleProvider = Provider.of<ScreenTitleProvider>(context, listen: false);
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
            stateManagement: false,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: kWhiteColor, // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
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
        textStyle: TextStyle(fontFamily: "DINNextLTArabic",fontWeight: FontWeight.bold),
        title: khome.tr(),

        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(ImageAssets.profile),
        ),
        iconSize: Shared.width * 0.2,
        title: kprofile.tr(),
        textStyle: TextStyle(fontFamily: "DINNextLTArabic",fontWeight: FontWeight.bold),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(ImageAssets.settings),
          size: Shared.width * 0.08,
        ),
        title: ksettings.tr(),
        textStyle: TextStyle(fontFamily: "DINNextLTArabic",fontWeight: FontWeight.bold),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kBlackColor,
      ),
    ];
  }
}

class ScreenTitleProvider extends ChangeNotifier {
  String? title = khome.tr();
  int currentIndex = 0;

  void setTitleFromIndex(int index) {
    currentIndex = index;
    title = mapIndexTitle(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();

    });
  }


  String mapIndexTitle(int i) {
    switch (i) {
      case 0:
        return khome.tr();
      case 1:
        return  kprofile.tr();
      case 2:
        return  ksettings.tr();

      default:
        return 'المزيد';
    }
  }
}

class TabControllerProvider extends ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  changeTab({int? index }) {
    controller.jumpToTab(index!);
    notifyListeners();
  }
}
