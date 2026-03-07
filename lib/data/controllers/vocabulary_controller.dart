import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/services/http_service.dart';
import 'package:polyread/models/base_models/select_model.dart';
import 'package:polyread/models/service_models/vocabulary_model.dart';

class VocabularyController extends BaseController {
  var translateLoading = false.obs;
  VocabularyModel? vocabularyData;
  SelectModel? languge;
  late final FlutterTts flutterTts;

  @override
  void onInit() {
    print("0n init test");
    flutterTts = FlutterTts();
    super.onInit();
  }

  Future loadVocabulary(String word) async {
    print("Deneme: $word");
    await translateVocabulary(word);
  }

  Future translateVocabulary(String word) async {
    try {
      translateLoading.value = true;
      var data = prepareServiceModel<VocabularyModel>(
        await HttpService.instance!.get<VocabularyModel>(
          "https://tr.cagnaz.com/Translate/$word",
          VocabularyModel(),
        ),
      );
      if (Tools.languges.any((l) => l.key == data?.detectedLanguage)) {
        languge = Tools.languges.firstWhere(
          (l) => l.key == data?.detectedLanguage,
        );
        vocabularyData = data;
      } else {
        errorMessage("Desteklenmeyen dil: ${data?.detectedLanguage}");
      }

      translateLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      translateLoading.value = false;
    }
  }

  // todo vocablary history ve gösterim sayfası çalışlacak
  Future speak(int speetType) async {
    if (languge == null) {
      errorMessage("Dil bilgisi bulunamadı");
      return;
    }
    await flutterTts.setLanguage("${languge?.key}-${languge?.value}"); // dil
    await flutterTts.setPitch(1.0); // ses tonu
    if (speetType == 1) {
      await flutterTts.setSpeechRate(0.25); // yavaş konuşma hızı
    } else {
      await flutterTts.setSpeechRate(0.10); // normal konuşma hızı
    }

    await flutterTts.speak(vocabularyData?.sourceText ?? "");
  }
}
