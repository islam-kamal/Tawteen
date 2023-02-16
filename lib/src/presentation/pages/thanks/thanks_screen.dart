import 'package:code/src/Base/common/file_export.dart';

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBarWidget(
          context: context,
          icon: false
      ),
      body: Container(
        color: kBlackColor,
        width: Shared.width,
        height: Shared.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                "شكراً لك\n تم التقديم بنجاح",
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
                  child:  Text("عودة للرئيسية",
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
      ),
    );
  }
}
