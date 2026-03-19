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
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Alıntıyı Paylaş",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.pageLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return _drawBody(context);
      }),
    );
  }

  Widget _drawBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildPreviewContainer(),
                  const SizedBox(height: 16),
                  _buildEditorPanel(context),
                ],
              ),
            ),
          ),
        ),
        // Share Button Fixed at Bottom
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            child: _buildShareButton(
              label: "Paylaş",
              icon: Icons.share_rounded,
              color: Theme.of(context).primaryColor,
              onTap: () => controller.captureAndShare("other"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditorPanel(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: TabBar(
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey.shade500,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorWeight: 3,
                tabs: const [
                  Tab(icon: Icon(Icons.format_paint, size: 16), text: "BİÇİM"),
                  Tab(icon: Icon(Icons.text_format, size: 16), text: "METİN"),
                  Tab(
                    icon: Icon(Icons.color_lens, size: 16),
                    text: "ARKA PLAN",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: TabBarView(
                children: [
                  // Formatting Options
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                            const SizedBox(width: 8),
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
                        const SizedBox(height: 8),
                        _buildAlignmentSelector(context),
                        const SizedBox(height: 8),
                        _buildFontSizeSlider(context),
                      ],
                    ),
                  ),
                  // Text Color
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _buildColorPicker("Metin Rengini Seçin", true),
                  ),
                  // Background Color
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _buildColorPicker("Kart Rengini Seçin", false),
                  ),
                ],
              ),
            ),
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
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: controller.backgroundColor.value,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.format_quote_rounded,
                size: 48,
                color: controller.textColor.value.withOpacity(0.15),
              ),
              const SizedBox(height: 8),
              Text(
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
              ),
              const SizedBox(height: 24),
              Divider(
                color: controller.textColor.value.withOpacity(0.2),
                thickness: 1,
              ),
              const SizedBox(height: 16),
              if (controller.bookTitle.isNotEmpty)
                Text(
                  controller.bookTitle,
                  style: TextStyle(
                    color: controller.textColor.value,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              if (controller.bookAuthors.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  "Yazar: ${controller.bookAuthors}",
                  style: TextStyle(
                    color: controller.textColor.value.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.auto_stories_rounded,
                    size: 14,
                    color: controller.textColor.value.withOpacity(0.5),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Polyread ile Paylaşıldı",
                    style: TextStyle(
                      color: controller.textColor.value.withOpacity(0.5),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildColorPicker(String label, bool isTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Obx(() {
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
        ),
      ],
    );
  }

  Widget _buildFontSizeSlider(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Yazı Boyutu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "${controller.fontSize.value.toInt()} px",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Theme.of(context).primaryColor,
              inactiveTrackColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.2),
              thumbColor: Theme.of(context).primaryColor,
              overlayColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.1),
              trackHeight: 4.0,
            ),
            child: Slider(
              value: controller.fontSize.value,
              min: 12,
              max: 36,
              divisions: 24,
              onChanged: (value) => controller.setFontSize(value),
            ),
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
      final active = isActive.value;
      return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active
                ? Theme.of(Get.context!).colorScheme.primary.withOpacity(0.15)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: active
                  ? Theme.of(Get.context!).colorScheme.primary
                  : Colors.grey.shade200,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: active
                    ? Theme.of(Get.context!).colorScheme.primary
                    : Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: active
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlignmentSelector(BuildContext context) {
    return Obx(() {
      final align = controller.textAlign.value;
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: _alignmentIcon(
                Icons.format_align_left,
                TextAlign.left,
                align,
                context,
              ),
            ),
            Expanded(
              child: _alignmentIcon(
                Icons.format_align_center,
                TextAlign.center,
                align,
                context,
              ),
            ),
            Expanded(
              child: _alignmentIcon(
                Icons.format_align_right,
                TextAlign.right,
                align,
                context,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _alignmentIcon(
    IconData icon,
    TextAlign value,
    TextAlign current,
    BuildContext context,
  ) {
    final isActive = current == value;
    return GestureDetector(
      onTap: () => controller.setTextAlign(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          size: 20,
          color: isActive
              ? Theme.of(context).primaryColor
              : Colors.grey.shade500,
        ),
      ),
    );
  }
}
