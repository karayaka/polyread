import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';
import 'package:polyread/data/repositories/vocabulary_repository.dart';

class VocabularyHistoryController extends BaseController {
  late final VocabularyRepository _vocabularyRepository;

  var vocabularyHistory = <VocabularyStorageModel>[].obs;
  var isLoading = false.obs;
  var isPromoVisible = true.obs;

  var isSpeaking = false.obs;
  late final FlutterTts flutterTts;

  @override
  void onInit() {
    super.onInit();
    flutterTts = FlutterTts();
    _vocabularyRepository = Get.find<VocabularyRepository>();

    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });
    flutterTts.setCancelHandler(() {
      isSpeaking.value = false;
    });
    flutterTts.setErrorHandler((msg) {
      isSpeaking.value = false;
      errorMessage("Seslendirme hatası: $msg");
    });
  }

  Map<String, List<VocabularyStorageModel>> get groupedVocabulary {
    final Map<String, List<VocabularyStorageModel>> groups = {};
    for (var vocab in vocabularyHistory) {
      if (!groups.containsKey(vocab.languageCode)) {
        groups[vocab.languageCode] = [];
      }
      groups[vocab.languageCode]!.add(vocab);
    }
    return groups;
  }

  Future loadVocabularyHistory() async {
    try {
      isLoading.value = true;
      var history = await _vocabularyRepository.getHistoryVocabulary();
      vocabularyHistory.assignAll(history);
      isLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      isLoading.value = false;
    }
  }

  Future toggleLearnStatus(int id, bool learned) async {
    try {
      await _vocabularyRepository.toggleLearnVocabulary(id, learned);
      // If marked as learned, remove from history view locally
      if (learned) {
        vocabularyHistory.removeWhere((v) => v.id == id);
      } else {
        // Technically, this view won't be used to unlearn if it disappears,
        // but if we support unlearning on this page we'd reload.
        // We'll just reload the history to be safe.
        loadVocabularyHistory();
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future toggleShowStatus(int id, bool show) async {
    try {
      await _vocabularyRepository.toggleShowVocabulary(id, show);
      if (!show) {
        // If they hide it from history, remove it locally
        vocabularyHistory.removeWhere((v) => v.id == id);
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future deleteVocabulary(int id) async {
    try {
      await _vocabularyRepository.deleteVocabulary(id);
      vocabularyHistory.removeWhere((v) => v.id == id);
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future speak(String sourceWord, String langCode, int speetType) async {
    var lang = Tools.languges.firstWhereOrNull((l) => l.key == langCode);
    if (lang == null) {
      errorMessage("Dil bilgisi bulunamadı");
      return;
    }

    if (isSpeaking.value) return;
    isSpeaking.value = true;

    try {
      await flutterTts.setLanguage(
        "${lang.key}-${lang.key2}",
      ); // en-US vs. TR için nasıl kayıtlı ki..
      String ttsLang = (lang.key2 != null && lang.key2!.isNotEmpty)
          ? "${lang.key}-${lang.key2}"
          : lang.key;

      await flutterTts.setLanguage(ttsLang);
      await flutterTts.setPitch(1.0);
      if (speetType == 1) {
        await flutterTts.setSpeechRate(0.50);
      } else {
        await flutterTts.setSpeechRate(0.25);
      }

      await flutterTts.speak(sourceWord);
      isSpeaking.value = false;
    } catch (e) {
      isSpeaking.value = false;
      errorMessage("Seslendirme başlatılamadı");
    }
  }
}
