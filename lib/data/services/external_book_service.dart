import 'package:get/get.dart';
import 'package:polyread/models/service_models/external_book_service_model.dart';
import 'package:polyread/routing/route_const.dart';

class ExternalBookService {
  static ExternalBookService? _instance;

  static ExternalBookService get instance {
    _instance ??= ExternalBookService._init();
    return _instance!;
  }

  ExternalBookService._init();

  List<ExternalBookServiceModel> _queue = <ExternalBookServiceModel>[];
  bool appReady = false;

  void addBook(String path, String name) {
    _queue.add(ExternalBookServiceModel(path, name));
    _tryProcess();
  }

  void markAppReady() {
    appReady = true;
    _tryProcess();
  }

  void _tryProcess() {
    if (!appReady) return;
    if (_queue.isEmpty) return;

    final book = _queue.removeAt(0);

    // Reader sayfasına yönlendir
    Get.toNamed(
      RouteConst.readerPage,
      arguments: {"bookPath": book.path, "bookName": book.name},
    );
  }
}
