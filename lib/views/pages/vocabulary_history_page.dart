import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/vocabulary_history_controller.dart';

class VocabularyHistoryPage extends GetView<VocabularyHistoryController> {
  const VocabularyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VocabularyHistoryController());
    return const Placeholder();
  }
}
