import 'package:get/get.dart';
import 'package:polyread/data/controllers/profile_controller.dart';
import 'package:polyread/data/repositories/reading_series_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ReadingSeriesRepository());
  }
}
