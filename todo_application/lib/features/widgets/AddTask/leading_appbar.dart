import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: black_color,
      ),
    );
  }
}
