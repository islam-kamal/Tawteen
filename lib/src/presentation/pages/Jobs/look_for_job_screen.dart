import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/search_jobs_bloc.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/custom_dropdown.dart';

import '../../widgets/calendar.dart';

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
          child: Scaffold(
            appBar: AppBarWidget.appBarWidget(
                context: context, icon: true, route: HomeScreen()),
            backgroundColor: kWhiteColor,
            body: Container(
                color: kGreenColor,
                child: Container(
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
                      child: BlocListener(
                          bloc: search_jobs_bloc,
                          listener: (context, state) {
                            if(state is Loading){
                              Shared.showLoadingDialog(context: context);
                            }else if(state is Done){
                              Shared.dismissDialog(context: context);
                              sharedPreferenceManager.removeData(CachingKey.CITY_ID);
                              sharedPreferenceManager.removeData(CachingKey.JOB_TITLE_ID);
                              sharedPreferenceManager.removeData(CachingKey.PUBLISH_START_DATE);
                              sharedPreferenceManager.removeData(CachingKey.PUBLISH_END_DATE);
                              customAnimatedPushNavigation(
                                  context, JobsSearchResultsScreen());

                            }else if(state is ErrorLoading){
                              sharedPreferenceManager.removeData(CachingKey.CITY_ID);
                              sharedPreferenceManager.removeData(CachingKey.JOB_TITLE_ID);
                              sharedPreferenceManager.removeData(CachingKey.PUBLISH_START_DATE);
                              sharedPreferenceManager.removeData(CachingKey.PUBLISH_END_DATE);
                              Shared.showSnackBarView(
                                  title_status: false,
                                  backend_message:  state.message!,
                                  backgroundColor: kRedColor,
                                  success_icon: false
                              );
                            }
                          },
                          child: SingleChildScrollView(
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
                                CustomJobTitlesDropDown(
                                  hint: kJobtitle.tr(),
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
                                CustomCitiesDropDown(
                                  hint: kcity.tr(),
                                  route: 'cities',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: Shared.text_widget(
                                      text: kperiod.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Shared.width * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: CustomCalendar(
                                            publishStartDate: kfrom.tr(),
                                          )),
                                      Expanded(flex: 1, child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: CustomCalendar(
                                            publishEndDate: kto.tr(),
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: Shared.width * 0.1),
                                    child: CustomButtonWidget(
                                      button_text: ksearch.tr(),
                                      width: Shared.width * 0.9,
                                      height: Shared.width * 0.13,
                                      onPress: () async {
                                      search_jobs_bloc.add(SearchJobsEvent(
                                              searchSpecficJobsEntity:
                                              SearchSpecficJobsEntity(
                                                jobTitleId:
                                                await sharedPreferenceManager.readString(CachingKey.JOB_TITLE_ID),
                                                cityId: await sharedPreferenceManager
                                                    .readString(CachingKey.CITY_ID),
                                                publishStartDate:
                                                await sharedPreferenceManager
                                                    .readString(CachingKey
                                                    .PUBLISH_START_DATE),
                                                publishEndDate:
                                                await sharedPreferenceManager
                                                    .readString(CachingKey
                                                    .PUBLISH_END_DATE),
                                              )));

                                      },
                                    )),
                              ],
                            ),
                          )),
                    ))),
          ),
        ),
      ),
    );
  }

}
