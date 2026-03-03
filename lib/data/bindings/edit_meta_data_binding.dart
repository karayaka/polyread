import 'package:get/get.dart';
import 'package:polyread/data/controllers/edit_meta_data_controller.dart';

class EditMetaDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditMetaDataController());
  }
}
