import 'package:get/get.dart';
import 'package:polyread/data/controllers/share_series_controller.dart';
import 'package:polyread/data/repositories/reading_series_repository.dart';

class ShareSeriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareSeriesController>(() => ShareSeriesController());
    Get.lazyPut<ReadingSeriesRepository>(() => ReadingSeriesRepository());
  }
}
