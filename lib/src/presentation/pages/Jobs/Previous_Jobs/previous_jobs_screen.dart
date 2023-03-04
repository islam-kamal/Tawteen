import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';
import 'package:code/src/presentation/bloc/Previous_Job_Bloc/previous_job_bloc.dart';
import 'package:provider/provider.dart';

class PreviousJobsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreviousJobsScreenState();
  }
}

class PreviousJobsScreenState extends State<PreviousJobsScreen> {

  @override
  void initState() {
    previousJobsBloc.add(GetPreviousJobsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child:  Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child:Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.w), // here the desired height
              child: AppBar(
                  backgroundColor: kGreenColor,
                  elevation: 0,
                  centerTitle: true,
                  title: Image.asset(
                    ImageAssets.appbar_logo,
                    color: kWhiteColor,
                    width: 90.h,
                    height: 60.w,
                  ),
                  leading:translator.activeLanguageCode == 'ar'
                      ? IconButton(
                    onPressed: () {
                      customAnimatedPushNavigation(context, HomeScreen());
                    },
                    icon: translator.locale.languageCode == "en"
                        ? Icon(
                      Icons.arrow_forward_ios,
                      color: kWhiteColor,
                    )
                        : Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                    ),
                  )
                      : IconButton(
                    onPressed: () {
                      customAnimatedPushNavigation(context, HomeScreen());

                    },
                    icon: translator.locale.languageCode == "ar"
                        ? Icon(
                      Icons.arrow_forward_ios,
                      color: kWhiteColor,
                    )
                        : Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                    ),
                  )
              )),
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
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Shared.width * 0.05,
                            vertical: Shared.width * 0.05),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Shared.width * 0.06,
                                vertical: Shared.width * 0.02,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    ksubmittedjobs.tr(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Shared.width * 0.1,
                              ),
                              child: BlocBuilder(
                                bloc: previousJobsBloc,
                                builder: (context,state){
                                  if(state is Loading){
                                    return Padding(
                                      padding: EdgeInsets.only(top: Shared.width * 0.8, ),
                                      child: Center(
                                        child: Shared.spinkit,
                                      ),
                                    );
                                  }
                                  else if(state is Done){
                                    return StreamBuilder<PreviousJobModel>(
                                        stream: previousJobsBloc.previous_jobs_subject,
                                        builder: (context,snapshot){
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.none:
                                              return Padding(
                                                padding: EdgeInsets.only(top:Shared.width * 0.8, ),
                                                child: Center(
                                                    child: Shared.spinkit
                                                ),
                                              );
                                            case ConnectionState.done:
                                              return Text('');
                                            case ConnectionState.waiting:
                                              return Padding(
                                                padding: EdgeInsets.only(top:Shared.width * 0.8, ),
                                                child: Center(
                                                    child: Shared.spinkit
                                                ),
                                              );
                                            case ConnectionState.active:
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(snapshot.error.toString()),
                                                );
                                              }
                                              else if (snapshot.data!.data!.length > 0) {
                                                return ListView.builder(
                                  itemCount: snapshot.data!.data!.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Shared.width * 0.02,
                                          horizontal: Shared.width * 0.01),
                                      child: previous_jobs_element(
                                          previous_job: snapshot.data!.data![index]),
                                    );
                                  });
                                              }
                                              else
                                                return no_data_widget(context: context,
                                                center: true);
                                          }
                                        });

                                  }else if(state is ErrorLoading){
                                    return no_data_widget(context: context,
                                        center: true);
                                  }
                                  return Container();
                                },
                              )

                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
        ),
      ),
    );
  }

  Widget previous_jobs_element({PreviousJob? previous_job}) {
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, JobDetailsScreen(
          job_id:previous_job!.jobId!.toString() ,
           screen: PreviousJobsScreen(),
          show_cancellation_status: true,
          previous_job_status: previous_job.status == 8  || previous_job.status == 10? true : false,

        ));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Shared.width * 0.02),
                border: Border.all(color: kInactiveColor)),
            height: Shared.width * 0.30,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Shared.width * 0.01,
                            horizontal: Shared.width * 0.02),
                        child: Image.asset(ImageAssets.placeholder)
                      /*FadeInImage(
                  image: NetworkImage(
                      baseUrl + previous_job!.attachments!.firstWhere((element) => element.status ==1).filePath!
                  ),
                  placeholder: AssetImage(ImageAssets.placeholder),
                  imageErrorBuilder:
                      (context, error, stackTrace) {
                    return Image.asset(
                        ImageAssets.placeholder,
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                )*/
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Shared.width * 0.05,
                            horizontal: Shared.width * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Shared.width * 0.02,
                                ),
                                child: Text(
                                  previous_job!.jobTitleName!,
                                  style: TextStyle(
                                      fontSize: Shared.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: kBlackColor),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text(
                                      "تاريخ النشر : ",
                                      style: TextStyle(
                                          fontSize: Shared.width * 0.03,
                                          color: kGreyColor),
                                    ),
                                    Text(
                                      previous_job.creationDate!.substring(0,10),
                                      style: TextStyle(
                                          fontSize: Shared.width * 0.03,
                                          color: kGreyColor),
                                    ),
                                  ],
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text(
                                      "تاريخ الانتهاء : ",
                                      style: TextStyle(
                                          fontSize: Shared.width * 0.03,
                                          color: kGreyColor),
                                    ),
                                    Text(
                                      previous_job.endDateOfApplicantsAcceptance!.substring(0,10),
                                      style: TextStyle(
                                          fontSize: Shared.width * 0.03,
                                          color: kGreyColor),
                                    ),
                                  ],
                                )),
                              ],
                            )
                          ],
                        )))
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: translator.activeLanguageCode == 'ar' ? 0 : null,
              right: translator.activeLanguageCode == 'ar' ? null : 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: Shared.width * 0.03),
                decoration: BoxDecoration(
                    color: status_color(previous_job.status ).color,
                    borderRadius: BorderRadius.only(
                        topLeft: translator.activeLanguageCode == 'ar'
                            ? Radius.circular(Shared.width * 0.02)
                            : Radius.circular(0),
                        topRight: translator.activeLanguageCode == 'ar'
                            ? Radius.circular(0)
                            : Radius.circular(Shared.width * 0.02))),
                child: Text(
                  "${status_color(previous_job.status ).status}",
                  style: TextStyle(fontWeight: FontWeight.normal,color: kWhiteColor),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }

  JobStatus status_color(int? status){
    switch(status){
      case 1:
        return JobStatus(
          color: kBlackColor,
          status: kactive.tr()
        );
        break;
      case 2:
        return JobStatus(
            color: kRedColor,
            status: kdeleted.tr()
        );
        break;
      case 3:
        return JobStatus(
            color: kInactiveColor,
            status: kunderVerified.tr()
        );
        break;
      case 4:
        return JobStatus(
            color: kPrimaryColor,
            status: ksuspended.tr()
        );
        break;
      case 5:
        return JobStatus(
            color: kRedColor,
            status: krejected.tr()
        );
        break;
      case 6:
        return JobStatus(
            color: kRedColor,
            status:kcancelled.tr()
        );
        break;
      case 7:
        return JobStatus(
            color: kGreenColor,
            status: kaccepted.tr()
        );
        break;
      case 8:
        return JobStatus(
            color: kYellowColor,
            status: kpending.tr()
        );
        break;
      case 9:
        return JobStatus(
            color: kWhiteColor,
            status: kall.tr()
        );
        break;
      case 10:
        return JobStatus(
            color: kYellowColor,
            status: kunderProcessing.tr()
        );
        break;
      default:
        return JobStatus(
            color: kAvailableColor,
            status: kactive.tr()
        );

    }
  }
}
class JobStatus{
  Color? color;
  String? status;
  JobStatus({this.color,this.status});
}