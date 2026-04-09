import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/core/base_components/custom_network_image.dart';
import 'package:polyread/data/controllers/vocabulary_history_controller.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';
import 'package:store_redirect/store_redirect.dart';

class VocabularyHistoryPage extends GetView<VocabularyHistoryController> {
  const VocabularyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelime Geçmişi")),
      body: Column(
        children: [
          _buildAdBanner(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final grouped = controller.groupedVocabulary;

              if (grouped.isEmpty) {
                return const Center(
                  child: Text("Henüz kaydedilmiş kelime bulunmuyor."),
                );
              }

              if (grouped.keys.length == 1) {
                return _buildListView(grouped.values.first);
              }

              return DefaultTabController(
                length: grouped.keys.length,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: Get.theme.primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Get.theme.primaryColor,
                      tabs: grouped.keys.map((langCode) {
                        var lang = Tools.languges.firstWhereOrNull(
                          (l) => l.key == langCode,
                        );
                        return Tab(text: lang?.value ?? langCode.toUpperCase());
                      }).toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: grouped.values.map((list) {
                          return _buildListView(list);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
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

  Widget _buildAdBanner() {
    if (Platform.isAndroid) {
      return Obx(() {
        if (!controller.isPromoVisible.value) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: () => controller.isPromoVisible.value = true,
              icon: const Icon(Icons.star_border, size: 20),
              label: const Text("Önerilen Uygulamayı Göster"),
              style: TextButton.styleFrom(
                foregroundColor: Get.theme.primaryColor,
              ),
            ),
          );
        }

        return _promoCard(
          onTap: () {
            StoreRedirect.redirect(
              androidAppId: "com.cagnaz.english_questions",
            );
          },
        );
      });
    } else if (Platform.isIOS) {
      // iOS için hazırlandı. Aktif etmek isterseniz yukarıdaki Obx bloğunu kopyalayıp iOS'a göre düzenleyin.
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }

  Widget _promoCard({required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 56,
                height: 56,
                child: CustomNetworkImage(
                  url:
                      "https://cagnaz.com/service/Images/appPanel/appImages/app-83e2915d-3639-4937-b115-d334018ba4b5.png",
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "İngilizce Sorular",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: onTap,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(
                    "Kelime testleri için indirin!",
                    style: TextStyle(
                      fontSize: 13,
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => controller.isPromoVisible.value = false,
            icon: const Icon(Icons.close, size: 20, color: Colors.grey),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            tooltip: "Gizle",
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<VocabularyStorageModel> list) {
    if (list.isEmpty) {
      return const Center(
        child: Text("Bu dilde kaydedilmiş kelime bulunmuyor."),
      );
    }
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, thickness: 1),
      itemBuilder: (context, index) {
        final item = list[index];
        final isEven = index.isEven;
        return Container(
          color: isEven
              ? Colors.transparent
              : Colors.grey.withValues(alpha: 0.05),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              item.sourceWord,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(item.text, style: const TextStyle(fontSize: 16)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  if (controller.isSpeaking.value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.volume_down),
                    tooltip: 'Yavaş Oku',
                    onPressed: () {
                      controller.speak(item.sourceWord, item.languageCode, 1);
                    },
                  );
                }),
                Obx(() {
                  if (controller.isSpeaking.value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.volume_up),
                    tooltip: 'Normal Oku',
                    onPressed: () {
                      controller.speak(item.sourceWord, item.languageCode, 2);
                    },
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  color: Colors.green,
                  tooltip: 'Öğrendim',
                  onPressed: () {
                    controller.toggleLearnStatus(item.id, true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
