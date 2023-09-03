import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/bloc/Profile_Bloc/profile_bloc.dart';
import 'package:code/src/presentation/pages/Profile/profile_educational_data_widget.dart';
import 'package:code/src/presentation/pages/Profile/profile_personal_info_widget.dart';

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
              height: Shared.width * 0.12,
              alignment: Alignment.center,

              child:ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  InkWell(
                    onTap: () {
             /*         if(isPersonalData)
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ProfilePersonalInfoWidget(
                          isPersonalData:true
                      ));*/
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
                   /*   if(isContactInfo)
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ProfileContactInfoWidget());*/
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
            /*          if(isEductionalData)
                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ProfileEductionalDataWidget());*/
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
