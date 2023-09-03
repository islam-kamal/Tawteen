import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class UnAuthorizedUserWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child:   Padding(padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                child: Icon(Icons.person,size: Shared.width * 0.1,),
              ),
              Text(kauthorization.tr(),
                style: TextStyle(color: kBlackColor),
                textAlign: TextAlign.center,

              ),
              Padding(padding: EdgeInsets.symmetric(vertical: Shared.width * 0.1),
                  child:  CustomButtonWidget(
                    button_text: ksignin.tr(),
                    width: Shared.width * 0.9,
                    height: Shared.width * 0.13,
                    onPress: ()async{
                      var profileProvider = Provider.of<ProfileProvider>(context,listen: false);
                      profileProvider.changeProfileStatus( status: false);
                     customAnimatedPushNavigation(context, SiginScreen(
                        from_profile: true,
                      ));
                    },
                  )
              )
            ],
          ),
        ));
  }

}