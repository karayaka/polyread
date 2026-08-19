import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:polyread/data/controllers/reader_controller.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SettingPanelComponent extends GetView<ReaderController> {
  const SettingPanelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () async {
                            await controller.saveBookmark();
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: controller.isSavedLocation.value
                                ? Get.theme.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          controller.openChapterDrawer();
                          Get.back();
                        },
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                  Text(
                    'settings'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 0),
            // Actions
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(" ${'font_size'.tr}: "),
                  IconButton(
                    onPressed: () =>
                        controller.setFontSize(controller.fontSize.value - 1),
                    icon: Icon(Icons.remove),
                  ),

                  Obx(
                    () => Expanded(
                      child: Slider(
                        value: controller.fontSize.value,
                        min: 10,
                        max: 30,
                        divisions: 20,
                        label: '${controller.fontSize.value.round()}',
                        onChanged: (double value) =>
                            controller.setFontSize(value),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        controller.setFontSize(controller.fontSize.value + 1),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.line_axis_outlined,
                      color: Colors.blue.shade600,
                    ),
                    title: Text('go_to_last_saved_page'.tr),
                    onTap: controller.gotoLastSavedPage,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.mark_chat_read,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('my_notes'.tr),
                    onTap: _showAllPs,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Obx(() {
              if (controller.isSettingBannerLoaded.value &&
                  controller.settingBannerAd != null) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Center(
                    child: SizedBox(
                      width: controller.settingBannerAd!.size.width.toDouble(),
                      height: controller.settingBannerAd!.size.height
                          .toDouble(),
                      child: AdWidget(ad: controller.settingBannerAd!),
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

  void _showAllPs() {
    Get.back();
    if (controller.pagePsModels.isEmpty) {
      controller.warningMessage("no_notes_saved_for_book".tr);
      return;
    }
    Get.toNamed(RouteConst.psListPage);
  }
}
