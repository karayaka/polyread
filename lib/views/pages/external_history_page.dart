// ...existing code...
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/controllers/external_history_controller.dart';
import 'package:polyread/routing/route_const.dart';

class ExternalHistoryPage extends GetView<ExternalHistoryController> {
  const ExternalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ExternalHistoryController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "recently_opened".tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() {
        if (controller.pageLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final history = controller.history;
        if (history.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.history, size: 64, color: Colors.grey.shade300),
                const SizedBox(height: 12),
                Text(
                  "no_books_opened".tr,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          itemCount: history.length,
          separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
          itemBuilder: (context, index) {
            final item = history[index];
            final isEven = index.isEven;
            final dateText = item.modifiedDate is DateTime
                ? (item.modifiedDate as DateTime).toLocal().toString().split(
                    ' ',
                  )[0]
                : (item.modifiedDate?.toString() ?? '');

            return Container(
              color: isEven
                  ? Colors.transparent
                  : Colors.grey.withValues(alpha: 0.05),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      item.name != null && item.name!.isNotEmpty
                          ? item.name![0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  item.name ?? "no_name".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  dateText,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.grey.shade700),
                  onPressed: () => controller.deleteHistory(item.id),
                ),
                onTap: () {
                  Get.toNamed(
                    RouteConst.readerPage,
                    arguments: {"bookPath": item.path, "bookName": item.name},
                  );
                },
              ),
            );
          },
        );
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
    );
  }
}
// ...existing code...