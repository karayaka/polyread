import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polyread/core/base_components/badge_card_component.dart';
import 'package:polyread/data/controllers/profile_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
              Text(
                "reading_time_badges".tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildReadingTimeBadges(minutes),
              const SizedBox(height: 32),
              Text(
                "streak_badges".tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildStreakBadges(streak),
              const SizedBox(height: 32),
              Text(
                "language_settings".tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildLanguageSelector(context),
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
              "reading_average".tr,
              "$minutes",
              "min_per_day".tr,
              Icons.timer,
            ),
            Container(height: 50, width: 1, color: Colors.grey.shade300),
            _buildStatItem(
              context,
              "longest_streak".tr,
              "$streak",
              "days".tr,
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
    final minLabel = Get.locale?.languageCode == 'de' ? 'Min.' : 'min';
    final trMinLabel = Get.locale?.languageCode == 'tr' ? 'dk' : minLabel;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        BadgeCardComponent(
          title: "badge_earned_starter".tr,
          subtitle: "30 $trMinLabel",
          icon: Icons.star_border,
          color: Colors.blue,
          isEarned: minutes >= 30,
        ),
        BadgeCardComponent(
          title: "badge_earned_determined".tr,
          subtitle: "60 $trMinLabel",
          icon: Icons.star_half,
          color: Colors.teal,
          isEarned: minutes >= 60,
        ),
        BadgeCardComponent(
          title: "badge_earned_bookworm".tr,
          subtitle: "90 $trMinLabel",
          icon: Icons.star,
          color: Colors.purple,
          isEarned: minutes >= 90,
        ),
        BadgeCardComponent(
          title: "badge_earned_legend".tr,
          subtitle: "120 $trMinLabel",
          icon: Icons.workspace_premium,
          color: Colors.amber,
          isEarned: minutes >= 120,
        ),
      ],
    );
  }

  Widget _buildStreakBadges(int streak) {
    final dayLabel = "days".tr;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        BadgeCardComponent(
          title: "badge_streak_warmup".tr,
          subtitle: "3 $dayLabel",
          icon: Icons.whatshot,
          color: Colors.orangeAccent,
          isEarned: streak >= 3,
        ),
        BadgeCardComponent(
          title: "badge_streak_disciplined".tr,
          subtitle: "7 $dayLabel",
          icon: Icons.local_fire_department,
          color: Colors.deepOrange,
          isEarned: streak >= 7,
        ),
        BadgeCardComponent(
          title: "badge_streak_addicted".tr,
          subtitle: "30 $dayLabel",
          icon: Icons.fireplace,
          color: Colors.red,
          isEarned: streak >= 30,
        ),
        BadgeCardComponent(
          title: "badge_streak_legend".tr,
          subtitle: "100 $dayLabel",
          icon: Icons.military_tech,
          color: Colors.amber,
          isEarned: streak >= 100,
        ),
      ],
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    final currentLocale = Get.locale ?? const Locale('tr');
    String currentLanguageName = 'lang_tr'.tr;
    if (currentLocale.languageCode == 'en') currentLanguageName = 'lang_en'.tr;
    if (currentLocale.languageCode == 'es') currentLanguageName = 'lang_es'.tr;
    if (currentLocale.languageCode == 'fr') currentLanguageName = 'lang_fr'.tr;
    if (currentLocale.languageCode == 'de') currentLanguageName = 'lang_de'.tr;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.language, color: Colors.blue),
        title: Text('select_language'.tr),
        subtitle: Text(currentLanguageName),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _showLanguageSelectionDialog(context),
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'select_language'.tr,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              _buildLanguageOption('lang_tr'.tr, 'tr'),
              _buildLanguageOption('lang_en'.tr, 'en'),
              _buildLanguageOption('lang_es'.tr, 'es'),
              _buildLanguageOption('lang_fr'.tr, 'fr'),
              _buildLanguageOption('lang_de'.tr, 'de'),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String name, String code) {
    final isSelected = (Get.locale?.languageCode ?? 'tr') == code;
    return ListTile(
      title: Text(name),
      trailing: isSelected ? Icon(Icons.check, color: Get.theme.primaryColor) : null,
      onTap: () {
        final locale = Locale(code);
        Get.updateLocale(locale);
        final box = GetStorage();
        box.write('app_locale', code);
        Get.back();
      },
    );
  }
}
