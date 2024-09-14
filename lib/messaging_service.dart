import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    final NotificationSettings notificationSettings =
        await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      debugPrint("User granted permission");
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("User granted provisional permission");
    } else {
      debugPrint("User denied or didn't accept notification permissions");
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }
}
