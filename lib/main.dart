import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // 🔔 ANDROID 13+ izin iste
  await notificationService.requestAndroidPermission();
  await GetStorage.init();

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PolyRead',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      getPages: RoutePages.pages,
      initialRoute: RouteConst.splashScrean,
      //home: HomePage(), //todo: splash yapılacak
    );
  }
}

//todo sor oluşturmak için ia
//https://chatgpt.com/c/6985b492-3ad0-832b-98f8-8041391a827c çalışma
//modeller https://openrouter.ai/models?max_price=0.1
//kullandığım model https://openrouter.ai/arcee-ai/trinity-large-preview:free/api
//api llm api key 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
