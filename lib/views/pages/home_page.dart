import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:polyread/views/pages/external_history_page.dart';
import 'package:polyread/views/pages/library_page.dart';
import 'package:polyread/views/pages/my_books_page.dart';
import 'package:polyread/views/pages/vocabulary_history_page.dart';

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
