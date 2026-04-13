import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:get/get.dart';
import 'package:polyread/core/enums/page_event_type.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';
import 'package:polyread/data/local_storage/models/external_book_storage_model.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/local_storage/models/reading_series_model.dart';
import 'package:polyread/data/repositories/external_book_repository.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:polyread/data/repositories/ps_repository.dart';
import 'package:polyread/data/repositories/reading_series_repository.dart';
import 'package:polyread/data/services/library_service.dart';
import 'package:polyread/models/base_models/select_model.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_dto_model.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_form_result_model.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_page_model.dart';
import 'package:polyread/models/series_models/earn_series_model.dart';
import 'package:polyread/models/series_models/series_calculate.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:polyread/routing/route_fix.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';

class ReaderController extends BaseController {
  //initials var
  String? bookId;
  String? bookPath;
  String? bookName;
  String? selectedText;
  String? selectionRange;
  String? lastSavedLocationCfi;
  bool firstLoad = false;
  var fontSize = 16.0.obs;
  var readingStartTime = DateTime.now();
  late SeriesCalculate currentSeries;
  var earnSeries = EarnSeriesModel();
  //initial Models
  late File bookFile;
  late GlobalKey<ScaffoldState> scaffoldKey;
  late EpubController epubController;
  LibraryStorageModel? bookFromDb;
  List<SelectModel> tagSelectModel = [];

  RxList<EpubChapter> chapters = RxList();
  List<PsDtoModel> pagePsModels = []; //todo bunu rx list yaptık test ed
  var selectedTag = "";
  var psList = RxList<PsDtoModel>();

  //dependensys
  late LibraryRepository _libraryRepository;
  late PsRepository _psRepository;
  late ExternalBookRepository externalBookRepository;
  late ReadingSeriesRepository _readingSeriesRepository;
  PsDtoModel? psFormModel;
  //Rx
  var bookLoading = true.obs; // veri yükleniyor mu?
  var epubReady = false.obs; // epub tamamen yüklendi mi (onEpubLoaded sonrası)?
  bool bookLoaded = false;
  var chapterLoading = true.obs;
  var showbottomBar = true.obs;
  var isSavedLocation = false.obs;

  BannerAd? settingBannerAd;
  var isSettingBannerLoaded = false.obs;

  BannerAd? psListBannerAd;
  var isPsListBannerLoaded = false.obs;

