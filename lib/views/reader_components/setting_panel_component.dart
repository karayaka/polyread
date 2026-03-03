import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:polyread/data/controllers/reader_controller.dart';
import 'package:polyread/views/reader_components/book_ps_list_component.dart';

class SettingPanelComponent extends GetView<ReaderController> {
  const SettingPanelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Ayarlar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Text(" Yazı Boyutu: "),
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
                  title: Text('Son Kayıtlı Sayfaya Git'),
                  onTap: controller.gotoLastSavedPage,
                ),
                ListTile(
                  leading: Icon(
                    Icons.mark_chat_read,
                    color: Colors.yellow.shade600,
                  ),
                  title: Text('Notlar'),
                  onTap: _showAllPs,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showAllPs() {
    Get.back();
    if (controller.pagePsModels.isEmpty) {
      controller.warningMessage(
        "Bu kitap için kaydedilmiş bir not bulunmamaktadır.",
      );
      return;
    }
    Get.bottomSheet(BookPsListComponent());
  }
}
