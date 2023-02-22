
import '../../Base/common/file_export.dart';

Widget no_data_widget({BuildContext? context, }) {
  return Center(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.do_not_disturb_alt,size: 50,),
        Text(knodata.tr() ,
        style: TextStyle(color: kBlackColor,fontWeight: FontWeight.bold),)
      ],
    ),
  );
}
