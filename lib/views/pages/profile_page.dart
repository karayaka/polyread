import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return const Placeholder();
  }
}
