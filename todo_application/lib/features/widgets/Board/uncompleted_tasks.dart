import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/pages/addtask_screen.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/components/main_button.dart';
import 'package:todo_application/features/widgets/Board/todo_item.dart';
import 'package:todo_application/features/widgets/Schedule/no_data_toshow.dart';

class UncompletedTasks extends StatelessWidget {
  const UncompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var listsize = AppBloc.get(context).uncompletedtodo;
          return ConditionalBuilder(
              condition: listsize.length > 0,
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(const Duration(seconds: 1));
                              AppBloc.get(context).getAllData();
                            },
                            child: ListView.separated(
                                itemBuilder: (context, index) => TodoItem(
                                    item: AppBloc.get(context)
                                        .uncompletedtodo[index]),
                                separatorBuilder: (context, index) => Container(
                                      height: 1,
                                      color: lightgrey_color,
                                    ),
                                itemCount: AppBloc.get(context)
                                    .uncompletedtodo
                                    .length),
                          ),
                        ),
                        MainButton(
                          buttontext: 'Add Task',
                          button_action: const AddTaskScreen(),
                        ),
                      ],
                    ),
                  ),
              fallback: (context) => NoData());
        });
  }
}
