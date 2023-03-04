import 'package:code/src/Base/common/file_export.dart';

class UnAuthorizedUserWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child:   Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                child: Icon(Icons.do_not_disturb,size: Shared.width * 0.2,),),
              Text(kauthorization.tr(),
                style: TextStyle(color: kBlackColor),

              ),
              Padding(padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                  child:  CustomButtonWidget(
                    button_text: ksignin.tr(),
                    width: Shared.width * 0.9,
                    height: Shared.width * 0.13,
                    onPress: ()async{
                      customAnimatedPushNavigation(context, SiginScreen());
                    },
                  )
              )
            ],
          ),
        ));
  }

}