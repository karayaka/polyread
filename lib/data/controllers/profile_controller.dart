import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/repositories/reading_series_repository.dart';

class ProfileController extends BaseController {
  late ReadingSeriesRepository _readingSeriesRepository;

  var average10DaysMinutes = 0;
  var maxContinuousStreak = 0;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _readingSeriesRepository = Get.find();
    calculateStats();
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
