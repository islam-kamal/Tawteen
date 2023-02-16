import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Profile/educational_data_widget.dart';

profilePagesIndictor({
  BuildContext? context,
  isPersonalData: true,
  isContactInfo: false,
  isEductionalData: false,
}) {
  return Container(
      width: Shared.width,
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, Index());
                    },
                    child: indicator_element(
                        context: context,
                        text: kPersonaldata.tr(),
                        color:
                            isPersonalData == true ? kGreenColor : kGreyColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kGreenColor,
                    size: 15,
                  ),
                  InkWell(
                    onTap: () {
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ContactInfoWidget());
                    },
                    child: indicator_element(
                        context: context,
                        text: kContactData.tr(),
                        color:
                            isContactInfo == true ? kGreenColor : kGreyColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kGreenColor,
                    size: 15,
                  ),
                  InkWell(
                    onTap: () {
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, EductionalDataWidget());
                    },
                    child: indicator_element(
                        context: context,
                        text: keducationaldata.tr(),
                        color: isEductionalData == true
                            ? kGreenColor
                            : kGreyColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}

Widget indicator_element({BuildContext? context, String? text, Color? color}) {
  return Text(
    text!,
    style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15),
  );
}
