import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../../core/app_tools/words.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;

  NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));

    const android = AndroidInitializationSettings('@mipmap/launcher_icon');

    const ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(android: android, iOS: ios);

    await _notifications.initialize(settings: settings);
  }

  Future<void> scheduleDailyReminder() async {
    final random = Random();
    final quote1 = AppWords.quotes[random.nextInt(AppWords.quotes.length)];
    final quote2 = AppWords.quotes[random.nextInt(AppWords.quotes.length)];

    final nTitle1 = quote1['author'] ?? 'Günün Sözü';
    final nBody1 = quote1['quote'] ?? 'Okumak güzeldir.';

    final nTitle2 = quote2['author'] ?? 'Günün Sözü';
    final nBody2 = quote2['quote'] ?? 'Okumak güzeldir.';

    final now = tz.TZDateTime.now(tz.local);

    // Bugün 20:30 geçtiyse yarından başla, geçmediyse bugün
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day + 1,
      20,
      30,
    );

    await cancelDailyReminder();

    await _notifications.zonedSchedule(
      id: 100,
      title: nTitle1,
      body: nBody1,
      scheduledDate: scheduledDate,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'reading_channel',
          'Reading Reminder',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );

    await _notifications.zonedSchedule(
      id: 101,
      title: nTitle2,
      body: nBody2,
      scheduledDate: scheduledDate.add(const Duration(days: 3)),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'reading_channel',
          'Reading Reminder',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  // Notification iptal
  Future<void> cancelDailyReminder() async {
    await _notifications.cancel(id: 100);
    await _notifications.cancel(id: 101);
  }

  Future<void> requestAndroidPermission() async {
    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }
}
