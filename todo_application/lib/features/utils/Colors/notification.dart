import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/features/pages/board_screen.dart';

/*class notification extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: const Icon(Icons.circle_notifications),
        onPressed: () {
          notify(title,body);
          /*AwesomeNotifications().actionStream.listen((receivedNotification) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BoardScreen()),
            );
          });*/
        },
      ),
    ));
  }
}*/

void notify(title, body) async {
  String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1, channelKey: 'key1', title: title, body: body),
    schedule:
        NotificationInterval(interval: 1, timeZone: timezone, repeats: false),
  );
}
