import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;

  NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const ios = DarwinInitializationSettings(
      requestAlertPermission: true, // biz manuel isteyeceğiz
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(android: android, iOS: ios);

    await _notifications.initialize(settings: settings);
  }

  Future<void> scheduleDailyReminder({
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await cancelDailyReminder();

    await _notifications.zonedSchedule(
      id: 100,
      title: title,
      body: body,
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
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // 🔥 iOS için de önemli
    );
    scheduledDate.add(Duration(days: 3));

    await _notifications.zonedSchedule(
      id: 101,
      title: title,
      body: body,
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
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // 🔥 iOS için de önemli
    );
  }

  // ❌ Notification iptal
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
