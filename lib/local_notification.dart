import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/standalone.dart';


class local_notification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return local_notificationState();
  }
}

class local_notificationState extends State<local_notification> {

  FlutterLocalNotificationsPlugin notification = FlutterLocalNotificationsPlugin();


  @override
  void initState() {
    var androidInit = AndroidInitializationSettings('ic_launcher');
    var iosInit = IOSInitializationSettings();
    var settingInit = InitializationSettings(android: androidInit, iOS: iosInit);

    notification.initialize(settingInit,onSelectNotification: (s){Navigator.pushNamed(context, "TapBar");});
    super.initState();
  }

   Future showNotification() async {
    var androidDetails = const AndroidNotificationDetails(
        "channelId", "channelName", channelDescription: "channelDescription",
        importance: Importance.max);
    var iosDetails=const IOSNotificationDetails();
    var notiDetails=NotificationDetails(android: androidDetails,iOS: iosDetails);
    await notification.show(1, "title", "body", notiDetails, );


  }

  @override
  Widget build(BuildContext context) {
    double? width;
    Size size = MediaQuery
        .of(context)
        .size;
    width = size.width;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("local_notification"),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: showNotification,
                child: const Text("show regular notification")),
            ElevatedButton(
                onPressed: handler,
                child: const Text("show handler notification")),
            ElevatedButton(
                onPressed: delete, child: const Text("delete  notification")),
          ],
        ),
      ),
    );
  }


  handler() {}

  delete() {
    notification.cancel(0);
  }
}

// class NotificationApi {
//
//   static Future notificationDetails() async {
//     return const NotificationDetails(
//         iOS: IOSNotificationDetails(),
//         android: AndroidNotificationDetails(
//           'channelid',
//           'channelname',
//           channelDescription: "ssss",
//           importance: Importance.max,
//         ));
//   }
//
//   static Future showNotification(
//       int id ,String title, String body, String payload) async {
//     print("woooooooo");
//     return notification.show(id, title, body, await notificationDetails(),
//         payload: payload);
//   }
//
// }
//
// class SecondTry {
//   static final FlutterLocalNotificationsPlugin notification =
//   FlutterLocalNotificationsPlugin();
//
// }
