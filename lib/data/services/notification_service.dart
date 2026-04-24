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
    await cancelDailyReminder();
    final random = Random();
    final now = tz.TZDateTime.now(tz.local);

    // Uygulamaya her girildiğinde, önümüzdeki 15 gün için (her güne farklı söz) baştan kuruyoruz.
    for (int i = 1; i < 17; i += 3) {
      final quote = AppWords.quotes[random.nextInt(AppWords.quotes.length)];
      final nTitle = quote['author'] ?? 'Günün Sözü';
      final nBody = quote['quote'] ?? 'Okumak güzeldir.';

      var scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day + i, // i=0 bugün, i=1 yarın ...
        20,
        00,
      );

      // Eğer i=0 (bugün) için saat 20:00 çoktan geçtiyse, geçmişe kurmamak için atlıyoruz
      if (scheduledDate.isBefore(now)) {
        continue;
      }

      await _notifications.zonedSchedule(
        id: 100 + i, // Her gün için farklı bir ID (100, 101, 102...)
        title: nTitle,
        body: nBody,
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
    }
  }

  // Notification iptal (15 günlük döngü kurulduğu için hepsini siliyoruz)
  Future<void> cancelDailyReminder() async {
    for (int i = 0; i < 15; i++) {
      await _notifications.cancel(id: 100 + i);
    }
  }

  Future<void> requestAndroidPermission() async {
    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }
}
