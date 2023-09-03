import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CourseModel/course_details_model.dart';
import 'package:code/src/presentation/bloc/Course_Bloc/course_bloc.dart';
import 'package:code/src/presentation/pages/Courses/course_webview.dart';

class CourseDetailsScreen extends StatefulWidget{
  CourseEntity? courseEntity;
  CourseDetailsScreen({this.courseEntity});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CourseDetailsScreenState();
  }

}

class CourseDetailsScreenState extends State<CourseDetailsScreen>{

  @override
  void initState() {
    course_bloc.add(GetCourseDetailsEvent(
      course: widget.courseEntity
    ));
    super.initState();
  }
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
                    child:  BlocBuilder(
                      bloc: course_bloc,
                      builder: (context,state){
                        if(state is Loading){
                          return Padding(
                            padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                            child: Center(
                                child: Shared.spinkit
                            ),
                          );
                        }else if(state is Done){
                          return StreamBuilder<CourseDetailsModel>(
                              stream: course_bloc.course_details_subject,
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
                                                            course_details_header(
                                                              courseDetails: snapshot.data!.data!
                                                            ),
                                                            course_details_body(
                                                                courseDetails: snapshot.data!.data!
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                                                child: CustomButtonWidget(
                                                                  button_text: kSubscribetothecourse.tr(),
                                                                  width: Shared.width ,
                                                                  height: Shared.width * 0.11,
                                                                  onPress: () {
                                                                    if(  Shared.vistor_value == 'visitor'){
                                                                      Shared.showSnackBarView(
                                                                          error_status: true,
                                                                          message:  kauthorization.tr(),
                                                                          sigin_button: true
                                                                      );
                                                                    }
                                                                    else{
                                                                      course_bloc.add(PutcourseViewCounterEvent(
                                                                        courseEntity: widget.courseEntity
                                                                      ));
                                                                      customAnimatedPushNavigation(context, CourseWebView(
                                                                        courseEntity: widget.courseEntity,
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
    );
  }

  Widget course_details_header({CourseDetails? courseDetails}) {
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
                  child: FadeInImage(
                    image: NetworkImage(baseUrl + courseDetails!.attachments!.firstWhere((element) => element.status ==1).filePath!),
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
                  /*Image.asset(ImageAssets.company1)*/
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
                        "${courseDetails.title}",
                        style: TextStyle(
                            fontSize: Shared.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor),
                      ))))
        ],
      ),
    );
  }

  Widget course_details_body({CourseDetails? courseDetails}) {
    String? course_type;
    switch(courseDetails!.courseType){
      case "1":
        course_type = konsite.tr();
        break;
      case "2":
        course_type = kremotly.tr();
        break;
    }

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
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(kAboutcourse.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                      "${courseDetails.description}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 15)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(krequiredskills.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              ListView.builder(
                  itemCount: courseDetails.skillsIdList!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return Text("${index+1} - ${courseDetails.skillsIdList![index].skillName}",
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                        fontSize: 15));
              }),


              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(kAcademyname.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "${courseDetails.academyName}",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(kNumberofseats.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "${courseDetails.noOfSeats}",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(kcourselocation.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "${courseDetails.provinceName},${courseDetails.cityName}",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Text(kcoursetype.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Text(
                  "${course_type}",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 15)),

              Padding(
                  padding: EdgeInsets.only(bottom: Shared.width * 0.05),
                  child:    Row(
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
                         "${courseDetails.publishStartDate}",
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
                         "${courseDetails.publishEndDate}",
                         style: TextStyle(
                           //fontWeight: FontWeight.bold,
                             fontSize: 15)),
                   ],
                 ))
               ],
             )
    )

            ],
          ),
        ));
  }
}