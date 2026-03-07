import 'package:get/get.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_page_model.dart';
import 'package:polyread/routing/route_const.dart';

class RouteFix {
  static Future<dynamic>? toPsFormPage(PsPageModel model) {
    return Get.toNamed(RouteConst.psFormPage, arguments: model.toMap());
  }

  static Future<dynamic>? toSharePage(String text, int bookId) {
    return Get.toNamed(
      RouteConst.sharePage,
      arguments: {"text": text, "bookId": bookId},
    );
  }
}
