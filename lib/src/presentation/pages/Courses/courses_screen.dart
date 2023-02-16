import 'package:code/src/Base/common/file_export.dart';


class CoursesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CoursesScreenState();
  }

}
class CoursesScreenState extends State<CoursesScreen>{
  List<CourseEntity> course_list = [
    CourseEntity(image:ImageAssets.look_job,
        title: "التخطيط الاستراتيجي للمنظمات الصغيرة والمتوسطة",
        category: "عن بعد",
      publish_date: "26/3/2023",),
    CourseEntity(image:ImageAssets.company1,
        title: "التخطيط الاستراتيجي للمنظمات الصغيرة والمتوسطة",
        category: "حضورى",
      publish_date: "26/3/2023",),
    CourseEntity(image:ImageAssets.company3,
        title: "التخطيط الاستراتيجي للمنظمات الصغيرة والمتوسطة",
        category: "عن بعد",
      publish_date: "26/3/2023",),
    CourseEntity(image:ImageAssets.company2,
        title: "التخطيط الاستراتيجي للمنظمات الصغيرة والمتوسطة",
        category: "حضورى",
      publish_date: "26/3/2023",),
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
                context: context, icon: true, route: HomeScreen()),
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
                                    Text(ktrainingcourses.tr(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                  ],
                                ),),

                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: Shared.width * 0.1,
                                ),
                                child:ListView.builder(
                                    itemCount: course_list.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Shared.width * 0.02,
                                            horizontal: Shared.width * 0.04),
                                        child: course_element(
                                            courseEntity: course_list[index]),
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

  Widget course_element({CourseEntity? courseEntity}) {
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, CourseDetailsScreen());
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
                child:Image.asset(courseEntity!.image!,fit: BoxFit.cover,)
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
                              courseEntity.title!,
                              style: TextStyle(
                                  fontSize: Shared.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor),
                            )  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:1,
                                child:        Text(
                                  courseEntity.publish_date!,
                                  style: TextStyle(
                                      fontSize: Shared.width * 0.03,
                                      color: kGreyColor),
                                )
                            ),
                            Expanded(
                                flex:1,
                                child:  Text(
                                  courseEntity.category!,
                                  style: TextStyle(
                                      fontSize: Shared.width * 0.035,
                                      color: kGreyColor),
                                )
                            ),
                            Expanded(
                                flex:1,
                                child: translator.activeLanguageCode == 'ar' ? InkWell(
                                  onTap: () async {
                                    await FlutterShare.share(
                                        title: courseEntity.title!,
                                        text: courseEntity.category!,
                                        linkUrl: 'https://flutter.dev/',
                                        chooserTitle: 'Example Chooser Title');
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        kshare.tr(),
                                        style: TextStyle(
                                            fontSize: Shared.width * 0.03,
                                            color: kGreyColor),
                                      ),
                                      ImageIcon(AssetImage(ImageAssets.share,),color: kGreenColor,)
                                    ],
                                  ) ,
                                )  : InkWell(
                                    onTap: () async {
                                      await FlutterShare.share(
                                          title: courseEntity.title!,
                                          text:  courseEntity.title!,
                                          linkUrl: 'https://flutter.dev/',
                                          chooserTitle: 'Example Chooser Title');
                                    },
                                    child: Row(
                                  children: [
                                    ImageIcon(AssetImage(ImageAssets.share,),
                                      size: Shared.width * 0.06,
                                      color: kGreenColor,),

                                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      kshare.tr(),
                                      style: TextStyle(
                                          fontSize: Shared.width * 0.03,
                                          color: kGreyColor),
                                    ),)
                                  ],
                                ))
                            ),
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