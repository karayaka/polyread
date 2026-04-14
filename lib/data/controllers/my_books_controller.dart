import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/services/ad_service.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:polyread/data/services/external_book_service.dart';
import 'package:polyread/data/services/library_service.dart';
import 'package:polyread/models/base_models/select_model.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:polyread/models/series_models/earn_series_model.dart';

class MyBooksController extends BaseController {
  late LibraryRepository db;
  var myBooksLoading = false.obs;
  var importLoading = false.obs;
  var books = RxList<LibraryStorageModel>();
  SelectModel? selectStatus = SelectModel(key: "", value: "Tümü");

  BannerAd? bannerAd;
  BannerAd? editBannerAd;
  var isBannerLoaded = false.obs;
  var isEditBannerLoaded = false.obs;
  InterstitialAd? _interstitialAd;

  MyBooksController() {
    db = Get.find();
  }

  @override
  void onInit() {
    initMybooks();
    _loadBannerAd();
    _loadEditBannerAd();
    _showInterstitialAd();
    super.onInit();
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

  void _loadEditBannerAd() {
    editBannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isEditBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isEditBannerLoaded.value = false;
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

  Future getMyBooks() async {
    try {
      books.value = await db.getAllLibrary();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ExternalBookService.instance.markAppReady();
      });
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<bool> addBook() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['epub'],
      );
      importLoading.value = true;
      if (result != null) {
        var id = await saveBookFromPath(result.paths[0] ?? "");
        await toEditMetaDataPage(id);
        importLoading.value = false;
        return true;
      }
      importLoading.value = false;
      return false;
    } catch (e) {
      importLoading.value = false;
      errorMessage(e.toString());
      return false;
    }
  }

  Future initMybooks() async {
    try {
      myBooksLoading.value = true;
      var hasAnyBook = await db.getLastSyncDate();
      if (hasAnyBook == null) {
        await _loadAssetAndSave("assets/epub/mustafa-kemal-ataturk-nutuk.epub");
        await _loadAssetAndSave("assets/epub/pg500.epub");
        await getMyBooks();
        myBooksLoading.value = false;
      } else {
        await getMyBooks();
        myBooksLoading.value = false;
      }
    } catch (e) {
      myBooksLoading.value = false;
      errorMessage(e.toString());
    }
  }

  Future<void> _loadAssetAndSave(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${assetPath.split('/').last}');
      await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
      await saveBookFromPath(tempFile.path);
    } catch (e) {
      errorMessage("Asset kitap yüklenirken hata oluştu: $e");
    }
  }

  Future<int> saveBookFromPath(String path) async {
    try {
      var uuid = DateTime.now().millisecondsSinceEpoch.toString();
      var importBook = await LibraryService.instance.importEpub(
        bookId: "C_$uuid",
        sourceFile: File(path),
      );
      //kitaba ait okuna datalar kayıt ediliyor
      var book = LibraryStorageModel();
      book.authors = importBook.metaData.authors ?? [];
      book.bookCoverPath = importBook.metaData.coverPath;
      book.bookPath = importBook.bookPath;
      book.bookId = importBook.bookId;
      book.lastLocationCfi = null;
      book.bookTitle = importBook.metaData.title ?? "";
      book.langugeCode = importBook.metaData.languages ?? "";
      book.lastUpdate = DateTime.now();
      book.progres = 0;
      return await db.saveLibraryBook(book);
    } catch (e) {
      errorMessage(e.toString());
      return 0;
    }
  }

  Future toEditMetaDataPage(int id) async {
    await Get.toNamed(
      RouteConst.editMetaData,
      parameters: {"id": id.toString()},
    );
  }

  void _showInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdService.instance.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              ad.dispose();
            },
          );
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (err) {
          // ignore
        },
      ),
    );
  }

  Future toReaderPage(LibraryStorageModel book) async {
    var result = await Get.toNamed(
      RouteConst.readerPage,
      arguments: {"bookId": book.bookId, "bookPath": book.bookPath},
    );
    if (result is EarnSeriesModel &&
        (result.isStreakEarned || result.isTimeEarned)) {
      Get.toNamed(RouteConst.shareSeriesPage, arguments: result);
    }
    _interstitialAd?.show();
    await getMyBooks();
  }

  void deleteBook(int id, String bookId) async {
    try {
      myBooksLoading.value = true;
      await LibraryService.instance.deleteBook(bookId);
      await db.deleteLibraryBook(id);
      books.removeWhere((element) => element.id == id);
      myBooksLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      myBooksLoading.value = false;
    }
  }
}
