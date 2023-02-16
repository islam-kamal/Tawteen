import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/widgets/custom_dropdown.dart';

class LookForJobScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LookForJobScreenState();
  }
}

class LookForJobScreenState extends State<LookForJobScreen> {
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child:Scaffold(
          appBar: AppBarWidget.appBarWidget(
              context: context, icon: true, route: HomeScreen()),
          backgroundColor: kWhiteColor,
          body:  Container(
                  color: kGreenColor,
                  child:Container(
                      height: Shared.height,
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Shared.width * 0.08),
                            topLeft: Radius.circular(Shared.width * 0.08)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Shared.width * 0.05,
                            vertical: Shared.width * 0.05),
                        child: Scrollbar(
                            child: Column(
                              children: [
                                Shared.text_widget(
                                    text: klookingforjob.tr(),
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                SizedBox(
                                  height: Shared.width * 0.05,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: Shared.text_widget(
                                      text: kJobtitle.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                CustomDropDown(
                                  hint:  kJobtitle.tr(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: Shared.text_widget(
                                      text: kcity.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                CustomDropDown(
                                  hint:  kcity.tr(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: Shared.text_widget(
                                      text: kregion.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                CustomDropDown(
                                  hint:  kregion.tr(),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Shared.width * 0.1),
                                    child: CustomButtonWidget(
                                      button_text: ksearch.tr(),
                                      width: Shared.width * 0.9,
                                      height: Shared.width * 0.13,
                                      onPress: () {
                                        customAnimatedPushNavigation(
                                            context, JobsSearchResultsScreen());
                                      },
                                    )),
                              ],
                            )),
                      )
                  )),
            ),

        ),
      ),
    );
  }
}
