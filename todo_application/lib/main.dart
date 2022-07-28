import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/pages/board_screen.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
    'appicon',
    [
      NotificationChannel(
          channelKey: 'key1',
          channelName: 'Seif',
          channelDescription: 'Testing notification',
          playSound: true,
          defaultColor: green_color,
          ledColor: white_color,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          enableLights: true,
          enableVibration: true),
    ],
  );
  runApp(const MyApp());
  await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..createDatabase(),
        ),
      ],
      child: const MaterialApp(
        title: 'ToDo App',
        debugShowCheckedModeBanner: false,
        home: BoardScreen(),
      ),
    );
  }
}/*const MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      home: AddTaskScreen(),
    );*/
 