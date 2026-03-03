import 'package:get/get.dart';
import 'package:polyread/data/controllers/ps_form_controller.dart';
import 'package:polyread/data/repositories/ps_repository.dart';

class PsFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PsRepository());
    Get.lazyPut(() => PsFormController());
  }
}
