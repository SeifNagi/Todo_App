import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/constants/date_differ_styles.dart';

class MainCalenderTimeline extends StatelessWidget {
  const MainCalenderTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      monthTextStyle: const TextStyle(fontSize: 0),
      height: 80,
      width: 44,
      selectionColor: green_color,
      initialSelectedDate: DateTime.now(),
      onDateChange: (date) {
        date_now = date;
        String choosendate = DateFormat('dd-MM-yyyy').format(date);
        AppBloc.get(context).date = choosendate;
        AppBloc.get(context).getDatabyDate();
        print(choosendate);
      },
    ); /*DatePicker(
      DateTime.now(),
      monthTextStyle: const TextStyle(fontSize: 0),
      height: 80,
      width: 44,
      selectionColor: green_color,
      initialSelectedDate: DateTime.now(),
      onDateChange: (date) {
        date_now = date;
        String choosendate = DateFormat('dd-MM-yyyy').format(date);
        
        print(choosendate);
      },
    );*/
    /*Container(
      height: 100,
      child: AnimatedHorizontalCalendar(
          tableCalenderIcon: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          date: DateTime.now(),
          textColor: Colors.black45,
          backgroundColor: Colors.white,
          tableCalenderThemeData: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            colorScheme: ColorScheme.light(primary: Colors.green),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          selectedColor: green_color,
          onDateSelected: (date) {
            String selectedDate = date;
            String choosendate = DateFormat('dd-MM-yyyy').format(date);
            AppBloc.get(context).date = choosendate;
          },),
    ); */
  }
}
