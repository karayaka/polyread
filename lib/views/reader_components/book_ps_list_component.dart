import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/horizontal_selector.dart';
import 'package:polyread/data/controllers/reader_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BookPsListComponent extends GetView<ReaderController> {
  const BookPsListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.bookLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return _buildList();
    });
  }

  Widget _buildList() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle bar
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Text(
                "Notlar ve Vurgular",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // Tag Filter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: HorizontalSelector(
                selectedItem: controller.selectedTag,
                list: controller.tagSelectModel,
                onSelected: (tag) {
                  controller.selectedTag = tag.key;
                  controller.filterPsTags();
                },
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                itemCount: controller.psList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  var ps = controller.psList[i];
                  return Container(
                    decoration: BoxDecoration(
                      color: ps.colorHex != null
                          ? Color(ps.colorHex!).withValues(alpha: 0.1)
                          : Colors.blue.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: ps.colorHex != null
                            ? Color(ps.colorHex!).withValues(alpha: 0.2)
                            : Colors.blue.withValues(alpha: 0.1),
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (ps.pageCfi != null) {
                          Get.back();
                          controller.epubController.display(cfi: ps.pageCfi ?? "");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"${ps.text}"',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            if (ps.ps != null && ps.ps!.isNotEmpty) ...[
                              const SizedBox(height: 12),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "Not: ${ps.ps}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                            if ((ps.tags?.length ?? 0) > 0) ...[
                              const SizedBox(height: 12),
                              _getTags(ps.tags),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Obx(() {
              if (controller.isPsListBannerLoaded.value &&
                  controller.psListBannerAd != null) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                  child: Center(
                    child: SizedBox(
                      width: controller.psListBannerAd!.size.width.toDouble(),
                      height: controller.psListBannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: controller.psListBannerAd!),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }

  Widget _getTags(List<String>? tags) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: (tags ?? []).map((tag) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "#$tag",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      );
}
