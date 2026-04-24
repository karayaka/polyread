import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/badge_card_component.dart';
import 'package:polyread/data/controllers/profile_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profil",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final minutes = controller.average10DaysMinutes;
          final streak = controller.maxContinuousStreak;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStatsCard(context, minutes, streak),
                const SizedBox(height: 32),
                const Text(
                  "Okuma Süresi Rozetleri",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildReadingTimeBadges(minutes),
                const SizedBox(height: 32),
                const Text(
                  "Seri Rozetleri",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildStreakBadges(streak),
                const SizedBox(height: 32),
              ],
            ),
          );
        }),
        bottomNavigationBar: Obx(() {
          if (controller.isBannerLoaded.value && controller.bannerAd != null) {
            return SafeArea(
              child: SizedBox(
                width: controller.bannerAd!.size.width.toDouble(),
                height: controller.bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: controller.bannerAd!),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, int minutes, int streak) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(
              context,
              "Okuma Ortalaması",
              "$minutes",
              "dk/gün",
              Icons.timer,
            ),
            Container(height: 50, width: 1, color: Colors.grey.shade300),
            _buildStatItem(
              context,
              "En Uzun Seri",
              "$streak",
              "gün",
              Icons.local_fire_department,
              iconColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    String unit,
    IconData icon, {
    Color? iconColor,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: iconColor ?? Get.theme.primaryColor),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            Text(unit, style: const TextStyle(fontSize: 14)),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildReadingTimeBadges(int minutes) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        BadgeCardComponent(
          title: "Başlangıç",
          subtitle: "30 dk",
          icon: Icons.star_border,
          color: Colors.blue,
          isEarned: minutes >= 30,
        ),
        BadgeCardComponent(
          title: "Azimli",
          subtitle: "60 dk",
          icon: Icons.star_half,
          color: Colors.teal,
          isEarned: minutes >= 60,
        ),
        BadgeCardComponent(
          title: "Kitap Kurdu",
          subtitle: "90 dk",
          icon: Icons.star,
          color: Colors.purple,
          isEarned: minutes >= 90,
        ),
        BadgeCardComponent(
          title: "Efsane",
          subtitle: "120 dk",
          icon: Icons.workspace_premium,
          color: Colors.amber,
          isEarned: minutes >= 120,
        ),
      ],
    );
  }

  Widget _buildStreakBadges(int streak) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        BadgeCardComponent(
          title: "Isınma",
          subtitle: "3 gün",
          icon: Icons.whatshot,
          color: Colors.orangeAccent,
          isEarned: streak >= 3,
        ),
        BadgeCardComponent(
          title: "Disiplinli",
          subtitle: "7 gün",
          icon: Icons.local_fire_department,
          color: Colors.deepOrange,
          isEarned: streak >= 7,
        ),
        BadgeCardComponent(
          title: "Bağımlı",
          subtitle: "30 gün",
          icon: Icons.fireplace,
          color: Colors.red,
          isEarned: streak >= 30,
        ),
        BadgeCardComponent(
          title: "Efsane",
          subtitle: "100 gün",
          icon: Icons.military_tech,
          color: Colors.amber,
          isEarned: streak >= 100,
        ),
      ],
    );
  }
}
