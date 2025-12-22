import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class CustomNotification {
  Future<void> initNotificationInsideMain() async {
    // needed if you intend to initialize in the `main` function
    WidgetsFlutterBinding.ensureInitialized();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            // requestAlertPermission: false,
            // requestBadgePermission: false,
            // requestSoundPermission: false,
            // onDidReceiveLocalNotification:
            //     (int id, String title, String body, String payload) async {
            //   didReceiveLocalNotificationSubject.add(ReceivedNotification(
            //       id: id, title: title, body: body, payload: payload));
            //}
            );

    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  Future notificationSelected(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    //selectNotificationSubject.add(payload);
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        'Channel ID', 'Contract Manger', "description",
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        importance: Importance.max);
    var iosDetails =
        new IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var generalNotificationDetail =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);

    await flutterLocalNotificationsPlugin.show(
        0,
        'Careful the contract about to end',
        'we miss u in the application',
        generalNotificationDetail);
  }
}
