import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_attachments.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_person_info.dart';
import 'package:code/src/presentation/pages/Profile/profile_educational_data_widget.dart';

ApplyJobIndicator({
  BuildContext? context,
  isApplyJobInfo: true, isApplyJobAttachment: false, isApplyJobReviewRequest: false,}) {

  return Container(
      width: Shared.width,
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
               /*       customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ApplyJobPersonInfo());*/
                    },
                    child: apply_job_indicator_element(
                        context: context,
                        text: kJobapplicantdata.tr(),
                        color:
                        isApplyJobInfo == true ? kGreenColor : kGreyColor),
                  ),
                 Icon(
                      Icons.arrow_forward_ios,
                      color: kGreenColor,
                      size: 15,

                  ),
                  InkWell(
                    onTap: () {
/*                      customAnimatedPushNavigation(
                          navigatorKey.currentContext!, AttachmentWidget());*/
                    },
                    child: apply_job_indicator_element(
                        context: context,
                        text: kattachments.tr(),
                        color:
                        isApplyJobAttachment == true ? kGreenColor : kGreyColor),
                  ),
                Icon(
                      Icons.arrow_forward_ios,
                      color: kGreenColor,
                      size: 15,

                  ),
                  InkWell(
                    onTap: () {
                 /*     customAnimatedPushNavigation(
                          navigatorKey.currentContext!, ReviewJobRequestWidget());*/
                    },
                    child: apply_job_indicator_element(
                        context: context,
                        text: kreviewrequest.tr(),
                        color: isApplyJobReviewRequest == true
                            ? kGreenColor
                            : kGreyColor),
                  )
                ],
              ),)

          ],
        ),
      );
}

Widget apply_job_indicator_element({BuildContext? context, String? text, Color? color}) {
  return Text(
    text!,
    style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15),
  );
}
