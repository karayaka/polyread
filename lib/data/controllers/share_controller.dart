import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';

class ShareController extends BaseController {
  var text = "".obs;
  int id = 0;
  late LibraryRepository _libraryRepository;
  String bookTitle = "";
  String bookAuthors = "";
  // Text styling properties
  var textColor = Color(0xFF000000).obs;
  var backgroundColor = Color(0xFFFFFFFF).obs;
  var fontSize = 18.0.obs;
  var isBold = false.obs;
  var isUnderline = false.obs;
  var fontWeight = FontWeight.normal.obs;
  var textAlign = TextAlign.left.obs;
  var pageLoading = false.obs;

  // Capture key for screenshot
  GlobalKey? screenshotKey;
  //reklemera geçilebilir

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;
  @override
  void onInit() {
    text.value = Get.arguments?["text"] ?? "";
    id = Get.arguments?["bookId"] ?? 0;
    _libraryRepository = Get.find<LibraryRepository>();
    super.onInit();
    _loadBannerAd();
    onLoad();
  }

  void _loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    super.onClose();
  }

  Future onLoad() async {
    pageLoading.value = true;
    var book = await _libraryRepository.getLibraryBookById(id);
    if (book != null) {
      bookTitle = book.bookTitle;
      bookAuthors = (book.authors ?? []).join(", ");
    }
    pageLoading.value = false;
  }

  // Update text color
  void setTextColor(Color color) {
    textColor.value = color;
  }

  // Update background color
  void setBackgroundColor(Color color) {
    backgroundColor.value = color;
  }

  // Update font size
  void setFontSize(double size) {
    fontSize.value = size;
  }

  // Toggle bold
  void toggleBold() {
    isBold.value = !isBold.value;
    fontWeight.value = isBold.value ? FontWeight.bold : FontWeight.normal;
  }

  // Toggle underline
  void toggleUnderline() {
    isUnderline.value = !isUnderline.value;
  }

  // Set text alignment
  void setTextAlign(TextAlign align) {
    textAlign.value = align;
  }

  // Capture screenshot and share
  Future<void> captureAndShare(String platform) async {
    try {
      if (screenshotKey == null) {
        errorMessage("Screenshot key not found");
        return;
      }

      RenderRepaintBoundary? boundary =
          screenshotKey!.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary == null) {
        errorMessage("Could not capture screenshot");
        return;
      }

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        errorMessage("Could not convert image");
        return;
      }

      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Save image to temporary directory
      final directory = await getTemporaryDirectory();
      final imagePath =
          '${directory.path}/shared_quote_${DateTime.now().millisecondsSinceEpoch}.png';
      File(imagePath).writeAsBytesSync(pngBytes);

      // Share text with app name
      final shareText =
          "$bookTitle\nby $bookAuthors\n\n📱 Shared via PolyRead"; //todo bu bölüme link filan eklencek uygulama tanıtımı
      await Share.shareXFiles([XFile(imagePath)], text: shareText);
    } catch (e) {
      errorMessage("Share failed: ${e.toString()}");
    }
  }
}
