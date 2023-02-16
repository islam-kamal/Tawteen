import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_person_info.dart';

class JobDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JobDetailsScreenState();
  }
}

class JobDetailsScreenState extends State<JobDetailsScreen> {
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
              context: context, icon: true, route: LookForJobScreen()),
          backgroundColor: kWhiteColor,
          body:  Container(
                  color: kGreenColor,
                  child:Container(
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
                              horizontal: Shared.width * 0.08,
                              vertical: Shared.width * 0.05),
                          child: Column(
                            children: [
                              Padding(
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
                              ),
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
                                          job_details_header(),
                                          job_details_body(),
                                          Padding(
                                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                              child: CustomButtonWidget(
                                                button_text: kapplyjob.tr(),
                                                width: Shared.width ,
                                                height: Shared.width * 0.13,
                                                onPress: () {
                                                  customAnimatedPushNavigation(
                                                      context, ApplyJobPersonInfo());
                                                },
                                              )),
                                        ],
                                      ))),
                            ],
                          )),
                    )
                  )),

          ),
        ),
      ),
    );
  }

  Widget job_details_header() {
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
                  child: Image.asset(ImageAssets.company1))),
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
                        "مطلوب مصمم خبرة 5 سنوات",
                        style: TextStyle(
                            fontSize: Shared.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor),
                      ))))
        ],
      ),
    );
  }

  Widget job_details_body() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text("الوصف الوظيفي",
                      style: TextStyle(
                        color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(
                      "مطلوب مصمم سعودي تعمل عن بعد لتنفيذ تصاميم دعائية وترويجية لمنتجات الشركة على منصات التواصل الاجتماعي تويتر , سناب شاب , تيك توك . انستجرام , واى منصات تواصل اخرى إن وجد ) يشترط تواجدها بالرياض خبرة لاتقل عن 3 سنوات لن يتم النظر في اى متقدم لاتتوفر في الشروط باقي البنود يتفق عليها في المقابلة",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 13))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text("البرامج المطلوب العمل عليها",
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(
                      "Adobe Photoshop \nAdobe After Effects \nCinema 4D- Maxon",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 13))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                  child: Row(
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
                            "26/1/2023",
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
                            "26/1/2023",
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
