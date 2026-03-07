// ...existing code...
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: const Text(
          "Son Açılanlar",
          style: TextStyle(fontWeight: FontWeight.w600),
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
                  "Henüz bir kitap açılmadı",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: history.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = history[index];
            final dateText = item.modifiedDate is DateTime
                ? (item.modifiedDate as DateTime).toLocal().toString().split(
                    ' ',
                  )[0]
                : (item.modifiedDate?.toString() ?? '');

            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
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
                item.name ?? 'İsim yok',
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
            );
          },
        );
      }),
    );
  }
}
// ...existing code...