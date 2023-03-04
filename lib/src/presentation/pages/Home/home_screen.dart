import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Courses/courses_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_screen.dart';
import 'package:code/src/presentation/pages/Jobs/Available_jobs/available_jobs.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<ElementEntity> home_data = [
    ElementEntity(
        image: ImageAssets.look_job,
        title: klookingforjob,
        screen: LookForJobScreen()),
    ElementEntity(
        image: ImageAssets.available_job,
        title: kavailablejobs,
        screen: AvailableJobsScreen()),
    ElementEntity(
        image: ImageAssets.course,
        title: ktrainingcourses,
        screen: CoursesScreen()),
    ElementEntity(image: ImageAssets.initiative, title: kinitiatives,
    screen: InitativesScreen())
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return NetworkIndicator(
        child: PageContainer(
            child: Directionality(
      textDirection: translator.activeLanguageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBarWidget.appBarWidget(
          context: context,
          icon: false,
        ),
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Container(
              color: kHaviyGreenColor,
              child: Column(
                children: [
                  Shared.vistor_value == 'visitor' ? Container(height: Shared.width * 0.1): welcome(),
                  Container(
                    height: Shared.height,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Shared.width * 0.08),
                        topLeft: Radius.circular(Shared.width * 0.08),
                      ),
                    ),
                    child: ListView.builder(
                        itemCount: home_data.length,
                        itemBuilder: (context, index) {
                          return home_element(
                            title: home_data[index].title,
                            image: home_data[index].image,
                            screen: home_data[index].screen,
                          );
                        }),
                  )
                ],
              )),
        ),
      ),
    )));
  }

  Widget welcome() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.1),
      child: Container(
        height: Shared.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded(
                child: Row(
              children: [
                Text(
                  kwelcome.tr(),
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                 " ${translator.activeLanguageCode == 'en' ? Shared.nafathInfoEntity!.enFirst!.toLowerCase()
                      : Shared.nafathInfoEntity!.arFirst!.toLowerCase()} ",
              //  "مؤيد امين",
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                )
              ],
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    color: kWhiteColor.withOpacity(0.7),
                  ),
                  SavedJobsDropDown(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget home_element({String? image, String? title, Widget? screen}) {
    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, screen!);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Shared.width * 0.015, horizontal: Shared.width * 0.08),
        child: Container(
          height: Shared.width * 0.28,
          width: Shared.width * 0.8,
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    image!,
                    width: Shared.width * 0.1,
                    height: Shared.width * 0.1,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    title!.tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: Shared.width * 0.05,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
