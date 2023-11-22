import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Message received in background: ${message.notification?.title}');
  }
}
// notif fcm token
// ezwxYa22Q_CF4FhdV6XCPi:APA91bFs9RoWE3gTWMsr7A7pxY4jZMppYhNvuUDu3zTxElUi6T4pEK7yLk77XbMpwUB6O8OJs2oS-eRBmBTzyf-3PXejIjolQ_7M2tPsHeaSPE0E_6vWA73DpYaBsoor3dcky2eweqvs

class FirebaseMessagingHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //inisialisasi notification channel untuk android
  final _androidChannel = const AndroidNotificationChannel(
    'channel_notification',
    'High Importance Notification',
    description: 'Used For Notification',
    importance: Importance.defaultImportance,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initPushNotification() async {
    //allow user to give permission for notification
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }

    //get token messaging
    _firebaseMessaging.getToken().then((token) {
      if (kDebugMode) {
        print('FCM Token: $token');
      }
    });

    //handler terminated message
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      // print("terminatedNotification : ${message!.notification?.title}");
      if (message != null && message.notification != null) {
        if (kDebugMode) {
          print("terminatedNotification : ${message.notification!.title}");
        }
      }
    });

    //handler onbackground message
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    //handler foreground message with local notification
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
      if (kDebugMode) {
        print(
            'Message received while app is in foreground: ${message.notification?.title}');
      }
    });

    //handler when open the message
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
            'Message opened from notification: ${message.notification?.title}');
      }
    });
  }

  Future initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android =
        AndroidInitializationSettings('@mipmap-hdpi/ic_launcher.png');
    const settings = InitializationSettings(android: android, iOS: ios);

    await _localNotification.initialize(settings);
  }
}
