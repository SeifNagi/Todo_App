import 'package:flutter/material.dart';

import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class CicularColors extends StatefulWidget {
  const CicularColors({Key? key}) : super(key: key);

  @override
  State<CicularColors> createState() => _CicularColorsState();
}

class _CicularColorsState extends State<CicularColors> {
  int selected_color = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          textcontent: 'Color',
          isBold: false,
          FontSize: 18,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: List<Widget>.generate(
              5,
              (int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected_color = index;
                    });
                    AppBloc.get(context).colorController.text =
                        selected_color.toString();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? green_color
                          : index == 1
                              ? grey_color
                              : index == 2
                                  ? black_color
                                  : index == 3
                                      ? purple_color
                                      : index == 4
                                          ? blue_color
                                          : lightgrey_color,
                      child: selected_color == index
                          ? const Icon(
                              Icons.done,
                              color: white_color,
                            )
                          : Container(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
