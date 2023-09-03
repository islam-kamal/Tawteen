import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/InitativesModel/initatives_details_model.dart';
import 'package:code/src/data/models/JobModel/job_details_model.dart';
import 'package:code/src/presentation/bloc/Initatives_Bloc/initatives_bloc.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/apply_job_bloc.dart';
import 'package:code/src/presentation/bloc/Jobs_Bloc/get_all_jobs_bloc.dart';
import 'package:code/src/presentation/pages/Initiatives/Initatives/apply_initative_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/previous_initatives_screen.dart';
import 'package:code/src/presentation/pages/Initiatives/Previous_Initatives/update_applied_initative_screen.dart';
import 'package:code/src/presentation/pages/Jobs/Apply_Jobs/apply_job_person_info.dart';
import 'package:code/src/presentation/pages/Jobs/Previous_Jobs/previous_jobs_screen.dart';

class InitativesDetailsScreen extends StatefulWidget {
  String? iniatives_id;
  String? previous_iniative_id;
  Widget? screen;
  bool? show_cancellation_status;
  bool? previous_iniatives_status;
  bool? update_previous_iniatives_status;
  InitativesDetailsScreen({this.iniatives_id,this.screen,this.show_cancellation_status = false,
    this.update_previous_iniatives_status = false,
    this.previous_iniatives_status,this.previous_iniative_id});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InitativesDetailsScreenState();
  }
}

class InitativesDetailsScreenState extends State<InitativesDetailsScreen> {

  @override
  void initState() {
    initatives_bloc.add(GetInitativesDtailsEvent(
        iniatives_id: widget.iniatives_id
    ));
    print("widget.previous_iniatives_status! : ${widget.previous_iniatives_status!}");
    if(widget.previous_iniatives_status!){
      sharedPreferenceManager.writeData(CachingKey.PREVIOUS_INITATIVES_ID, widget.previous_iniative_id);
    }else{
      sharedPreferenceManager.writeData(CachingKey.INITATIVES_ID, widget.iniatives_id);
    }

    super.initState();
  }
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
                context: context, icon: true, route: widget.screen),
            backgroundColor: kWhiteColor,
            body:  BlocListener(
              bloc: apply_job_bloc,
              listener: (context,state){
                if(state is Loading){
                  print("Loading");
                  Shared.showLoadingDialog(context: context);
                }
                else if(state is Done){
                  print("Done");
                  Shared.dismissDialog(context: context);

                  customAnimatedPushNavigation(context, PreviousIntativesScreen());

                }
                else if(state is ErrorLoading){
                  print("ErrorLoading : ${ state.message}");
                  Shared.dismissDialog(context: context);
                  Shared.showSnackBarView(
                      error_status: true,
                      backend_message:  state.message,
                      sigin_button: false
                  );
                }
              },
              child: Container(
                  color: kGreenColor,
                  child:Container(
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
                            return StreamBuilder<InitativesDetailsModel>(
                                stream: initatives_bloc.initative_details_subject,
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
                                        sharedPreferenceManager.writeData(CachingKey.INITATIVE_TITLE, snapshot.data!.data!.title);
                                        return   SingleChildScrollView(
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Shared.width * 0.08,
                                                  vertical: Shared.width * 0.05),
                                              child: Column(
                                                children: [

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
                                                              initative_details_header(
                                                                  initativesDetails: snapshot.data!.data
                                                              ),
                                                              initative_details_body(
                                                                  initativesDetails: snapshot.data!.data
                                                              ),
                                                       widget.update_previous_iniatives_status! ?
                                                       Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           Padding(
                                                               padding: EdgeInsets.symmetric(
                                                                   vertical: Shared.width * 0.1),
                                                               child: CustomButtonWidget(
                                                                 button_text: kupdate.tr(),
                                                                 width: Shared.width * 0.4,
                                                                 height: Shared.width * 0.13,
                                                                 onPress: () {
                                                                   customAnimatedPushNavigation(context, UpdateAppliedInitativeScreen(
                                                                     previous_iniative_id: widget.previous_iniative_id,
                                                                   ));
                                                                 },
                                                               )),
                                                           Padding(
                                                               padding: EdgeInsets.symmetric(
                                                                   vertical: Shared.width * 0.1),
                                                               child: CustomButtonWidget(
                                                                 button_text: kcancel.tr(),
                                                                 width: Shared.width * 0.4,
                                                                 height: Shared.width * 0.13,
                                                                 color: kInactiveColor,
                                                                 onPress: () {
                                                                   Navigator.pop(context);
                                                                 },
                                                               )),
                                                         ],
                                                       ) :
                                                       widget.show_cancellation_status!
                                                                  ?   widget.previous_iniatives_status! ?   Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                                                  child: CustomButtonWidget(
                                                                    button_text: kcanceljob.tr(),
                                                                    width: Shared.width ,
                                                                    height: Shared.width * 0.13  ,
                                                                    color: kRedColor,
                                                                    onPress: () {
                                                                      initatives_bloc.add(DeleteInitativeEvent());
                                                                    },
                                                                  )) : Container()
                                                                  : Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                                                                  child: CustomButtonWidget(
                                                                    button_text: kapplyinitative.tr(),
                                                                    width: Shared.width ,
                                                                    height: Shared.width * 0.13,
                                                                    onPress: () {
                                                                      if(  Shared.vistor_value == 'visitor'){
                                                                        Shared.showSnackBarView(
                                                                            error_status: true,
                                                                            message:  kauthorization.tr(),
                                                                            sigin_button: true
                                                                        );
                                                                      }
                                                                      else{
                                                                        customAnimatedPushNavigation(
                                                                            context, ApplyInitativeScreen(
                                                                          initativesDetails: snapshot.data!.data!,
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

                          }
                          else if(state is ErrorLoading){
                            return no_data_widget(context: context);
                          }
                          return Container();
                        },
                      )


                  )),
            ),

          ),
        ),
      ),
    );
  }

  Widget initative_details_header({InitativesDetails? initativesDetails}) {

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
                    image: NetworkImage(baseUrl + initativesDetails!.initiativeImage!.firstWhere((element) => element.status ==1).filePath!),
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
                /*  Image.asset(ImageAssets.company1)*/
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
                        "${initativesDetails.title}",
                        style: TextStyle(
                            fontSize: Shared.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor),
                      ))))
        ],
      ),
    );
  }

  Widget initative_details_body({InitativesDetails? initativesDetails}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.width * 0.02),
            border: Border.all(color: kInactiveColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05,
              vertical: Shared.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(ksupportdescription.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(
                      "${initativesDetails!.description}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 13))),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(ksupportterms.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(
                      "${initativesDetails.conditions}",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          fontSize: 13))),

              initativesDetails.initiativeDocument!.isEmpty
                  ? Container() :   Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                  child: Text(krequiredattachments.tr(),
                      style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold, fontSize: 17))),

              Padding(
                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.01),
                child:     ListView.builder(
                    itemCount: initativesDetails.initiativeDocument!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Text("${index+1} - ${initativesDetails.initiativeDocument![index].fileName}",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 15));
                    }),),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Shared.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                            children: [
                              Text(
                                "${kpublishdate.tr()} : ",
                                style: TextStyle(
                                    fontSize: Shared.width * 0.03,
                                    color: kGreyColor),
                              ),
                              Text(
                                "${initativesDetails.startDate.toString().substring(0,10)}",
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
                                "${kexpiredate.tr()} : ",
                                style: TextStyle(
                                    fontSize: Shared.width * 0.03,
                                    color: kGreyColor),
                              ),
                              Text(
                                "${initativesDetails.endDate.toString().substring(0,10)}",
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
