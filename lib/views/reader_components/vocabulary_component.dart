import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/vocabulary_controller.dart';
import 'package:polyread/routing/route_fix.dart';

class VocabularyComponent extends GetView<VocabularyController> {
  const VocabularyComponent({
    super.key,
    required this.word,
    required this.bookId,
    required this.Id,
  });
  final String word;
  final String bookId;
  final int Id;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VocabularyController());
    controller.loadVocabulary(word, bookId);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle indicator
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 20),
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Obx(() {
              if (controller.translateLoading.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (controller.vocabularyData?.translation != null &&
                  controller.languge != null) {
                var data = controller.vocabularyData!;

                return Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row: Language badge & Audio controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.translate_rounded,
                                    size: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    controller.languge?.value.toUpperCase() ??
                                        "",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  _ActionIconButton(
                                    icon: Icons.volume_up_rounded,
                                    isLoading: controller.isSpeaking.value,
                                    onTap: () => controller.speak(1),
                                  ),
                                  const SizedBox(width: 8),
                                  _ActionIconButton(
                                    icon: Icons.slow_motion_video_rounded,
                                    isLoading: controller.isSpeaking.value,
                                    onTap: () => controller.speak(2),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    onPressed: () async {
                                      await controller.saveToHistory();
                                    },
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: controller.isSavedToHistory.value
                                          ? Get.theme.primaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TEXT",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: 0.6),
                                letterSpacing: 1.2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                RouteFix.toSharePage(data.sourceText ?? "", Id);
                              },
                              icon: Icon(Icons.share_rounded),
                            ),
                          ],
                        ),

                        // Source Text
                        Text(
                          data.sourceText ?? "",
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 8),
                        Divider(
                          height: 32,
                          color: Colors.grey.withValues(alpha: 0.2),
                        ),

                        // Translation Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ANLAMI",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: 0.6),
                                letterSpacing: 1.2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                RouteFix.toSharePage(
                                  data.translation ?? "",
                                  Id,
                                );
                              },
                              icon: Icon(Icons.share_rounded),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data.translation ?? "",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.translate,
                          size: 56,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Çeviri bulunamadı",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isLoading;

  const _ActionIconButton({
    required this.icon,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 44,
          height: 44,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(12),
            color: isLoading
                ? Colors.grey.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Icon(
                  icon,
                  size: 22,
                  color:
                      Theme.of(
                        context,
                      ).iconTheme.color?.withValues(alpha: 0.7) ??
                      Colors.black87,
                ),
        ),
      ),
    );
  }
}
