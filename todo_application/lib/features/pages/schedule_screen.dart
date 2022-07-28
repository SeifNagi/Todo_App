import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/widgets/Schedule/no_data_toshow.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/components/main_text.dart';
import 'package:todo_application/features/utils/constants/date_differ_styles.dart';
import 'package:todo_application/features/widgets/AddTask/leading_appbar.dart';
import 'package:todo_application/features/widgets/AddTask/task_appbar.dart';
import 'package:todo_application/features/widgets/Schedule/date_data.dart';
import 'package:todo_application/features/widgets/Schedule/datepicker_timeline.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int size;
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          size = AppBloc.get(context).todobyday.length;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: white_color,
              elevation: 1.0,
              leading: const LeadingAppBar(),
              title: TitleAppBar(
                appbar_title: 'Schedule',
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(color: white_color),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const MainCalenderTimeline(),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(textcontent: day, isBold: true),
                        MainText(textcontent: datemonthyear, isBold: false),
                      ],
                    ),
                    size != 0
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                AppBloc.get(context).getDatabyDate();
                              },
                              child: ListView.separated(
                                  itemBuilder: (context, index) => DateDataItem(
                                      item: AppBloc.get(context)
                                          .todobyday[index]),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        height: 2,
                                      ),
                                  itemCount:
                                      AppBloc.get(context).todobyday.length),
                            ),
                          )
                        : const NoData()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
