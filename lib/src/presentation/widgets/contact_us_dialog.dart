import 'package:code/src/Base/common/file_export.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsDialog extends StatelessWidget {
  BuildContext? context;
  ContactUsDialog({this.context});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:  AlertDialog(
          title: Column(
            children: [
             Row(children: [
               CircleAvatar(
                 radius: Shared.width / 20,
                 backgroundColor: kGreenColor,
                 child: IconButton(
                   icon: Icon(
                     Icons.close,
                     color: kBlackColor,
                     size: Shared.width / 17,
                   ),
                   onPressed: () {
                     Navigator.pop(context);
                   },
                 ),
               ),
             ],),
              SizedBox(height: 50,),
              Text(
                kcontactusmessage.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.greenAccent),
                textAlign: TextAlign.center,
              ),
              Container(
                width: Shared.width * 0.2,
                height: 10,
                color: kGreenColor,
              )
            ],
          ),
          alignment: Alignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.call,
                      color: kGreenColor.withOpacity(0.5),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _makePhoneCall("920005068");
                        },
                        child: Text("920005068"),
                      ))
                ],
              ),
              SizedBox(
                height: Shared.width * 0.07,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.email,
                      color: kGreenColor.withOpacity(0.5),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _openEmail("info@tga.gov.sa");
                        },
                        child: Text("info@tga.gov.sa"),
                      ))
                ],
              )
            ],
          ),
        ),);
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _openEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }
}
