import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/local_storage/models/external_book_storage_model.dart';
import 'package:polyread/data/repositories/external_book_repository.dart';

class ExternalHistoryController extends BaseController {
  var pageLoading = false.obs;
  List<ExternalBookStorageModel> history = [];
  late ExternalBookRepository externalBookRepository;

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;

  ExternalHistoryController() {
    externalBookRepository = Get.find();
  }
  @override
  void onInit() {
    _loadBannerAd();
    loadExternalHistory();
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

  Future<void> loadExternalHistory() async {
    try {
      pageLoading.value = true;
      final result = await externalBookRepository.getExternalBookHistory();
      pageLoading.value = false;
      result.sort((a, b) => b.modifiedDate!.compareTo(a.modifiedDate!));
      history = result;
    } catch (e) {
      pageLoading.value = false;
      errorMessage(e.toString());
    }
  }

  Future<void> deleteHistory(Id id) async {
    try {
      pageLoading.value = true;
      await externalBookRepository.deleteExternalBookHistory(id);
      await loadExternalHistory();
    } catch (e) {
      pageLoading.value = false;
      errorMessage(e.toString());
    }
  }
}
