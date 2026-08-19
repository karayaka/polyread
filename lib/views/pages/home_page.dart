import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:polyread/data/controllers/vocabulary_history_controller.dart';
import 'package:polyread/views/pages/external_history_page.dart';
import 'package:polyread/views/pages/library_page.dart';
import 'package:polyread/views/pages/my_books_page.dart';
import 'package:polyread/views/pages/vocabulary_history_page.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:store_redirect2/store_redirect2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
    _checkAppVersion();
  }

  void _checkAppVersion() async {
    try {
      if (Platform.isAndroid) {
        final info = await InAppUpdate.checkForUpdate();
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          await InAppUpdate.startFlexibleUpdate();
          await InAppUpdate.completeFlexibleUpdate();
        }
      } else {
        const params = InStoreAppVersionCheckerParams(locale: 'tr');
        var val = await InStoreAppVersionChecker.instance.checkUpdate(params);
        if (val.canUpdate) {
          if (mounted) {
            _showUpdateDialog(val.currentVersion, val.newVersion);
          }
        }
      }
    } catch (e) {
      debugPrint("Version check error: $e");
    }
  }

  void _showUpdateDialog(String? currentVersion, String? newVersion) {
    Get.dialog(
      barrierDismissible: true, // Kullanıcı boşluğa tıklayarak kapatabilir.
      AlertDialog(
        title: Text("update_available_title".tr),
        content: Text(
          "update_available_body".trParams({
            'current': currentVersion ?? '',
            'new': newVersion ?? '',
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("later".tr),
          ),
          ElevatedButton(
            onPressed: () {
              StoreRedirect.redirect(); // Uygulamanın kendi App ID'sini otomatik algılayıp mağazayı açar.
              Get.back();
            },
            child: Text("update".tr),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildScreens() {
    var screens = [
      const LibraryPage(),
      const MyBooksPage(),
      const VocabularyHistoryPage(),
    ];
    if (Platform.isAndroid) {
      screens.add(const ExternalHistoryPage());
    }

    return screens;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    var bars = [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: 'library'.tr,
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book_online),
        title: 'my_books'.tr,
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wordpress),
        title: 'my_words'.tr,
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
    if (Platform.isAndroid) {
      bars.add(
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.history),
          title: 'recently_opened'.tr,
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      );
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        onItemSelected: (index) {
          if (index == 2) {
            Get.find<VocabularyHistoryController>().loadVocabularyHistory();
          }
        },
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.style14,
      ),
    );
  }
}
