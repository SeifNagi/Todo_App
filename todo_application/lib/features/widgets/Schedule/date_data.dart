import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/utils/Colors/colors.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/components/main_text.dart';

class DateDataItem extends StatelessWidget {
  final Map item;
  const DateDataItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(int.parse('${item['color']}'.split('(0X')[0])),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color:
                          Color(int.parse('${item['color']}'.split('(0X')[0]))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainText(
                            textcontent: 'Start at:${item['starttime']}',
                            textcolor: white_color,
                            isBold: false,
                          ),
                          MainText(
                            textcontent: 'End at:${item['endtime']}',
                            textcolor: white_color,
                            isBold: false,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainText(
                            textcontent: '${item['title']}',
                            textcolor: white_color,
                            isBold: false,
                          ),
                          IconButton(
                            onPressed: () {
                              AppBloc.get(context).updateData(1, item['ID']);
                            },
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: white_color,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
