import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/previous_initatives_screen.dart';
import 'package:code/src/presentation/pages/Jobs/Previous_Jobs/previous_jobs_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SavedJobsDropDown extends StatefulWidget {
  const SavedJobsDropDown({Key? key}) : super(key: key);

  @override
  State<SavedJobsDropDown> createState() => _SavedJobsDropDownState();
}

class _SavedJobsDropDownState extends State<SavedJobsDropDown> {

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: DropdownButton2(
            customButton:  Icon(
              Icons.arrow_drop_down_outlined,
              color: kWhiteColor.withOpacity(0.7),
            ),
            buttonWidth: 30,
            items: [
              ksubmittedjobs.tr(),
              ksubmitinitatives.tr()
            ].map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (value) {

              if(value == ksubmittedjobs.tr()){
                customAnimatedPushNavigation(context, PreviousJobsScreen());
              }else{
                customAnimatedPushNavigation(context, PreviousIntativesScreen());
              }

            },
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: Shared.width * 0.5,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: kWhiteColor,
            ),
            dropdownElevation: 2,
            offset: const Offset(0, 8),
          ),


    );
  }
}
