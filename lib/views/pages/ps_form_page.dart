import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/custom_tag_selector.dart';
import 'package:polyread/core/base_components/simple_color_picker.dart';
import 'package:polyread/data/controllers/ps_form_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PsFormPage extends GetView<PsFormController> {
  const PsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () =>
                Text(controller.isEditMode.value ? "edit_note".tr : "add_note".tr),
          ),
          actions: [
            Obx(
              () => Visibility(
                visible: controller.isEditMode.value,
                child: IconButton(
                  onPressed: controller.deletePs,
                  icon: Icon(Icons.delete),
                ),
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.formLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return _buildForm();
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

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Preview Alanı
          Obx(
            () => Text(
              controller.psFormModel?.text ?? "",
              style: TextStyle(
                fontSize: 20,
                decoration: controller.isUnderline.value
                    ? TextDecoration.underline
                    : null,
                backgroundColor: Color(
                  controller.selectedColorHex.value,
                ).withValues(alpha: 0.3),
              ),
            ),
          ),

          const SizedBox(height: 4),

          /// 🔹 Not Alanı
          Text(
            "note".tr,
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),

          TextFormField(
            minLines: 4,
            maxLines: 8,
            initialValue: controller.psFormModel?.ps ?? "",
            decoration: InputDecoration(
              hintText: "note_write_here".tr,
              filled: true,
              fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.all(14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Get.theme.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) => controller.psFormModel?.ps = value,
          ),
          const SizedBox(height: 4),
          Text(
            "color".tr,
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Colors.grey.shade50,
            child: SimpleColorPicker(
              initialColor: controller.psFormModel?.colorHex != null
                  ? Color(controller.psFormModel!.colorHex!)
                  : null,
              onColorSelected: (color) {
                controller.psFormModel?.colorHex = color.toARGB32();
                controller.selectedColorHex.value = color.toARGB32();
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "tags".tr,
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          CustomTagSelector(
            stringTagController: controller.tagController,
            suggestion: controller.suggestionTags,
            initialTags: controller.psFormModel?.tags ?? [],
          ),
          const SizedBox(height: 4),
          Obx(
            () => SwitchListTile(
              title: Text("underline".tr),
              value: controller.isUnderline.value,
              activeThumbColor: Get.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onChanged: (val) => controller.isUnderline.value = val,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            if (controller.formLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () async {
                  await controller.savePs();
                },
                child: Text(
                  "save".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
