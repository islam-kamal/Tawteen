import 'package:code/src/Base/common/file_export.dart';

class CourseDetailsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CourseDetailsScreenState();
  }

}

class CourseDetailsScreenState extends State<CourseDetailsScreen>{
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child:Directionality(
          textDirection: translator.activeLanguageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBarWidget.appBarWidget(
                context: context, icon: true, route: CoursesScreen()),
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
                                      ktrainingcourses.tr(),
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
                                          course_details_header(),
                                          course_details_body(),
                                          Padding(
                                              padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                              child: CustomButtonWidget(
                                                button_text: kSubscribetothecourse.tr(),
                                                width: Shared.width ,
                                                height: Shared.width * 0.11,
                                                onPress: () {

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
  Widget course_details_header() {
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
                        "التخطيط الاستراتيجي للمنظمات لصغيرة والمتوسطة",
                        style: TextStyle(
                            fontSize: Shared.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor),
                      ))))
        ],
      ),
    );
  }

  Widget course_details_body() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        width: Shared.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kAboutcourse.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                      "1- مطلوب مصمم سعودي تعمل عن بعد دعائية\n 2- لمنتجات الشركة التواصل الاجتماعي تويتر\n 3-سناب شاب ,انستجرام اخرى إن وجد\n",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 15)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(krequiredskills.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                      "Adobe Photoshop \nAdobe After Effects \nCinema 4D- Maxon",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kAcademyname.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "Adobe Photoshop ",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kNumberofseats.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "23",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kcourselocation.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "Cinema 4D- Maxon",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(kcoursetype.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "عن بعد",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Expanded(child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Padding(
                         padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                         child: Text(kStartDate.tr(),
                             style: TextStyle(
                                 color: kGreenColor,
                                 fontWeight: FontWeight.bold, fontSize: 15))),
                     Text(
                         "15 ديسمبر 2023",
                         style: TextStyle(
                           //fontWeight: FontWeight.bold,
                             fontSize: 15)),
                   ],
                 )),
                 Expanded(child: Column(
                   children: [
                     Padding(
                         padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                         child: Text(kenddate.tr(),
                             style: TextStyle(
                                 color: kGreenColor,
                                 fontWeight: FontWeight.bold, fontSize: 15))),
                     Text(
                         "30 ديسمبر 2023",
                         style: TextStyle(
                           //fontWeight: FontWeight.bold,
                             fontSize: 15)),
                   ],
                 ))
               ],
             )


            ],
          ),
        ));
  }
}