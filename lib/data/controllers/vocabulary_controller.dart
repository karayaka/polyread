import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';
import 'package:polyread/data/repositories/vocabulary_repository.dart';
import 'package:polyread/data/services/http_service.dart';
import 'package:polyread/models/base_models/select_model.dart';
import 'package:polyread/models/service_models/vocabulary_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';

class VocabularyController extends BaseController {
  late final VocabularyRepository _vocabularyRepository;

  var translateLoading = false.obs;
  var isSpeaking = false.obs;
  VocabularyModel? vocabularyData;
  SelectModel? languge;
  late final FlutterTts flutterTts;
  var isSavedToHistory = false.obs;

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;

  @override
  void onInit() {
    _loadBannerAd();
    flutterTts = FlutterTts();
    _vocabularyRepository = Get.find<VocabularyRepository>();

    // Add completion handler to reset speaking state
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });
    // Add cancel handler just in case
    flutterTts.setCancelHandler(() {
      isSpeaking.value = false;
    });
    // Add error handler
    flutterTts.setErrorHandler((msg) {
      isSpeaking.value = false;
      errorMessage("Seslendirme hatası: $msg");
    });

    super.onInit();
  }

  void _loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    super.onClose();
  }

  Future loadVocabulary(String word, String bookId) async {
    translateLoading.value = true;

    // Check cache first
    var cached = await _vocabularyRepository.getVocabulary(word);
    if (cached != null) {
      if (Tools.languges.any((l) => l.key == cached.languageCode)) {
        languge = Tools.languges.firstWhere(
          (l) => l.key == cached.languageCode,
        );
        vocabularyData = VocabularyModel(
          translation: cached.text,
          sourceText: cached.sourceWord,
          detectedLanguage: cached.languageCode,
        );
        isSavedToHistory.value = cached.onShowVocabulary;
      }
      translateLoading.value = false;
      return;
    }

    // If not cached, fetch from network
    await translateVocabulary(word, bookId);
  }

  Future translateVocabulary(String word, String bookId) async {
    try {
      //todo api değişecek post metodu yapıp parametre olarak almak daha sağlıklı yazı içindeki bağzı karakterler hataya. düşürüyor
      var data = prepareServiceModel<VocabularyModel>(
        await HttpService.instance!.post<VocabularyModel>(
          "https://tr.cagnaz.com/Translate/",
          VocabularyModel(),
          {"text": word, "to": getDeviceLanguageCode()},
        ),
      );
      if (Tools.languges.any((l) => l.key == data?.detectedLanguage)) {
        languge = Tools.languges.firstWhere(
          (l) => l.key == data?.detectedLanguage,
        );
        vocabularyData = data;

        // Save translation to cache
        await _vocabularyRepository.saveVocabulary(
          VocabularyStorageModel()
            ..bookId = bookId
            ..sourceWord = word
            ..text = data?.translation ?? ""
            ..toLanguage = data?.detectedLanguage ?? ""
            ..languageCode = getDeviceLanguageCode()
            ..desc = "",
        );
      } else {
        errorMessage("Desteklenmeyen dil: ${data?.detectedLanguage}");
      }

      translateLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      translateLoading.value = false;
    }
  }

  Future speak(int speetType) async {
    if (languge == null) {
      errorMessage("Dil bilgisi bulunamadı");
      return;
    }

    if (isSpeaking.value) return; // Prevent multiple clicks
    isSpeaking.value = true;

    try {
      await flutterTts.setLanguage("${languge?.key}-${languge?.value}"); // dil
      await flutterTts.setPitch(1.0); // ses tonu
      if (speetType == 1) {
        await flutterTts.setSpeechRate(0.50); // yavaş konuşma hızı
      } else {
        await flutterTts.setSpeechRate(0.25); // normal konuşma hızı
      }

      await flutterTts.speak(vocabularyData?.sourceText ?? "");
    } catch (e) {
      isSpeaking.value = false;
      errorMessage("Seslendirme başlatılamadı");
    }
  }

  Future saveToHistory() async {
    if (vocabularyData?.sourceText == null ||
        vocabularyData!.sourceText!.isEmpty) {
      return;
    }

    try {
      var cached = await _vocabularyRepository.getVocabulary(
        vocabularyData!.sourceText!,
      );
      if (cached != null) {
        isSavedToHistory.value = !cached.onShowVocabulary;
        await _vocabularyRepository.toggleShowVocabulary(
          cached.id,
          !cached.onShowVocabulary,
        );
        succesMessage(
          isSavedToHistory.value
              ? "Kelimelerime kaydedildi."
              : "Kelimelerimden kaldırıldı.",
        );
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }
}
