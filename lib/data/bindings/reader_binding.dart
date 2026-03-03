import 'package:get/get.dart';
import 'package:polyread/data/controllers/reader_controller.dart';
import 'package:polyread/data/repositories/ps_repository.dart';

class ReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReaderController());
    Get.lazyPut(() => PsRepository());
  }
}