  ReaderController() {
    _libraryRepository = Get.find();
    _psRepository = Get.find();
    _readingSeriesRepository = Get.find();
    externalBookRepository = Get.find();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void onInit() async {
    epubController = EpubController();
    bookId = Get.arguments['bookId'];
    bookPath = Get.arguments['bookPath'];
    bookName = Get.arguments['bookName'];
    WakelockPlus.enable();
    super.onInit();
    _loadBannerAd();
    await loadBook();
    readingStartTime = DateTime.now();
    currentSeries = await _readingSeriesRepository.getSeriesCalculate();
  }

  void _loadBannerAd() {
    settingBannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isSettingBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isSettingBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();

    psListBannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isPsListBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isPsListBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  //rederi yükler
  Future loadBook() async {
    try {
      firstLoad = true;
      bookLoading.value = true;
      bookFile = File(bookPath!);
      if (bookId != null) {
        bookFromDb = await _libraryRepository.getByBookId(bookId!);
        pagePsModels = (await _psRepository.getPsByBookId(
          bookId!,
        )).map((ps) => ps.toPsDtoModel()).toList();
        if (bookFromDb != null) {
          fontSize.value = getBookFontSize(bookId!);
          lastSavedLocationCfi = bookFromDb!.lastLocationCfi;
          isSavedLocation.value = true;
          await loadTagselector();
          filterPsTags();
        }
      } else {
        await externalBookRepository.saveExternalBookHistory(
          ExternalBookStorageModel(
            name: bookName ?? "Unknown",
            path: bookPath!,
            modifiedDate: DateTime.now(),
          ),
        );
      }
      bookLoading.value = false;
      // epubReady sıfırla ki kullanıcı reload yaptığında overlay yeniden gösterilsin
      epubReady.value = false;
    } catch (e) {
      bookLoading.value = false;
    }
  }

  void filterPsTags() {
    if (selectedTag == "") {
      psList.value = pagePsModels;
    } else {
      psList.value = pagePsModels
          .where((ps) => (ps.tags ?? []).contains(selectedTag))
          .toList();
    }
  }

  Future loadTagselector() async {
    tagSelectModel.clear();
    tagSelectModel.add(SelectModel(key: "", value: "Tümü"));
    var tags = await _psRepository.getSuggestionTags();
    for (var tag in tags) {
      if (tagSelectModel.any((t) => t.key == tag)) {
        continue;
      }
      tagSelectModel.add(SelectModel(key: tag, value: tag));
    }
  }

  //epubloaded olduğunda tetiklenir kontroller için
  void epubLoaded() {
    try {
      if (bookFromDb?.lastLocationCfi != null && firstLoad) {
        epubController.display(cfi: bookFromDb!.lastLocationCfi!);
        epubController.setFontSize(fontSize: fontSize.value);
        loadHighlights();
      }
      firstLoad = false;
      epubReady.value = true; // Overlay'i kaldır
    } catch (e) {
      epubReady.value = true; // Hata olsa bile overlay kaldır
      errorMessage(e.toString());
    }
  }

  //reader üzerinde seçim yapıldığındadevreye girer
  Future<bool> onSelection(String slcText, String cfiRange) async {
    try {
      selectionRange = cfiRange;
      selectedText = slcText;
      if (bookId != null) {
        var ps = pagePsModels.firstWhereOrNull(
          (ps) => ps.text.toLowerCase() == selectedText?.toLowerCase(),
        );
        return ps != null;
      } else {
        await saveBookFromExternal(false);
      }
      return false;
    } catch (e) {
      errorMessage(e.toString());
      return false;
    }
  }

  //son kayıtlı sayfaya gider
  void gotoLastSavedPage() {
    if (lastSavedLocationCfi != null) {
      epubController.display(cfi: lastSavedLocationCfi!);
    }
  }

  Future<PsPageModel> getPageModel(PageEventType type) async {
    try {
      var location = await epubController.getCurrentLocation();
      return PsPageModel(
        eventType: type,
        bookId: bookId ?? "",
        text: selectedText ?? "",
        psCfi: selectionRange,
        pageCfi: location.startCfi,
      );
    } catch (e) {
      errorMessage(e.toString());
      rethrow;
    }
  }

  //bölümleri yükler
  void chapterLoaded(List<EpubChapter> chaps) {
    chapterLoading.value = false;
    chapters.clear();
    chapters.addAll(chaps);
  }

  //bölümleri filtreler
  void filterChapters(String q) {
    chapters.value = chapters
        .where((ch) => ch.title.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  //yan menüyü açar
  void openChapterDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  //font büyüklüğünü ayarlar
  void setFontSize(double size) {
    fontSize.value = size;
    epubController.setFontSize(fontSize: size);
    if (bookId != null) {
      saveBookFontSize(bookId!, size);
    }
  }

  //son kalınan sayfayı kayt eder
  Future saveBookmark() async {
    if (bookFromDb == null) {
      await saveBookFromExternal(false);
    }
    if (bookFromDb != null) {
      var location = await epubController.getCurrentLocation();
      bookFromDb!.lastLocationCfi = location.startCfi;
      lastSavedLocationCfi = location.startCfi;
      bookFromDb!.lastUpdate = DateTime.now();
      isSavedLocation.value = true;
      bookFromDb!.progres = (location.progress * 100).toInt();
      await _libraryRepository.saveLibraryBook(bookFromDb!);

      await _readingSeriesRepository.saveReadingSeries(
        location.progress,
        DateTime.now().difference(readingStartTime).inSeconds,
      );
    }
  }

  //kadiğin yeri kayıt et eventi
  Future<void> askSaveBookmarkOnExit() async {
    var location = await epubController.getCurrentLocation();

    if (bookId != null && lastSavedLocationCfi != location.startCfi) {
      Get.defaultDialog(
        title: "Çıkış",
        middleText: "Kitapta kaldığınız yeri kaydetmek ister misiniz?",
        textCancel: "Hayır",
        textConfirm: "Evet",
        onConfirm: () async {
          Get.back<bool>(result: true);
          await saveBookmark();
          var series = await _readingSeriesRepository.getSeriesCalculate();
          earnSeries.isStreakEarned =
              (currentSeries.seriesLevel < series.seriesLevel);
          earnSeries.streakLevel = series.seriesLevel;
          earnSeries.isTimeEarned =
              (currentSeries.readingTimeLevel < series.readingTimeLevel);
          earnSeries.timeLevel = series.readingTimeLevel;
          Get.back<EarnSeriesModel>(result: earnSeries);
        },
        onCancel: () {
          Get.back<EarnSeriesModel>(result: earnSeries);
        },
      );
    } else if (bookId == null) {
      await saveBookFromExternal(true);
    } else {
      Get.back<EarnSeriesModel>(result: earnSeries);
    }
  }

  //kitap kayıtlı değilse kaydet redarden çıılıyorsa kadığı yerde kayıt ediyor
  Future<void> saveBookFromExternal(bool isBack) async {
    Get.defaultDialog(
      title: "Kitapı Kayet",
      middleText: "Kitap kitaplıkta kayıtlı değil eklenmesini istermisiniz?",
      textCancel: "Hayır",
      textConfirm: "Evet",
      onConfirm: () async {
        Get.back<bool>(result: true);
        var uuid = DateTime.now().millisecondsSinceEpoch.toString();
        var importBook = await LibraryService.instance.importEpub(
          bookId: "I_$uuid",
          sourceFile: File(bookPath ?? ""),
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
        var id = await _libraryRepository.saveLibraryBook(book);
        bookId = book.bookId;
        bookFromDb = book;
        await toEditMetaDataPage(id);
        await Get.find<ExternalBookRepository>()
            .deleteExternalBookHistoryByPath(bookPath ?? "");
        if (isBack) {
          await saveBookmark();
          Get.back<EarnSeriesModel>(result: earnSeries);
        }
      },
      onCancel: () {
        Get.back<EarnSeriesModel>(result: earnSeries);
        if (isBack) {
          Get.back<EarnSeriesModel>(result: earnSeries);
        }
      },
    );
  }

  //edit sayfasıan gider
  Future toEditMetaDataPage(int id) async {
    await Get.toNamed(
      RouteConst.editMetaData,
      parameters: {"id": id.toString()},
    );
  }

  //kayıtlı notları epup içine atar
  Future loadHighlights() async {
    try {
      if (bookId != null) {
        for (var highlight in pagePsModels) {
          if (highlight.psCfi != null) {
            epubController.addHighlight(
              cfi: highlight.psCfi ?? "",
              color: highlight.colorHex != null
                  ? Color(highlight.colorHex!)
                  : Colors.white,
            );
            if (highlight.underline) {
              epubController.addUnderline(cfi: highlight.psCfi ?? "");
            }
          }
        }
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future addPsOrHihglight() async {
    //update add eventleri birleşirebilirmi diye bakılacak
    try {
      var rslt = await RouteFix.toPsFormPage(
        await getPageModel(PageEventType.save),
      );
      if (rslt == null) {
        return;
      }
      var result = PsFormResultModel.fromMap(rslt);
      epubController.removeHighlight(cfi: result.psCfi);
      epubController.removeUnderline(cfi: result.psCfi);
      var ps = await _psRepository.getPsById(result.psId);
      pagePsModels.removeWhere((t) => t.id == result.psId);
      if (ps != null) {
        //sayfa ilk yüklediğinde gelen notları günceeliyor
        pagePsModels.add(ps.toPsDtoModel());
        epubController.addHighlight(
          cfi: ps.psCfi ?? "",
          color: Color(ps.colorHex ?? 4294967295),
        );
        if (ps.underline) {
          epubController.addUnderline(cfi: ps.psCfi ?? "");
        }
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future updatePsOrHihglight() async {
    try {
      var rslt = await RouteFix.toPsFormPage(
        await getPageModel(PageEventType.edit),
      );
      if (rslt == null) {
        return;
      }

      var result = PsFormResultModel.fromMap(rslt);
      epubController.removeHighlight(cfi: result.psCfi);
      epubController.removeUnderline(cfi: result.psCfi);
      var ps = await _psRepository.getPsById(result.psId);
      if (ps != null) {
        epubController.addHighlight(
          cfi: ps.psCfi ?? "",
          color: Color(ps.colorHex ?? 4294967295),
        );
        if (ps.underline) {
          epubController.addUnderline(cfi: ps.psCfi ?? "");
        }
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  @override
  void onClose() {
    settingBannerAd?.dispose();
    psListBannerAd?.dispose();
    WakelockPlus.disable();
    super.onClose();
  }
}
