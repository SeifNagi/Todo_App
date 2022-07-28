import 'package:flutter/material.dart';
import 'package:todo_application/features/pages/addtask_screen.dart';
import 'package:todo_application/features/pages/schedule_screen.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/Colors/notification.dart';
import 'package:todo_application/features/widgets/AddTask/task_appbar.dart';
import 'package:todo_application/features/widgets/Board/all_tasks.dart';
import 'package:todo_application/features/widgets/Board/completed_tasks.dart';
import 'package:todo_application/features/widgets/Board/favorite_taks.dart';
import 'package:todo_application/features/widgets/Board/uncompleted_tasks.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: white_color,
            bottom: const TabBar(
              labelColor: black_color,
              indicatorColor: black_color,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color.fromRGBO(200, 200, 200, 1.0),
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Uncompleted',
                ),
                Tab(
                  text: 'Favorite',
                ),
              ],
            ),
            title: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: TitleAppBar(appbar_title: 'Board')),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScheduleScreen()),
                  );
                },
                icon: const Icon(
                  Icons.calendar_today,
                  color: black_color,
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: const [
              TabBarView(
                children: [
                  AllTasks(),
                  CompletedTasks(),
                  UncompletedTasks(),
                  FavoriteTasks(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
