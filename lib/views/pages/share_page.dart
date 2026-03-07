import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/simple_color_picker.dart';
import 'package:polyread/data/controllers/share_controller.dart';

class SharePage extends GetView<ShareController> {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.screenshotKey == null) {
      controller.screenshotKey = GlobalKey();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Paylaş"), elevation: 0),
      body: Obx(() {
        if (controller.pageLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return _drawBody(context);
      }),
    );
  }

  SingleChildScrollView _drawBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preview/Editor Container
            _buildPreviewContainer(),
            const SizedBox(height: 8),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: "Biçim"),
                      Tab(text: "Yazı Rengi"),
                      Tab(text: "Kart Rengi"),
                    ],
                  ),
                  SizedBox(
                    height: 220,
                    child: TabBarView(
                      children: [
                        // Formatting Options
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildToggleButton(
                                      icon: Icons.format_bold,
                                      label: "Kalın",
                                      isActive: controller.isBold,
                                      onTap: () => controller.toggleBold(),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: _buildToggleButton(
                                      icon: Icons.format_underlined,
                                      label: "Alt Çizgi",
                                      isActive: controller.isUnderline,
                                      onTap: () => controller.toggleUnderline(),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),
                              _buildAlignmentSelector(),
                              const SizedBox(height: 4),
                              _buildFontSizeSlider(),
                            ],
                          ),
                        ),
                        // Text Color
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildColorPicker("Yazı Rengi", true),
                        ),
                        // Background Color
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildColorPicker("Arka Plan Rengi", false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Share Buttons
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: _buildShareButton(
                label: "Diğer Uygulamalar",
                icon: Icons.share,
                color: Colors.cyan.shade400,
                onTap: () => controller.captureAndShare("other"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewContainer() {
    return Obx(() {
      final isUnderlined = controller.isUnderline.value;

      return RepaintBoundary(
        key: controller.screenshotKey,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: controller.backgroundColor.value,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Text(
                  controller.text.value,
                  textAlign: controller.textAlign.value,
                  style: TextStyle(
                    color: controller.textColor.value,
                    fontSize: controller.fontSize.value,
                    fontWeight: controller.fontWeight.value,
                    decoration: isUnderlined ? TextDecoration.underline : null,
                    decorationColor: controller.textColor.value,
                    height: 1.6,
                  ),
                );
              }),
              const SizedBox(height: 16),
              Divider(color: controller.textColor.value.withValues(alpha: 0.3)),
              const SizedBox(height: 8),
              if (controller.bookTitle.isNotEmpty)
                Text(
                  "— ${controller.bookTitle}",
                  style: TextStyle(
                    color: controller.textColor.value,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (controller.bookAuthors.isNotEmpty)
                Text(
                  "by ${controller.bookAuthors}",
                  style: TextStyle(
                    color: controller.textColor.value.withValues(alpha: 0.8),
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "📱 Polyread",
                  style: TextStyle(
                    color: controller.textColor.value.withValues(alpha: 0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildColorPicker(String label, bool isTextColor) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Obx(() {
          final currentColor = isTextColor
              ? controller.textColor.value
              : controller.backgroundColor.value;

          return SimpleColorPicker(
            onColorSelected: (isColor) {
              if (isTextColor) {
                controller.setTextColor(isColor);
              } else {
                controller.setBackgroundColor(isColor);
              }
            },
            initialColor: currentColor,
          );
        }),
      ],
    );
  }

  Widget _buildFontSizeSlider() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yazı Boyutu: ${controller.fontSize.value.toStringAsFixed(0)}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Slider(
            value: controller.fontSize.value,
            min: 12,
            max: 36,
            divisions: 12,
            label: controller.fontSize.value.toStringAsFixed(0),
            onChanged: (value) => controller.setFontSize(value),
          ),
        ],
      );
    });
  }

  Widget _buildToggleButton({
    required IconData icon,
    required String label,
    required RxBool isActive,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isActive.value
                ? Theme.of(Get.context!).colorScheme.primary.withOpacity(0.2)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive.value
                  ? Theme.of(Get.context!).colorScheme.primary
                  : Colors.grey.shade300,
              width: isActive.value ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isActive.value
                    ? Theme.of(Get.context!).colorScheme.primary
                    : Colors.grey.shade600,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isActive.value
                      ? Theme.of(Get.context!).colorScheme.primary
                      : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildShareButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildAlignmentSelector() {
    return Obx(() {
      final align = controller.textAlign.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _alignmentIcon(Icons.format_align_left, TextAlign.left, align),
          _alignmentIcon(Icons.format_align_center, TextAlign.center, align),
          _alignmentIcon(Icons.format_align_right, TextAlign.right, align),
        ],
      );
    });
  }

  Widget _alignmentIcon(IconData icon, TextAlign value, TextAlign current) {
    return GestureDetector(
      onTap: () => controller.setTextAlign(value),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: current == value
              ? Theme.of(Get.context!).colorScheme.primary.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: current == value
              ? Theme.of(Get.context!).colorScheme.primary
              : Colors.grey.shade600,
        ),
      ),
    );
  }
}
