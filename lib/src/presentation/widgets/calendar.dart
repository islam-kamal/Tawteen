import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:code/src/Base/common/file_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  String? publishStartDate;
  String? publishEndDate;
  CustomCalendar({this.publishStartDate,this.publishEndDate});
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime?> _dialogCalendarPickerValue =[] ;
  @override
  void initState() {
    DateTime now = new DateTime.now();
     _dialogCalendarPickerValue = [
      new DateTime(now.year, now.month, now.day),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildCalendarDialogButton();
  }

  String _getValueText(CalendarDatePicker2Type datePickerType, List<DateTime?> values,) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  _buildCalendarDialogButton() {
    const dayTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle =
    TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
        dayTextStyle: dayTextStyle,
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: kGreenColor,
        closeDialogOnCancelTapped: true,
        firstDayOfWeek: 1,
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
        dayTextStylePredicate: ({required date}) {
          TextStyle? textStyle;
          if (date.weekday == DateTime.saturday ||
              date.weekday == DateTime.sunday) {
            textStyle = dayTextStyle;
          }
          if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
            textStyle = anniversaryTextStyle;
          }
          return textStyle;
        },
        dayBuilder: ({
          required date,
          textStyle,
          decoration,
          isSelected,
          isDisabled,
          isToday,
        }) {
          Widget? dayWidget;
          if (date.day % 3 == 0 && date.day % 9 != 0) {
            dayWidget = Container(
              decoration: decoration,
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      MaterialLocalizations.of(context).formatDecimal(date.day),
                      style: textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27.5),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isSelected == true
                              ? Colors.white
                              : Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return dayWidget;
        });
    return InkWell(
        onTap: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: config,
            dialogSize: const Size(325, 400),
            borderRadius: BorderRadius.circular(15),
            initialValue: _dialogCalendarPickerValue,
            dialogBackgroundColor: Colors.white,
          );
          if (values != null) {


            if(widget.publishStartDate == null){

              String format = "MM/dd/yyyy";
              var formatted = DateFormat(format).format(values[0]!);

              print("formatted : ${formatted}");
          //    final String formatted = DateFormat.yMd('es').format(values[0]!);
              sharedPreferenceManager.writeData(CachingKey.PUBLISH_END_DATE,formatted);
              Shared.searchSpecficJobsEntity.publishEndDate =formatted;
              widget.publishEndDate = formatted;
            }else{
              String format = "MM/dd/yyyy";
              var formatted = DateFormat(format).format(values[0]!);
              Shared.searchSpecficJobsEntity.publishStartDate =formatted;
              sharedPreferenceManager.writeData(CachingKey.PUBLISH_START_DATE,formatted);
              widget.publishStartDate = formatted;
            }

            setState(() {
              _dialogCalendarPickerValue = values;
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kBlackColor)
          ),
          height: Shared.width * 0.13,
          child: Row(
            children: [
              Icon(Icons.date_range,color: kBlackColor,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 5),
             child:  Text( widget.publishStartDate?? widget.publishEndDate!),)
            ],
          ),
        ),
      )
    ;
  }


}