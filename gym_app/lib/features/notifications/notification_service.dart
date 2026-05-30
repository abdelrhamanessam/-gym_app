import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'notification_service.g.dart';

class NotificationService {
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotifications;
  bool _initialized = false;

  NotificationService()
      : _messaging = FirebaseMessaging.instance,
        _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (!kIsWeb) {
        await _messaging.subscribeToTopic('all');
      }
    }

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _initialized = true;
  }

  Future<String?> getToken() async {
    return _messaging.getToken();
  }

  Future<void> saveTokenToFirestore(String userId) async {
    final token = await getToken();
    if (token == null) return;

    await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .update({
      'fcmTokens': FieldValue.arrayUnion([token]),
    });
  }

  Future<void> removeTokenFromFirestore(String userId) async {
    final token = await getToken();
    if (token == null) return;

    await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .update({
      'fcmTokens': FieldValue.arrayRemove([token]),
    });
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'gymai_channel',
          'GymAI Notifications',
          channelDescription: 'Fitness reminders and updates',
          importance: Importance.high,
          priority: Priority.high,
          showWhen: true,
          enableVibration: true,
          playSound: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: message.data['route'],
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    _onNotificationTap(null);
  }

  void _onNotificationTap(NotificationResponse? response) {
    if (response?.payload != null) {
      // Navigate to route from payload
    }
  }

  Future<void> showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _localNotifications.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'gymai_channel',
          'GymAI Notifications',
          channelDescription: 'Fitness reminders and updates',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payload,
    );
  }

  Future<void> scheduleWorkoutReminder({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    // For production, use android_alarm_manager or workmanager
    // For now, show immediately as a demo
    await showLocalNotification(
      id: id,
      title: title,
      body: body,
      payload: '/workout',
    );
  }

  Future<void> cancelNotification(int id) async {
    await _localNotifications.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages
  final notification = message.notification;
  if (notification != null) {
    final flutterLocalNotifications = FlutterLocalNotificationsPlugin();
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await flutterLocalNotifications.initialize(initSettings);
    await flutterLocalNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'gymai_channel',
          'GymAI Notifications',
          channelDescription: 'Fitness reminders and updates',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: message.data['route'],
    );
  }
}

@riverpod
NotificationService notificationService(NotificationServiceRef ref) {
  final service = NotificationService();
  return service;
}

@riverpod
Future<void> initializeNotifications(InitializeNotificationsRef ref) async {
  final service = ref.watch(notificationServiceProvider);
  await service.initialize();

  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await service.saveTokenToFirestore(user.uid);
  }
}
