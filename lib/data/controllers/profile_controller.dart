import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/repositories/reading_series_repository.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';

class ProfileController extends BaseController {
  late ReadingSeriesRepository _readingSeriesRepository;

  var average10DaysMinutes = 0;
  var maxContinuousStreak = 0;
  var isLoading = true.obs;

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;

  @override
  @override
  void onInit() {
    super.onInit();
    _loadBannerAd();
    _readingSeriesRepository = Get.find();
    calculateStats();
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

  Future<void> calculateStats() async {
    isLoading.value = true;
    try {
      //todo seri değiştimi hesabı yapılacak ve ona göre kutlama palaşma sayfasına yönlendirilecek
      var result = await _readingSeriesRepository.getSeriesCalculate();
      average10DaysMinutes = result.readingTime;
      maxContinuousStreak = result.series;
      isLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      isLoading.value = false;
    }
  }
}
