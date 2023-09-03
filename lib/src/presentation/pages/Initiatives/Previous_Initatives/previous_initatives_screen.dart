import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/InitativesModel/previous_initatives_model.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/data/models/PreviousJobModel/previous_job_model.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';
import 'package:code/src/presentation/bloc/Previous_Initatives_Bloc/previous_initatives_bloc.dart';
import 'package:code/src/presentation/bloc/Previous_Job_Bloc/previous_job_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/update_applied_initative_screen.dart';
import 'package:provider/provider.dart';

class PreviousIntativesScreen extends StatefulWidget {

  final String notification_job_id;
  PreviousIntativesScreen({this.notification_job_id= ""});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreviousIntativesScreenState();
  }
}

class PreviousIntativesScreenState extends State<PreviousIntativesScreen> {
  @override
  void initState() {
    previousInitativesBloc.add(GetPreviousInitativesEvent());
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
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(60.w), // here the desired height
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
                      leading: translator.activeLanguageCode == 'ar'
                          ? IconButton(
                              onPressed: () {
                                customAnimatedPushNavigation(
                                    context, HomeScreen());
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
                                customAnimatedPushNavigation(
                                    context, HomeScreen());
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
                            ))),
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
                                    ksubmittedinitatives.tr(),
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
                                child: BlocBuilder(
                                  bloc: previousInitativesBloc,
                                  builder: (context, state) {
                                    if (state is Loading) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          top: Shared.width * 0.8,
                                        ),
                                        child: Center(
                                          child: Shared.spinkit,
                                        ),
                                      );
                                    }
                                    else if (state is Done) {
                                      return StreamBuilder<PreviousInitativesModel>(
                                          stream: previousInitativesBloc.previous_initatives_subject,
                                          builder: (context, snapshot) {
                                            switch (snapshot.connectionState) {
                                              case ConnectionState.none:
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    top: Shared.width * 0.8,
                                                  ),
                                                  child: Center(
                                                      child: Shared.spinkit),
                                                );
                                              case ConnectionState.done:
                                                return Text('');
                                              case ConnectionState.waiting:
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    top: Shared.width * 0.8,
                                                  ),
                                                  child: Center(
                                                      child: Shared.spinkit),
                                                );
                                              case ConnectionState.active:
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(snapshot.error
                                                        .toString()),
                                                  );
                                                }
                                                else if (snapshot.data!.data!.length > 0) {
                                                  return ListView.builder(
                                                      itemCount: snapshot.data!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: Shared.width * 0.02,
                                                              horizontal: Shared.width * 0.01),
                                                          child: previous_initative_element(
                                                              previousInitative: snapshot.data!.data![index]),
                                                        );
                                                      });
                                                } else
                                                  return no_data_widget(context: context, center: true);
                                            }
                                          });
                                    }
                                    else if (state is ErrorLoading) {
                                      return no_data_widget(
                                          context: context, center: true);
                                    }
                                    return Container();
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ))),
        ),
      ),
    );
  }

  Widget previous_initative_element({PreviousInitative? previousInitative}) {

    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(
            context,
            InitativesDetailsScreen(
              iniatives_id: previousInitative!.initiativeId!.toString(),
              previous_iniative_id: previousInitative.id.toString(),
              screen: PreviousIntativesScreen(),
              show_cancellation_status: true,
              previous_iniatives_status: previousInitative.status == 8 ||
                      previousInitative.status == 10
                  ? true
                  : false,
            ));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Shared.width * 0.02),
              border: Border.all(color: widget.notification_job_id.toString() == previousInitative!.initiativeId.toString() ?
              kHaviyGreenColor : kInactiveColor,
                  width: widget.notification_job_id.toString() == previousInitative.initiativeId.toString() ? 3 : 1)),
          height: Shared.width * 0.35,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Shared.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                      color:
                      Shared.status_color(previousInitative!.status).color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Shared.width * 0.01),
                          topRight: Radius.circular(Shared.width * 0.01))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "${Shared.status_color(previousInitative.status).status}",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kWhiteColor),
                        textAlign: TextAlign.center,
                      ),

                     previousInitative.status == 8 || previousInitative.status == 10  ?
                     IconButton(
                          onPressed: () {
                            customAnimatedPushNavigation(context, InitativesDetailsScreen(
                              iniatives_id: previousInitative.initiativeId!.toString(),
                              previous_iniative_id: previousInitative.id.toString(),
                              screen: PreviousIntativesScreen(),
                              show_cancellation_status: true,
                              previous_iniatives_status: previousInitative.status == 8 ||
                                  previousInitative.status == 10 ? true : false,
                              update_previous_iniatives_status: true,
                            ));
                          },
                          icon: Image.asset(
                            ImageAssets.editIcon,
                            height: 15,
                            color: kWhiteColor,
                          )) : Container()

                    ],
                  )

              )),
              Expanded(
                  flex: 3,
                  child:    Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Shared.width * 0.02),
                              child: /*Image.asset(ImageAssets.placeholder)*/
                            FadeInImage(
                  image: NetworkImage(
                      baseUrl + previousInitative.initiativeImage!.firstWhere((element) => element.status ==1).filePath!
                  ),
                  placeholder: AssetImage(ImageAssets.placeholder),
                  imageErrorBuilder:
                      (context, error, stackTrace) {
                    return Image.asset(
                        ImageAssets.placeholder,
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                )
                              )),
                      Expanded(
                          flex: 4,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Shared.width * 0.01),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Shared.width * 0.02,
                                  ),
                                  child: Text(
                                    previousInitative.title!,

                                    style: TextStyle(
                                        fontSize: Shared.width * 0.04,
                                        fontWeight: FontWeight.bold,
                                        color: kBlackColor),
                                  ))))
                    ],
                  ))),
            ],
          )),
    );
  }
}

class JobStatus {
  Color? color;
  String? status;
  JobStatus({this.color, this.status});
}
