import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class NetworkIndicator extends StatefulWidget {
  final Widget? child;
  const NetworkIndicator({this.child});
  @override
  _NetworkIndicatorState createState() => _NetworkIndicatorState();
}

class _NetworkIndicatorState extends State<NetworkIndicator> {
  double _height = 0;

  Widget _buildBodyItem() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: _height * 0.2,
            ),
            Icon(
              Icons.signal_wifi_off,
              size: _height * 0.25,
              color: Colors.grey[400],
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "عفواً ... لايوجد اتصال بالإنترنت",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: EdgeInsets.only(top: _height * 0.025),
                child: Text(
                  "إفحص جهاز الراوتر الخاص بك",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: EdgeInsets.only(top: _height * 0.025),
                child: Text(
                  "أعد الاتصال بالشبكة",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                height: _height * 0.09,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25,
                    vertical: _height * 0.02),
                child: Builder(
                    builder: (context) => InkWell(
                          onTap: () {

                          },
                          child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                color: kGreenColor,),
                              alignment: Alignment.center,
                              child: const Text(
                                "تحديث الصفحة",
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0),
                              )),
                        )))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          final appBar = AppBar(
              backgroundColor: kWhiteColor,
              automaticallyImplyLeading: true,
              title: Text(
                translator.activeLanguageCode == 'ar'
                    ? 'منصة رواد النقل'
                    : 'Rowad Alnaql',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
              actions: const <Widget>[]);
          _height = MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top;
          return Scaffold(
            appBar: appBar,
            body: _buildBodyItem(),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return widget.child!;
      },
    );
  }
}
