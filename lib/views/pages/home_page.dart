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
import 'package:store_redirect/store_redirect.dart';

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
        const params = InStoreAppVersionCheckerParams(
          locale: 'tr',
          androidStore: InStoreAppVersionCheckerAndroidStoreType.apkPure,
        );
        var val = await InStoreAppVersionChecker.instance.checkUpdate(params);
        if (val.canUpdate) {
          if (mounted) {
            _showUpdateDialog(val.currentVersion, val.newVersion);
          }
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
        title: const Text("Yeni Güncelleme Mevcut!"),
        content: Text(
          "Uygulamanın yeni bir sürümü yayınlandı.\nDaha iyi bir deneyim için lütfen uygulamayı güncelleyin.\n\n"
          "Mevcut Sürüm: ${currentVersion ?? ''}\n"
          "Yeni Sürüm: ${newVersion ?? ''}",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Daha Sonra"),
          ),
          ElevatedButton(
            onPressed: () {
              StoreRedirect.redirect(); // Uygulamanın kendi App ID'sini otomatik algılayıp mağazayı açar.
              Get.back();
            },
            child: const Text("Güncelle"),
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
        title: 'Kitaplık',
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book_online),
        title: 'Kitaplarım',
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wordpress),
        title: 'Kelimelerim',
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
    if (Platform.isAndroid) {
      bars.add(
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.history),
          title: 'Son Açılanlar',
          activeColorPrimary: Get.theme.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      );
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
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
    );
  }
}
