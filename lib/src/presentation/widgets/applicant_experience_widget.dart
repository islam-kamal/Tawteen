import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/custom_scroll_calendar.dart';
import 'package:flutter/cupertino.dart';

class ApplicantExperienceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
          child: Shared.text_widget(
              text: kJobtitle.tr(),
              textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        ),
        CustomJobTitlesDropDown(
          hint: kJobtitle.tr(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
          child: Shared.text_widget(
              text: kfacilityname.tr(),
              textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        ),
      Container(
              width: Shared.width,
              child: CustomTextField(
                hint: kfacilityname.tr(),
                alignment: translator.activeLanguageCode == 'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                isEmail: true,
                errorMessage: kEnter_the_identity.tr(),
              ),
            ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomScrollCalendar(
              start_year: true,
            ),
            CustomScrollCalendar(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.03),
          child: Shared.text_widget(
              text: kdescription.tr(),
              textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        ),
        Container(
          width: Shared.width,
          child: CustomTextField(
            hint: kdescription.tr(),
            isNotes: true,
            alignment: translator.activeLanguageCode == 'ar'
                ? TextAlign.right
                : TextAlign.left,
            isEmail: true,
            errorMessage: kEnter_the_identity.tr(),
          ),
        ),
      ],
    );
  }
}
