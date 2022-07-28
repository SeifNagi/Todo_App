import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/utils/blocs/cubit.dart';
import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/widgets/Schedule/date_data.dart';

class EveryDayData extends StatelessWidget {
  const EveryDayData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      AppBloc.get(context).getDatabyDate();
                    },
                    child: ListView.separated(
                        itemBuilder: (context, index) => DateDataItem(
                            item: AppBloc.get(context).todobyday[index]),
                        separatorBuilder: (context, index) => Container(
                              height: 2,
                            ),
                        itemCount: AppBloc.get(context).todobyday.length),
                  ),
                )
              ],
            ),
          );
        });
  }
}
