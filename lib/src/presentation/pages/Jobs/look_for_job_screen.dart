import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/search_jobs_bloc.dart';
import 'package:code/src/presentation/pages/Jobs/jobs_search_results_screen.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_job_titles_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_look_jobs_cities_dropdown.dart';
import 'package:code/src/presentation/widgets/Dropdown/custom_province_dropdown.dart';

import '../../widgets/calendar.dart';
import 'package:intl/intl.dart' as ui;
class LookForJobScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LookForJobScreenState();
  }
}

class LookForJobScreenState extends State<LookForJobScreen> {
  @override
  void initState() {
    sharedPreferenceManager.removeData(CachingKey.JOB_TITLE_ID);
    sharedPreferenceManager.removeData(CachingKey.JOB_TITLE_NAME_AR);
    sharedPreferenceManager.removeData(CachingKey.JOB_TITLE_NAME_EN);
    sharedPreferenceManager.removeData(CachingKey.CITY_ID);
   // sharedPreferenceManager.removeData(CachingKey.PUBLISH_START_DATE);
   // sharedPreferenceManager.removeData(CachingKey.PUBLISH_END_DATE);
    super.initState();
  }
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
                            }
                            else if(state is Done){
                              Shared.dismissDialog(context: context);
                              Shared.searchSpecficJobsEntity = new SearchSpecficJobsEntity();
                              customAnimatedPushNavigation(
                                  context, JobsSearchResultsScreen());

                            }
                            else if(state is ErrorLoading){
                              Shared.dismissDialog(context: context);
                              Shared.searchSpecficJobsEntity = new SearchSpecficJobsEntity();
                              Shared.showSnackBarView(
                                  error_status: true,
                                  backend_message:  state.message!,
                                  sigin_button: false
                              );
                            }
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                  child:    Shared.text_widget(
                                    text: klookingforjob.tr(),
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                      ),
                                SizedBox(
                                  height: Shared.width * 0.05,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

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
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
                                  child: Shared.text_widget(
                                      text: kcity.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),

                                CustomLookJobsCitiesDropDown(
                                  hint: kcity.tr(),
                                ),

                              /*  Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

                                  child: Shared.text_widget(
                                      text: kperiod.tr(),
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

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
                                ),*/
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: Shared.width * 0.1),
                                    child: CustomButtonWidget(
                                      button_text: ksearch.tr(),
                                      width: Shared.width ,
                                      height: Shared.width * 0.13,
                                      onPress: () async {
                                 /*      if(Shared.searchSpecficJobsEntity.publishStartDate == ""
                                            || Shared.searchSpecficJobsEntity.publishEndDate == "" ){*/
                                         search_jobs_bloc.add(SearchJobsEvent(
                                             searchSpecficJobsEntity:
                                             SearchSpecficJobsEntity(
                                               jobTitleId:   Shared.searchSpecficJobsEntity.jobTitleId == 'null' ? "" : Shared.searchSpecficJobsEntity.jobTitleId ,
                                               city_id: Shared.searchSpecficJobsEntity.city_id == 'null'
                                                   ? "" : Shared.searchSpecficJobsEntity.city_id ,
                                          //     publishStartDate: Shared.searchSpecficJobsEntity.publishStartDate == 'null' ? "" : Shared.searchSpecficJobsEntity.publishStartDate,
                                            //   publishEndDate: Shared.searchSpecficJobsEntity.publishEndDate == 'null' ? "" : Shared.searchSpecficJobsEntity.publishEndDate,
                                             )));

                                   /*    } else{

                                          DateTime publishStartDate = ui.DateFormat('MM/dd/yyyy').parse(Shared.searchSpecficJobsEntity.publishStartDate);
                                          DateTime publishEndDate = ui.DateFormat('MM/dd/yyyy').parse(Shared.searchSpecficJobsEntity.publishEndDate);
                                          if(publishStartDate.compareTo(publishEndDate) < 0){
                                            search_jobs_bloc.add(SearchJobsEvent(
                                                searchSpecficJobsEntity:
                                                SearchSpecficJobsEntity(
                                                  jobTitleId:   Shared.searchSpecficJobsEntity.jobTitleId == 'null' ? "" : Shared.searchSpecficJobsEntity.jobTitleId ,
                                                  city_id: Shared.searchSpecficJobsEntity.city_id == 'null'
                                                      ? "" : Shared.searchSpecficJobsEntity.city_id ,
                                                  publishStartDate: Shared.searchSpecficJobsEntity.publishStartDate
                                                      == 'null' ? "" : Shared.searchSpecficJobsEntity.publishStartDate,
                                                  publishEndDate: Shared.searchSpecficJobsEntity.publishEndDate == 'null' ? "" : Shared.searchSpecficJobsEntity.publishEndDate,
                                                )));
                                          }else{
                                            Shared.showSnackBarView(
                                                error_status: true,
                                                message: kEnter_valid_date,
                                                sigin_button: false
                                            );
                                          }
                                        }
*/



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
