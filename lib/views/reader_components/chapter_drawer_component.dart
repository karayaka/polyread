// ...existing code...
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/reader_controller.dart';

class ChapterDrawerComponent extends GetView<ReaderController> {
  const ChapterDrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.menu_book, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Obx(
                    () => Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.bookFromDb?.bookTitle ?? 'Bölümler',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${controller.chapters.length} bölüm',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: TextField(
                onChanged: (v) => controller.filterChapters(v),
                decoration: InputDecoration(
                  hintText: 'Bölümlerde ara...',
                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: controller.chapters.isEmpty
                    ? Center(
                        child: Text(
                          'Bölüm bulunamadı',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: controller.chapters.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final ch = controller.chapters[index];
                          return Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey.shade200,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              title: Text(
                                ch.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.open_in_new),
                                onPressed: () async {
                                  try {
                                    // chapters' href büyük ihtimalle bir CFI veya href. display ile dene.
                                    await controller.epubController.display(
                                      cfi: ch.href,
                                    );
                                    Get.back();
                                  } catch (e) {
                                    // fallback: try to parse as location if API differs
                                    try {
                                      controller.epubController.display(
                                        cfi: controller.chapters[index].href,
                                      );
                                      Get.back();
                                    } catch (_) {
                                      Get.snackbar('Hata', 'Bölüme gidilemedi');
                                    }
                                  }
                                },
                              ),
                              onTap: () async {
                                try {
                                  await controller.epubController.display(
                                    cfi: ch.href,
                                  );
                                  Get.back();
                                } catch (e) {
                                  try {
                                    controller.epubController.display(
                                      cfi: controller.chapters[index].href,
                                    );
                                    Get.back();
                                  } catch (_) {
                                    Get.snackbar('Hata', 'Bölüme gidilemedi');
                                  }
                                }
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),

            // List
          ],
        ),
      ),
    );
  }
}
// ...existing code...