import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class todo_item extends StatelessWidget {
  final Map item;
  const todo_item({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: green_color,
          child: MainText(
            textcontent: '${item['id']}',
            isBold: true,
            textcolor: white_color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        MainText(
          textcontent: '${item['id']}',
          isBold: false,
        ),
      ],
    );
  }
}
