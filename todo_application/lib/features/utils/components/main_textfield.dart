import 'package:flutter/material.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class MainTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  //FormFieldValidator<String> valiadate;
  double width;
  bool isbold;
  MainTextField(
      {Key? key,
      this.widget,
      //required this.valiadate,
      required this.controller,
      this.width = double.infinity,
      this.isbold = false,
      required this.title,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          textcontent: title,
          isBold: isbold,
          FontSize: 16,
        ),
        Container(
          height: 40,
          width: width,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: lightgrey_color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: grey_color),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  //validator: valiadate,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  style: const TextStyle(color: black_color),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 12, top: 10),
                    isDense: true,
                    hintText: hint,
                    border: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: white_color,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              widget == null ? Container() : Container(child: widget),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
