import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:polyread/models/base_models/base_result.dart';

class BaseController extends GetxController {
  int guardStatus = 0;
  String message = "";
  DateTime date = DateTime.now();
  I? prepareServiceModel<I>(BaseResult model) {
    try {
      if (model.statusCode == 200) {
        message = model.message ?? "";
        date = model.date ?? DateTime.now();
        return model.data;
      } else if (model.statusCode == 401) {
        //
      } else {
        errorMessage(message);
      }
      return null;
    } catch (e) {
      errorMessage(e.toString());
      return null;
    }
  }

  void succesMessage(String message) {
    Get.snackbar(
      "Başarılı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  void errorMessage(String message, {Widget? widget}) {
    Get.snackbar(
      "Hata",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      messageText: widget,
    );
  }

  void warningMessage(String message) {
    Get.snackbar(
      "Uyarı",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade600,
    );
  }

  void saveBookFontSize(String bookId, double fontSize) {
    try {
      final box = GetStorage();
      box.write('book_${bookId}_fontSize', fontSize);
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  double getBookFontSize(String bookId) {
    try {
      final box = GetStorage();
      return box.read('book_${bookId}_fontSize') ?? 16.0;
    } catch (e) {
      errorMessage(e.toString());
      return 16.0;
    }
  }

  String getDeviceLanguageCode() {
    final box = GetStorage();
    final savedLocale = box.read('app_locale');
    final initialLocale =
        savedLocale ?? Get.deviceLocale?.toString().split("-")[0] ?? 'tr';
    return initialLocale;
  }
}
