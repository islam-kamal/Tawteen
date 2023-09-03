import 'package:code/src/Base/common/file_export.dart';


class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kBlackColor,
        appBar: AppBarWidget.appBarWidget(context: context, icon: false),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.4,horizontal: Shared.width * 0.2),
        child: ListView(

          children: [
            Image(
              image: AssetImage(
                ImageAssets.checked_sigin,
              ),
              width: Shared.width * 0.25,
              height: Shared.width * 0.25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
              child: Text(
                kthanks_message.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                customAnimatedPushNavigation(context, HomeScreen());
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.1),
                  child:  Text(kback_home.tr(),
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)))
              ,
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 2.0, color: kWhiteColor),
              ),
            )
          ],
        ),
      )
    );
  }
}
