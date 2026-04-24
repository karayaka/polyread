import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/badge_card_component.dart';
import 'package:polyread/data/controllers/share_series_controller.dart';

class ShareSeriesPage extends GetView<ShareSeriesController> {
  const ShareSeriesPage({super.key});

  Map<String, dynamic> getTimeBadgeInfo(int level) {
    switch (level) {
      case 2:
        return {
          "title": "Başlangıç",
          "subtitle": "30 dk",
          "icon": Icons.star_border,
          "color": Colors.blue,
        };
      case 3:
        return {
          "title": "Azimli",
          "subtitle": "60 dk",
          "icon": Icons.star_half,
          "color": Colors.teal,
        };
      case 4:
        return {
          "title": "Kitap Kurdu",
          "subtitle": "90 dk",
          "icon": Icons.star,
          "color": Colors.purple,
        };
      case 5:
        return {
          "title": "Efsane",
          "subtitle": "120 dk",
          "icon": Icons.workspace_premium,
          "color": Colors.amber,
        };
      default:
        return {
          "title": "Bilinmeyen",
          "subtitle": "-",
          "icon": Icons.timer,
          "color": Colors.grey,
        };
    }
  }

  Map<String, dynamic> getStreakBadgeInfo(int level) {
    switch (level) {
      case 2:
        return {
          "title": "Isınma",
          "subtitle": "3 gün",
          "icon": Icons.whatshot,
          "color": Colors.orangeAccent,
        };
      case 3:
        return {
          "title": "Disiplinli",
          "subtitle": "7 gün",
          "icon": Icons.local_fire_department,
          "color": Colors.deepOrange,
        };
      case 4:
        return {
          "title": "Bağımlı",
          "subtitle": "30 gün",
          "icon": Icons.fireplace,
          "color": Colors.red,
        };
      case 5:
        return {
          "title": "Efsane",
          "subtitle": "100 gün",
          "icon": Icons.military_tech,
          "color": Colors.amber,
        };
      default:
        return {
          "title": "Bilinmeyen",
          "subtitle": "-",
          "icon": Icons.timer,
          "color": Colors.grey,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeBadgeInfo = getTimeBadgeInfo(controller.earnSeries.timeLevel);
    final streakBadgeInfo = getStreakBadgeInfo(
      controller.earnSeries.streakLevel,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Rozetini Paylaş")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(
                  child: RepaintBoundary(
                    key: controller.screenshotKey,
                    child: AspectRatio(
                      aspectRatio: 4 / 5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Get.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.2),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.workspace_premium,
                              size: 48,
                              color: Get.theme.primaryColor,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Yeni Rozetler Kazandım!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.earnSeries.isTimeEarned)
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1.0,
                                      child: BadgeCardComponent(
                                        title: timeBadgeInfo["title"],
                                        subtitle: timeBadgeInfo["subtitle"],
                                        icon: timeBadgeInfo["icon"],
                                        color: timeBadgeInfo["color"],
                                        isEarned: true,
                                      ),
                                    ),
                                  ),
                                if (controller.earnSeries.isTimeEarned &&
                                    controller.earnSeries.isStreakEarned)
                                  const SizedBox(width: 16),
                                if (controller.earnSeries.isStreakEarned)
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1.0,
                                      child: BadgeCardComponent(
                                        title: streakBadgeInfo["title"],
                                        subtitle: streakBadgeInfo["subtitle"],
                                        icon: streakBadgeInfo["icon"],
                                        color: streakBadgeInfo["color"],
                                        isEarned: true,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.auto_stories,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Polyread ile Paylaşıldı",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      controller.shareSeries();
                    },
                    icon: const Icon(Icons.share),
                    label: const Text("Paylaş"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
