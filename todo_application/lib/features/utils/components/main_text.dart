import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';

class MainText extends StatelessWidget {
  final String textcontent;
  final bool isBold;
  Color textcolor;
  FontWeight TextWeight;
  double FontSize;
  MainText(
      {Key? key,
      required this.textcontent,
      this.textcolor = black_color,
      required this.isBold,
      this.TextWeight = FontWeight.normal,
      this.FontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isBold == true) {
      TextWeight = FontWeight.bold;
      FontSize = 24;
    } else {
      TextWeight = FontWeight.normal;
    }
    return Text(
      textcontent,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: textcolor,
        fontSize: FontSize,
        fontWeight: TextWeight,
      ),
    );
  }
}
