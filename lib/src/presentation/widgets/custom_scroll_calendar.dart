import 'package:code/src/Base/common/file_export.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import 'package:intl/intl.dart' as ui;

class CustomScrollCalendar extends StatefulWidget {
  bool? start_year;

  CustomScrollCalendar({this.start_year=false,});

  @override
  _CustomScrollCalendarState createState() => _CustomScrollCalendarState();
}

class _CustomScrollCalendarState extends State<CustomScrollCalendar> {
  DateTime _selectedDate = DateTime.now();
   String formatted = "";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil.defaultSize.width * 0.1),
                  topRight:Radius.circular( ScreenUtil.defaultSize.width * 0.1)
              ),
              borderSide: BorderSide(color: kWhiteColor)
          ),
          builder: (context) {
            return  Directionality(
                textDirection: translator.activeLanguageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: Shared.width * 0.6,
                              child: ScrollDatePicker(
                                selectedDate: _selectedDate,
                                locale: Locale('en'),
                                onDateTimeChanged: (DateTime value) {
                                  setState(() {
                                    _selectedDate = value;
                                  });
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Shared.width * 0.1,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(kcancel.tr(),
                                            style: TextStyle(color: kGreenColor))),
                                  ),
                                  SizedBox(
                                    width: Shared.width * 0.1,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          print("_selectedDate : ${_selectedDate}");
                                          formatted = ui.DateFormat.yMMM().format(_selectedDate);

                                          print("formatted : ${formatted.split(' ')}");
                                          if (widget.start_year!) {
                                            sharedPreferenceManager.writeData(CachingKey.START_MONTH, formatted.split(' ')[0]);
                                            sharedPreferenceManager.writeData(CachingKey.START_YEAR, formatted.split(' ')[1]);
                                          } else {
                                            sharedPreferenceManager.writeData(CachingKey.END_MONTH, formatted.split(' ')[0]);
                                            sharedPreferenceManager.writeData(CachingKey.END_YEAR, formatted.split(' ')[1]);
                                          }
                                          Navigator.pop(context);
                                          setState(() {

                                          });
                                        },
                                        child: Text(
                                          kset.tr(),
                                          style: TextStyle(color: kGreenColor),
                                        )),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )));
          },
        );
      },
      child:  Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: kGreyColor),
          ),
        ),
        child: ListTile(
          title: Text(widget.start_year! ?kstart_date.tr(): kenddate.tr()),
          subtitle: Text("${formatted == ""?widget.start_year! ?kstart_date.tr(): kenddate.tr()
          : formatted}"),
          trailing:  Icon(
            Icons.date_range,
            color: kBlackColor,
          ),
        ),
      ),
    );

  }
}
