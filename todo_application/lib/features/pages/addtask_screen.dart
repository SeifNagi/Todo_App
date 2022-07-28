import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/features/pages/board_screen.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/Colors/notification.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/components/main_button.dart';
import 'package:todo_application/features/utils/components/main_textfield.dart';
import 'package:todo_application/features/utils/constants/date_differ_styles.dart';
import 'package:todo_application/features/utils/constants/different_cont_values.dart';
import 'package:todo_application/features/utils/constants/different_lists.dart';
import 'package:todo_application/features/widgets/AddTask/leading_appbar.dart';
import 'package:todo_application/features/widgets/AddTask/circular_colors.dart';
import 'package:todo_application/features/widgets/AddTask/task_appbar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = date_now;
  TimeOfDay selected_starttime = time;
  TimeOfDay selected_endtime = time;
  var hint_time = DateFormat.jm();
  var formkey = GlobalKey<FormState>();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width - 60;

    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: white_color,
              elevation: 1.0,
              leading: const LeadingAppBar(),
              title: TitleAppBar(
                appbar_title: 'Add Task',
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainTextField(
                        //controller: title_controller,
                        title: 'Title',
                        hint: 'Enter your title',
                        /*valiadate: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'not title written for todo';
                    } else {
                      return null;
                    }
                  },*/
                        controller: AppBloc.get(context).titleController,
                      ),
                      MainTextField(
                        title: 'Date',
                        controller: AppBloc.get(context).dateController,
                        /*valiadate: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'no Datechossen';
                    } else if (value.contains(date_now) date_now) {
                    } else {
                      return null;
                    }
                  },*/
                        hint: date_month_year_seperated_by_minus
                            .format(selectedDate),
                        widget: IconButton(
                          onPressed: () async {
                            DateTime? _pickerDate = await showDatePicker(
                              context: context,
                              initialDate: date_now,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2051),
                            );
                            if (_pickerDate != null) {
                              setState(
                                () {
                                  selectedDate = _pickerDate;
                                },
                              );
                              String splittedDate =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);

                              AppBloc.get(context).dateController.text =
                                  splittedDate;
                            } else {
                              debugPrint('No date chossen');
                            }
                          },
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextField(
                            title: 'Start Time',
                            controller:
                                AppBloc.get(context).startTimeController,
                            hint: selected_starttime.format(context),
                            /*valiadate: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'not start time chossen';
                        } else {
                          return null;
                        }
                      },*/
                            width: width / 2,
                            widget: IconButton(
                              onPressed: () async {
                                var _pickerstarttime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial);

                                setState(
                                  () {
                                    selected_starttime = _pickerstarttime!;
                                  },
                                );
                                String stime = TimeOfDay(
                                        hour: selected_starttime.hour,
                                        minute: selected_starttime.minute)
                                    .toString();
                                List extract_the_time = stime.split('(');
                                List remove_the_last_bracket =
                                    extract_the_time[1].split(')');
                                AppBloc.get(context).startTimeController.text =
                                    remove_the_last_bracket[0];
                              },
                              icon: const Icon(Icons.timer),
                            ),
                          ),
                          MainTextField(
                            title: 'End time',
                            controller: AppBloc.get(context).endTimeController,
                            /*valiadate: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'no start time chossen';
                        } else {
                          return null;
                        }
                      },*/
                            hint: selected_endtime.format(context),
                            width: width / 2,
                            widget: IconButton(
                              onPressed: () async {
                                var _pickerendtime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial);

                                if (_pickerendtime != null) {
                                  print('No Date choosen');
                                } else if (selected_endtime == DateTime.now()) {
                                  print('invalid choosen time');
                                }
                                setState(
                                  () {
                                    selected_endtime = _pickerendtime!;
                                  },
                                );
                                String etime = TimeOfDay(
                                        hour: selected_endtime.hour,
                                        minute: selected_endtime.minute)
                                    .toString();
                                List extract_the_time = etime.split('(');
                                List remove_the_last_bracket =
                                    extract_the_time[1].split(')');
                                AppBloc.get(context).endTimeController.text =
                                    remove_the_last_bracket[0];
                              },
                              icon: const Icon(Icons.timer),
                            ),
                          ),
                        ],
                      ),
                      MainTextField(
                        title: 'Remind',
                        controller: AppBloc.get(context).remindController,
                        /*valiadate: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'no remind chossen';
                    } else {
                      return null;
                    }
                  },*/
                        hint: "$initial_selected_reminder minutes early",
                        widget: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (String? remindvalue) {
                            setState(() {
                              initial_selected_reminder =
                                  int.parse(remindvalue!);
                              AppBloc.get(context).remindController.text =
                                  remindvalue;
                            });
                          },
                          items: remindlist.map<DropdownMenuItem<String>>(
                            (int value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      MainTextField(
                        title: 'Repeat',
                        controller: AppBloc.get(context).repeatController,
                        /*valiadate: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'not start time chossen';
                    } else {
                      return null;
                    }
                  },*/
                        hint: initial_selected_repeat,
                        widget: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (String? repeatvalue) {
                            setState(
                              () {
                                initial_selected_repeat = repeatvalue!;
                                AppBloc.get(context).repeatController.text =
                                    repeatvalue;
                              },
                            );
                          },
                          items: repeatlist.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Row(
                        children: const [
                          CicularColors(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: green_color),
                        child: TextButton(
                            child: const Text(
                              'Create a task',
                              style:
                                  TextStyle(color: white_color, fontSize: 20),
                            ),
                            onPressed: () async {
                              /*if (formkey.currentState!.validate()) {
                            debugPrint(
                                'Start Time: ${AppBloc.get(context).startTimeController.text}');
                            debugPrint(
                                'End Time: ${AppBloc.get(context).endTimeController.text}');
                            debugPrint(
                                'Date : ${AppBloc.get(context).dateController.text}');
                            debugPrint(
                                'Title: ${AppBloc.get(context).titleController.text}');
                            debugPrint(
                                'Remind: ${AppBloc.get(context).remindController.text}');
                            debugPrint(
                                'repeat: ${AppBloc.get(context).repeatController.text}');
                          }*/
                              String title =
                                  AppBloc.get(context).titleController.text;
                              String body =
                                  "Begins at: ${AppBloc.get(context).startTimeController.text} \n Ends at: ${AppBloc.get(context).endTimeController.text}";

                              /*notify(title, body);
                            AwesomeNotifications()
                                .actionStream
                                .listen((receivedNotification) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BoardScreen(),
                                ),
                              );
                            });*/

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BoardScreen(),
                                ),
                              );
                              notify(title, body);
                              AppBloc.get(context).insertData();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          // });
        });
  }
}
