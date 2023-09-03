import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CourseModel/course_model.dart';
import 'package:code/src/presentation/bloc/Course_Bloc/course_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CoursesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CoursesScreenState();
  }

}
class CoursesScreenState extends State<CoursesScreen>{

  @override
  void initState() {
    course_bloc.add(GetAllCoursesEvent());
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
                      child: BlocBuilder(
                        bloc: course_bloc,
                        builder: (context,state){
                          if(state is Loading){
                            return Padding(
                              padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                              child: Center(
                                child: Shared.spinkit,
                              ),
                            );
                          }
                          else if(state is Done){
                            return StreamBuilder<CourseModel>(
                                stream: course_bloc.all_courses_subject,
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
                                                      itemCount: snapshot.data!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: Shared.width * 0.02,
                                                              horizontal: Shared.width * 0.04),
                                                          child: course_element(
                                                              course: snapshot.data!.data![index]),
                                                        );
                                                      }),
                                                )   ,

                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      else
                                        return no_data_widget(context: context);
                                  }
                                });

                          }else if(state is ErrorLoading){
                            return no_data_widget(context: context);
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

  Widget course_element({Course? course}) {
    String? course_type;
    switch(course!.courseType){
      case "1":
        course_type = konsite.tr();
        break;
      case "2":
        course_type = kremotly.tr();
        break;
    }

    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, CourseDetailsScreen(
          courseEntity: CourseEntity(
            course_acedemy_id: course.academyId,
            course_id: course.id,
            course_url: course.url

          ),
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
                child:  course.attachments!.isEmpty ?
                Image.asset(ImageAssets.placeholder)
                    : FadeInImage(
                  image: NetworkImage(
                      baseUrl + course.attachments!.firstWhere((element) => element.status ==1).filePath!
                  ),
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
                              course.title!,
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
                                  course.publishStartDate!,
                                  style: TextStyle(
                                      fontSize: Shared.width * 0.03,
                                      color: kGreyColor),
                                )
                            ),
                            Expanded(
                                flex:1,
                                child:  Text(
                                  course_type!,
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
                                        title: course.title!,

                                        linkUrl: '${course.url}',
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
                                          title: course.title!,
                                          //text:  courseEntity.title!,
                                          linkUrl: '${course.url}',
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