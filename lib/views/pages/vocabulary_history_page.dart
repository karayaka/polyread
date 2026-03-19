import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/data/controllers/vocabulary_history_controller.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';

class VocabularyHistoryPage extends GetView<VocabularyHistoryController> {
  const VocabularyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelime Geçmişi")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final grouped = controller.groupedVocabulary;

        if (grouped.isEmpty) {
          return const Center(
            child: Text("Henüz kaydedilmiş kelime bulunmuyor."),
          );
        }

        if (grouped.keys.length == 1) {
          return _buildListView(grouped.values.first);
        }

        return DefaultTabController(
          length: grouped.keys.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: Get.theme.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Get.theme.primaryColor,
                tabs: grouped.keys.map((langCode) {
                  var lang = Tools.languges.firstWhereOrNull(
                    (l) => l.key == langCode,
                  );
                  return Tab(text: lang?.value ?? langCode.toUpperCase());
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: grouped.values.map((list) {
                    return _buildListView(list);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildListView(List<VocabularyStorageModel> list) {
    if (list.isEmpty) {
      return const Center(
        child: Text("Bu dilde kaydedilmiş kelime bulunmuyor."),
      );
    }
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, thickness: 1),
      itemBuilder: (context, index) {
        final item = list[index];
        final isEven = index.isEven;
        return Container(
          color: isEven
              ? Colors.transparent
              : Colors.grey.withValues(alpha: 0.05),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              item.sourceWord,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(item.text, style: const TextStyle(fontSize: 16)),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  if (controller.isSpeaking.value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.volume_down),
                    tooltip: 'Yavaş Oku',
                    onPressed: () {
                      controller.speak(item.sourceWord, item.languageCode, 1);
                    },
                  );
                }),
                Obx(() {
                  if (controller.isSpeaking.value) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.volume_up),
                    tooltip: 'Normal Oku',
                    onPressed: () {
                      controller.speak(item.sourceWord, item.languageCode, 2);
                    },
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  color: Colors.green,
                  tooltip: 'Öğrendim',
                  onPressed: () {
                    controller.toggleLearnStatus(item.id, true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
