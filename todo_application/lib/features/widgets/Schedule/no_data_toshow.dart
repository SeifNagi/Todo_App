import 'package:flutter/material.dart';
import 'package:todo_application/features/pages/addtask_screen.dart';
import 'package:todo_application/features/utils/components/main_button.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/undraw_Accept_tasks.png',
              ),
              MainText(
                  textcontent: '      Take a break \n No Tasks for today',
                  isBold: true),
              const SizedBox(
                height: 50,
              ),
              MainButton(
                buttontext: 'Add Task',
                button_action: const AddTaskScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
