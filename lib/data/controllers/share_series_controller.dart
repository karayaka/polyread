import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/models/series_models/earn_series_model.dart';

class ShareSeriesController extends BaseController {
  late EarnSeriesModel earnSeries;
  GlobalKey screenshotKey = GlobalKey();

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is EarnSeriesModel) {
      earnSeries = Get.arguments as EarnSeriesModel;
    } else {
      earnSeries = EarnSeriesModel(isTimeEarned: true, isStreakEarned: true);
    }
    super.onInit();
  }

  Future<void> shareSeries() async {
    try {
      RenderRepaintBoundary? boundary =
          screenshotKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary == null) {
        errorMessage("Görüntü alınamadı");
        return;
      }
      // Resmi yüksek çözünürlükte almak için pixelRatio arttırıldı.
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        errorMessage("Görüntü dönüştürülemedi");
        return;
      }

      Uint8List pngBytes = byteData.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/shared_series_${DateTime.now().millisecondsSinceEpoch}.png';
      File(imagePath).writeAsBytesSync(pngBytes);

      final shareText =
          "Yeni bir rozet kazandım!\n\n📱 PolyRead ile Paylaşıldı";
      await Share.shareXFiles([XFile(imagePath)], text: shareText);
    } catch (e) {
      errorMessage("Paylaşım başarısız: ${e.toString()}");
    }
  }
}
