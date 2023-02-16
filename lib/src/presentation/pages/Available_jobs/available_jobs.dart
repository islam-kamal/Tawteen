import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';

class AvailableJobsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AvailableJobsScreenState();
  }
}

class AvailableJobsScreenState extends State<AvailableJobsScreen> {
  List<JobEntity?> available_jobs_list = [
    JobEntity(
      image: ImageAssets.company1,
      title: "مصمم جرافيك خبرة 5 سنوات",
      publish_date: "26/1/2023",
      end_date: "26/2/2023",
    ),
    JobEntity(
      image: ImageAssets.company2,
      title: "مصمم جرافيك",
      publish_date: "26/1/2023",
      end_date: "26/2/2023",
    ),
    JobEntity(
      image: ImageAssets.company3,
      title: "Graphic Designer",
      publish_date: "26/1/2023",
      end_date: "26/2/2023",
    ),
    JobEntity(
      image: ImageAssets.company4,
      title: "Senior Graphic Designer",
      publish_date: "6/5/2023",
      end_date: "26/9/2023",
    ),
    JobEntity(
      image: ImageAssets.company5,
      title: "مصمم جرافيك خبرة 5 سنوات",
      publish_date: "26/3/2023",
      end_date: "2/4/2023",
    ),
    JobEntity(
      image: ImageAssets.company5,
      title: "مصمم جرافيك خبرة 5 سنوات",
      publish_date: "26/3/2023",
      end_date: "2/4/2023",
    ),
    JobEntity(
      image: ImageAssets.company5,
      title: "مصمم جرافيك خبرة 5 سنوات",
      publish_date: "26/3/2023",
      end_date: "2/4/2023",
    ),
  ];

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
                      child: SingleChildScrollView(
                        child:Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Shared.width * 0.05,
                              vertical: Shared.width * 0.05),
                          child:  Column(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.06,
                                vertical: Shared.width * 0.02, ),
                                child: Row(
                                  children: [
                                    Text(kalljobsavailable.tr(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                  ],
                                ),),

                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: Shared.width * 0.1,
                                ),
                                child:ListView.builder(
                                    itemCount: available_jobs_list.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Shared.width * 0.02,
                                            horizontal: Shared.width * 0.04),
                                        child: job_search_result_element(
                                            searchResultEntity:
                                            available_jobs_list[index]),
                                      );
                                    }),
                              )   ,

                            ],
                          ),
                        ),
                      )
                  )
              ),
            )   ),
      ),
    );
  }

  Widget job_search_result_element({JobEntity? searchResultEntity}) {
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, JobDetailsScreen());
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
                    child: Image.asset(searchResultEntity!.image!))),
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
                              searchResultEntity.title!,
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
                                      searchResultEntity.publish_date!,
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
                                      searchResultEntity.end_date!,
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
