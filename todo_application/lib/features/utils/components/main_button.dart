import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';

class MainButton extends StatelessWidget {
  final String buttontext;
  Color button_text_color;
  Color button_backcolor;
  final button_action;

  double fontsize;
  MainButton(
      {Key? key,
      required this.buttontext,
      this.button_backcolor = green_color,
      this.button_text_color = white_color,
      required this.button_action,
      this.fontsize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: button_backcolor),
      child: TextButton(
          child: Text(
            buttontext,
            style: TextStyle(color: button_text_color, fontSize: fontsize),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => button_action),
            );
          }),
    );
  }
}
