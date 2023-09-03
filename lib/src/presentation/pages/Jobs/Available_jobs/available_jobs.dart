
import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/get_all_jobs_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AvailableJobsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AvailableJobsScreenState();
  }
}

class AvailableJobsScreenState extends State<AvailableJobsScreen> {


  @override
  void initState() {
    getAllJobsBloc.add(GetAllJobsEvent());
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
            child:Scaffold(
            appBar: AppBarWidget.appBarWidget(
                context: context, icon: true, route:HomeScreen()),
            backgroundColor: kWhiteColor,
            body: Container(
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
                            return StreamBuilder<AllJobsModel>(
                                stream: getAllJobsBloc.all_jobs_subject,
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
                                      else if (snapshot.data!.data!.length > 0) {
                                        return   SingleChildScrollView(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Shared.width * 0.02,
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
                                                        kalljobsavailable.tr(),
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
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    itemCount: snapshot.data!.data!.length ,
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: Shared.width * 0.02,
                                                            horizontal: Shared.width * 0.04),
                                                        child: job_search_result_element(
                                                            job: snapshot.data!.data![index]),
                                                      );

                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );

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
                  )
              ),
            )   ),
      ),
    );
  }

  Widget job_search_result_element({SearchedJob? job}) {
    print("image : ${baseUrl + job!.attachments!.firstWhere((element) => element.status ==1).filePath!}");
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, JobDetailsScreen(
          job_id: job!.id,
          screen: AvailableJobsScreen(),
          image_path: job.attachments!.isEmpty ?
              "" : baseUrl + job.attachments!.firstWhere((element) => element.status ==1).filePath!
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        padding: EdgeInsets.symmetric(vertical:Shared.width * 0.02 ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Shared.width * 0.01,
                        horizontal: Shared.width * 0.02),
                    child: job!.attachments!.isEmpty ?
                    Image.asset(ImageAssets.placeholder)
                        : FadeInImage(
                      image: NetworkImage(baseUrl + job.attachments!.firstWhere((element) => element.status ==1).filePath!,
                      ),
                      placeholder: AssetImage(ImageAssets.placeholder),
                      imageErrorBuilder:
                          (context, error, stackTrace) {
                        print("error : ${error}");
                        return Image.asset(
                            ImageAssets.placeholder,
                            fit: BoxFit.cover);
                      },
                      height: Shared.width * 0.2,
                      fit: BoxFit.fill,
                    )
                )
            ),

            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Shared.width * 0.02,
                        horizontal: Shared.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.02,),
                            child: Text(
                              job.jobTitleName!,
                              style: TextStyle(
                                  fontSize: Shared.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor),
                            )  ),
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
                                      job.publishStartDate!,
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
                                      job.publishEndDate!,
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
    );
  }
}
