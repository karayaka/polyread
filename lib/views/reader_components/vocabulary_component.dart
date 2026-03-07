import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/vocabulary_controller.dart';

class VocabularyComponent extends GetView<VocabularyController> {
  const VocabularyComponent({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VocabularyController());
    controller.loadVocabulary(word);
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            "Çeviri Sonuçları",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Obx(() {
            if (controller.translateLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.vocabularyData?.translation != null &&
                controller.languge != null) {
              var data = controller.vocabularyData!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 0),
                    Text(
                      "Seçim:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(data.sourceText ?? "", style: TextStyle(fontSize: 18)),
                    Divider(height: 0),
                    Text(
                      "Anlamı:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.translation ?? "",
                      style: TextStyle(fontSize: 16),
                    ),
                    Divider(height: 0),
                    Text(
                      "Dil:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Chip(label: Text(controller.languge?.value ?? "")),
                        IconButton(
                          onPressed: () => controller.speak(1),
                          icon: Icon(Icons.play_arrow),
                        ),
                        IconButton(
                          onPressed: () => controller.speak(2),
                          icon: Icon(Icons.slow_motion_video),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Bir şeyler ters gitti"));
            }
          }),
        ],
      ),
    );
  }
}
