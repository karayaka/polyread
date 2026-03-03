import 'package:get/get.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/repositories/external_book_repository.dart';
import 'package:polyread/data/repositories/library_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarService());
    Get.put(LibraryRepository());
    Get.put(ExternalBookRepository());
  }
}
