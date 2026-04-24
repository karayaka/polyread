import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polyread/data/services/external_book_service.dart';
import 'package:polyread/data/services/notification_service.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:polyread/routing/route_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = NotificationService();

  await notificationService.init();
  await MobileAds.instance.initialize();

  await notificationService.requestAndroidPermission();
  await GetStorage.init();
  await notificationService.scheduleDailyReminder();

  runApp(MyApp());

  const platform = MethodChannel('polyread/epub');

  platform.setMethodCallHandler((call) async {
    if (call.method == "openEpub") {
      final data = Map<String, dynamic>.from(call.arguments);

      final externalService = ExternalBookService.instance;
      externalService.addBook(data["path"], data["name"]);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PolyRead',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      getPages: RoutePages.pages,
      initialRoute: RouteConst.splashScrean,
      debugShowCheckedModeBanner: false,
    );
  }
}
