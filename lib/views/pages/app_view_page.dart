import 'package:cagnaz_apps/cagnaz_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppViewPage extends StatelessWidget {
  const AppViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CagnazApps(appName: "PolyRead", desc: 'app_view_description'.tr);
  }
}
