import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class TodoItem extends StatelessWidget {
  final Map item;
  const TodoItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mycolor = '0XFF3CAF50';
    //Color test = 'black_color';
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Dismissible(
          key: UniqueKey(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Color(int.parse('${item['color']}'.split('(0X')[0])),
                    radius: 14,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MainText(
                      textcontent: '${item['title']}',
                      isBold: false,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        AppBloc.get(context).updateData(1, item['ID']);
                      },
                      icon: Icon(Icons.check_circle)),
                  IconButton(
                      onPressed: () {
                        AppBloc.get(context).UpdateToFavData(1, item['ID']);
                      },
                      icon: Icon(Icons.favorite_border_outlined))
                ],
              ),
            ]),
          ),
          onDismissed: (direction) {
            AppBloc.get(context).removeData(item['ID']);
          },
          background: Container(
            color: Color(
              int.parse('${item['color']}'.split('(0X')[0]),
            ),
          ),
        );
      },
    );
  }
}
