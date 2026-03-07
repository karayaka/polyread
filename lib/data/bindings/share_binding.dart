import 'package:get/get.dart';
import 'package:polyread/data/controllers/share_controller.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
