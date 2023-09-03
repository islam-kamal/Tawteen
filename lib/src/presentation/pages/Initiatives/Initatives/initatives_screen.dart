import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/INitativesModel/initatives_model.dart';
import 'package:code/src/data/models/JobModel/all_jobs_model.dart';
import 'package:code/src/domain/entities/search_result_entity.dart';
import 'package:code/src/presentation/bloc/Initatives_Bloc/initatives_bloc.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/search_jobs_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/initatives_detatils_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InitativesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InitativesScreenState();
  }
}

class InitativesScreenState extends State<InitativesScreen> {

  @override
  void initState() {
    initatives_bloc.add(GetAllInitativesEvent());
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
              appBar: AppBarWidget.appBarWidget(
                  context: context, icon: true, route: HomeScreen()),
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
                      child: BlocBuilder(
                        bloc: initatives_bloc,
                        builder: (context,state){
                          if(state is Loading){
                            return Padding(
                              padding: EdgeInsets.only(top: Shared.width * 0.4, ),
                              child: Center(
                                  child: Shared.spinkit
                              ),
                            );
                          }
                          else if(state is Done){
                            return StreamBuilder<InitativesModel>(
                                stream: initatives_bloc.all_initatives_subject,
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
                                                        kinitiatives.tr() ,
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
                                                      itemCount: snapshot.data!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: Shared.width * 0.02,
                                                              horizontal: Shared.width * 0.02),
                                                          child: initatives_element(
                                                              initatives: snapshot.data!.data![index]),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      else
                                        return no_data_widget(context: context,center: true);
                                  }
                                });

                          }
                          else if(state is ErrorLoading){
                            return no_data_widget(context: context,center: true);
                          }
                          return Container();
                        },
                      )


                  )
              ),
            )),
      ),
    );
  }

  Widget initatives_element({Initatives? initatives}) {

    return InkWell(
      onTap: () {
        customAnimatedPushNavigation(context, InitativesDetailsScreen(
          iniatives_id: initatives!.id.toString(),
          screen: InitativesScreen(),
          previous_iniatives_status: false,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      //  vertical: Shared.width * 0.01,
                        horizontal: Shared.width * 0.02),
                    child: /*Image.asset(ImageAssets.placeholder)*/
                  FadeInImage(
                      image: NetworkImage(
                          baseUrl + initatives!.initiativeImage!.firstWhere(
                                  (element) => element.status ==1).filePath!,
                      ),
                      placeholder: AssetImage(ImageAssets.placeholder,),

                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            ImageAssets.placeholder,
                            fit: BoxFit.fitHeight,
                        );
                      },
                     height: Shared.width * 0.2,
                      fit: BoxFit.fill,
                    )
                )),
            Expanded(
                flex: 5,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Shared.width * 0.02,
                        horizontal: Shared.width * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Shared.width * 0.02,
                            ),
                            child: Text(
                              initatives!.title!,
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
                                      initatives.startDate!.toString().substring(0,10),
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
                                      initatives.endDate!.toString().substring(0,10),
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
