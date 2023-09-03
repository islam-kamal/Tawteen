import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/apply_job_bloc.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/get_all_jobs_bloc.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_person_info.dart';
import 'package:code/src/presentation/pages/Jobs/Previous_Jobs/previous_jobs_screen.dart';

class JobDetailsScreen extends StatefulWidget {
  String? job_id;
  Widget? screen;
  String? image_path;
  bool? show_cancellation_status;
  bool? previous_job_status;
  JobDetailsScreen({this.job_id,this.screen,this.show_cancellation_status = false,this.previous_job_status,
  this.image_path=""});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JobDetailsScreenState();
  }
}

class JobDetailsScreenState extends State<JobDetailsScreen> {

  @override
  void initState() {
    getAllJobsBloc.add(GetJobDetailsEvent(
      job_id: widget.job_id
    ));
    sharedPreferenceManager.writeData(CachingKey.JOB_ID, widget.job_id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return NetworkIndicator(
      child: PageContainer(
        child:Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
          appBar: AppBarWidget.appBarWidget(
              context: context, icon: true, route: widget.screen),
          backgroundColor: kWhiteColor,
          body:  BlocListener(
            bloc: apply_job_bloc,
            listener: (context,state){
              if(state is Loading){
                Shared.showLoadingDialog(context: context);
              }else if(state is Done){
                Shared.dismissDialog(context: context);

                customAnimatedPushNavigation(context, PreviousJobsScreen());

              }else if(state is ErrorLoading){
                Shared.dismissDialog(context: context);
                Shared.showSnackBarView(
                    error_status: true,
                    backend_message:  state.message,
                    sigin_button: false
                );
              }
            },
            child: Container(
                color: kGreenColor,
                child:Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Shared.width * 0.08),
                          topLeft: Radius.circular(Shared.width * 0.08)),
                    ),
                    child: BlocBuilder(
                      bloc: getAllJobsBloc,
                      builder: (context,state){
                        if(state is Loading){
                          return Padding(
                            padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                            child: Center(
                                child: Shared.spinkit
                            ),
                          );
                        }else if(state is Done){
                          return StreamBuilder<JobDetailsModel>(
                              stream: getAllJobsBloc.job_details_subject,
                              builder: (context,snapshot){
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return Padding(
                                      padding: EdgeInsets.only(top:Shared.width * 0.4, ),
                                      child: Center(
                                          child: Shared.spinkit
                                      ),
                                    );
                                  case ConnectionState.done:
                                    return Text('');
                                  case ConnectionState.waiting:
                                    return Padding(
                                      padding: EdgeInsets.only(top:Shared.width * 0.4, ),
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
                                    else  {
                                      return   SingleChildScrollView(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Shared.width * 0.08,
                                                vertical: Shared.width * 0.05),
                                            child: Column(
                                              children: [
                                                /*    Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: Shared.width * 0.03),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "مطلوب مصمم خبرة 5 سنوات",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold),
                                                      )
                                                    ],
                                                  ),
                                                ),*/
                                                SizedBox(
                                                  height: Shared.width * 0.05,
                                                ),
                                                SizedBox(
                                                  //  height: Shared.height * 0.8,
                                                    child: Padding(
                                                        padding: EdgeInsets.only(
                                                          bottom: Shared.width * 0.1,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            job_details_header(
                                                                jobDetails: snapshot.data!.data
                                                            ),
                                                            job_details_body(
                                                                jobDetails: snapshot.data!.data
                                                            ),
                                                            widget.show_cancellation_status!
                                                                ?   widget.previous_job_status! ?   Padding(
                                                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                                                child: CustomButtonWidget(
                                                                  button_text: kcanceljob.tr(),
                                                                  width: Shared.width ,
                                                                  height: Shared.width * 0.13  ,
                                                                  color: kRedColor,
                                                                  onPress: () {
                                                                    apply_job_bloc.add(DeleteJobEvent());
                                                                  },
                                                                )) : Container()
                                                                : Padding(
                                                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                                                child: CustomButtonWidget(
                                                                  button_text: kapplyjob.tr(),
                                                                  width: Shared.width ,
                                                                  height: Shared.width * 0.13,
                                                                  onPress: () {
                                                                    if(  Shared.vistor_value == 'visitor'){
                                                                      Shared.showSnackBarView(
                                                                          error_status: true,
                                                                          message:  kauthorization.tr(),
                                                                          sigin_button: true
                                                                      );
                                                                    }
                                                                    else{
                                                                      customAnimatedPushNavigation(
                                                                          context, ApplyJobPersonInfo(
                                                                        route: widget.screen,
                                                                      ));
                                                                    }

                                                                  },
                                                                )),
                                                          ],
                                                        ))),
                                              ],
                                            )),
                                      );
                                    }

                                }
                              });

                        }else if(state is ErrorLoading){
                          return no_data_widget(context: context);
                        }
                        return Container();
                      },
                    )


                )),
          ),

          ),
        ),
      ),
    );
  }

  Widget job_details_header({JobDetails? jobDetails}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Shared.width * 0.02),
          border: Border.all(color: kInactiveColor)),
      height: Shared.width * 0.25,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Shared.width * 0.01,
                      horizontal: Shared.width * 0.02),
                  child: widget.image_path! == "" ?  Image.asset(
                      ImageAssets.placeholder,
                      fit: BoxFit.cover) : FadeInImage(
                    image: NetworkImage(widget.image_path!),
                    placeholder: AssetImage(ImageAssets.placeholder),
                    imageErrorBuilder:
                        (context, error, stackTrace) {
                      return Image.asset(
                          ImageAssets.placeholder,
                          fit: BoxFit.cover);
                    },
                    height: Shared.width * 0.2,
                    fit: BoxFit.fill,
                  )
               //   Image.asset(ImageAssets.company1)
              )),
          Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Shared.width * 0.02,
                      horizontal: Shared.width * 0.04),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Shared.width * 0.02,
                      ),
                      child: Text(
                        "${jobDetails!.jobTitleName}",
                        style: TextStyle(
                            fontSize: Shared.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor),
                      ))))
        ],
      ),
    );
  }

  Widget job_details_body({JobDetails? jobDetails}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05,
          vertical: Shared.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kjobdescription.tr(),
                      style: TextStyle(
                        color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(
                      "${jobDetails!.jobDescription}",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 13))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kskills.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child:     ListView.builder(
                      itemCount: jobDetails.jobSkillResultList!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Text("${index+1} - ${jobDetails.jobSkillResultList![index].skillName}",
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                                fontSize: 15));
                      }),),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            "${kpublishdate.tr()} : ",
                            style: TextStyle(
                                fontSize: Shared.width * 0.03,
                                color: kGreyColor),
                          ),
                          Text(
                            "${jobDetails.publishStartDate}",
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
                            "${kexpiredate.tr()} : ",
                            style: TextStyle(
                                fontSize: Shared.width * 0.03,
                                color: kGreyColor),
                          ),
                          Text(
                            "${jobDetails.publishEndDate}",
                            style: TextStyle(
                                fontSize: Shared.width * 0.03,
                                color: kGreyColor),
                          ),
                        ],
                      )),
                    ],
                  )),

            ],
          ),
        ));
  }
}
