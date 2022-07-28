import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class TitleAppBar extends StatelessWidget {
  String appbar_title;
  TitleAppBar({Key? key, required this.appbar_title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainText(
      textcontent: appbar_title,
      isBold: true,
    );
  }
}
