import 'package:flutter/material.dart';

enum FavoriteMethod { flutter, kotlin, swift, reactNative }
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  FavoriteMethod _method = FavoriteMethod.flutter;
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Gender",
            style: TextStyle(fontSize: 19),),
         Row(
           children: [Expanded(child:  ListTile(
             title: const Text('Flutter'),
             leading: Radio<FavoriteMethod>(
               value: FavoriteMethod.flutter,
               groupValue: _method,
               onChanged: (value) {
                 setState(() {
                   _method = value!;
                 });
               },
             ),
           )),
             Expanded(child: ListTile(
               title: const Text('Kotlin'),
               leading: Radio<FavoriteMethod>(
                 value: FavoriteMethod.kotlin,
                 groupValue: _method,
                 onChanged: (value) {
                   setState(() {
                     _method = value!;
                   });
                 },
               ),
             )),],
         )

        ],
      )
    ;
  }
}