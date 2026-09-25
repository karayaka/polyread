import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/custom_tag_selector.dart';
import 'package:polyread/data/controllers/edit_tag_controller.dart';

class EditTagComponent extends GetView<EditTagController> {
  final int id;
  final String title;
  const EditTagComponent({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditTagController(id: id));
    controller.init();
    return Obx(
      () => controller.loading.value
          ? SizedBox(
              height: 50,
              child: const Center(child: CircularProgressIndicator()),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: context.textTheme.titleMedium),
                const Divider(),
                CustomTagSelector(
                  stringTagController: controller.tagController,
                  suggestion: controller.suggestionTags,
                  initialTags: controller.initialTags,
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: Get.back,
                      icon: const Icon(Icons.cancel, color: Colors.white),
                      label: Text(
                        "cancel".tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                    const Spacer(),
                    controller.saveLoading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                            onPressed: controller.saveTags,
                            icon: const Icon(Icons.save, color: Colors.white),
                            label: Text(
                              "save".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                  ],
                ),
              ],
            ),
    );
  }
}
