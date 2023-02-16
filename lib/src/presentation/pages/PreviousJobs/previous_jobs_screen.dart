import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';
import 'package:provider/provider.dart';

class PreviousJobsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreviousJobsScreenState();
  }
}

class PreviousJobsScreenState extends State<PreviousJobsScreen> {
  List<JobEntity?> jobs_list = [
    JobEntity(
        image: ImageAssets.company1,
        title: "مصمم جرافيك خبرة 5 سنوات",
        publish_date: "26/1/2023",
        end_date: "26/2/2023",
        status: "Pending"),
    JobEntity(
        image: ImageAssets.company2,
        title: "مصمم جرافيك",
        publish_date: "26/1/2023",
        end_date: "26/2/2023",
        status: "Cancelled"),
    JobEntity(
        image: ImageAssets.company3,
        title: "Graphic Designer",
        publish_date: "26/1/2023",
        end_date: "26/2/2023",
        status: "Accept"),
    JobEntity(
        image: ImageAssets.company4,
        title: "Senior Graphic Designer",
        publish_date: "6/5/2023",
        end_date: "26/9/2023",
        status: "Pending"),
    JobEntity(
        image: ImageAssets.company5,
        title: "مصمم جرافيك خبرة 5 سنوات",
        publish_date: "26/3/2023",
        end_date: "2/4/2023",
        status: "Accept"),
    JobEntity(
        image: ImageAssets.company5,
        title: "مصمم جرافيك خبرة 5 سنوات",
        publish_date: "26/3/2023",
        end_date: "2/4/2023",
        status: "Cancelled"),
    JobEntity(
        image: ImageAssets.company5,
        title: "مصمم جرافيك خبرة 5 سنوات",
        publish_date: "26/3/2023",
        end_date: "2/4/2023",
        status: "Cancelled"),
  ];

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
                     Navigator.pop(context);
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
                      Navigator.pop(context);

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


                /*       leading: icon! ? IconButton(
            icon: Icon(Icons.arrow_back_ios,color: kWhiteColor,),
            onPressed: (){
              customAnimatedPushNavigation(context!, route! );

            },
          ) : Container(),*/
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
                              child: ListView.builder(
                                  itemCount: jobs_list.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Shared.width * 0.02,
                                          horizontal: Shared.width * 0.04),
                                      child: previous_jobs_element(
                                          jobEntity: jobs_list[index]),
                                    );
                                  }),
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

  Widget previous_jobs_element({JobEntity? jobEntity}) {
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, JobDetailsScreen());
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
                        child: Image.asset(jobEntity!.image!))),
                Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Shared.width * 0.05,
                            horizontal: Shared.width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Shared.width * 0.02,
                                ),
                                child: Text(
                                  jobEntity.title!,
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
                                      jobEntity.publish_date!,
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
                                      jobEntity.end_date!,
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
                width: Shared.width * 0.25,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: status_color(jobEntity.status!),
                    borderRadius: BorderRadius.only(
                        topLeft: translator.activeLanguageCode == 'ar'
                            ? Radius.circular(Shared.width * 0.02)
                            : Radius.circular(0),
                        topRight: translator.activeLanguageCode == 'ar'
                            ? Radius.circular(0)
                            : Radius.circular(Shared.width * 0.02))),
                child: Text(
                  "${jobEntity.status}",
                  style: TextStyle(fontWeight: FontWeight.normal,color: kWhiteColor),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }

  Color status_color(String status){
    switch(status){
      case 'Pending':
        return kYellowColor;
        break;
      case 'Accept':
        return kGreenColor;
        break;
      case 'Cancelled':
        return kRedColor;
        break;
      default:
        return kYellowColor;

    }
  }
}
