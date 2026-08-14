import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/project_const.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:polyread/data/services/http_service.dart';
import 'package:polyread/data/services/library_service.dart';
import 'package:polyread/models/base_models/select_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/models/dto_models/library_dto_models/library_book_model.dart';
import 'package:polyread/models/service_models/book_model.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:polyread/data/services/ad_service.dart';

class LibraryController extends BaseController {
  late LibraryRepository db;

  var page = 1;
  var books = RxList<LibraryBookModel>();
  LibraryBookModel? selectedBook;
  String? next;
  var booksLoading = false.obs;
  var nextPageLoading = false.obs;
  var openSearchBar = false.obs;
  var bookDowloandProgres = 0.0.obs;
  var scrollController = ScrollController();
  SelectModel? selectedTopic;
  SelectModel? selectedLanguages;
  String q = "";

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;
  BannerAd? detailBannerAd;
  var isDetailBannerLoaded = false.obs;
  InterstitialAd? startupInterstitialAd;
  InterstitialAd? downloadInterstitialAd;

  LibraryController() {
    db = Get.find();
  }

  @override
  void onInit() {
    initPage();
    _loadBannerAd();
    _loadDetailBannerAd();
    _loadAndShowStartupInterstitialAd();
    _loadDownloadInterstitialAd();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !nextPageLoading.value &&
          next != null) {
        _loadNextPage();
      }
    });

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

  void _loadDetailBannerAd() {
    detailBannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isDetailBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isDetailBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  void _loadAndShowStartupInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdService.instance.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          startupInterstitialAd = ad;
          startupInterstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  startupInterstitialAd = null;
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                  startupInterstitialAd = null;
                },
              );
          startupInterstitialAd!.show();
        },
        onAdFailedToLoad: (error) {
          startupInterstitialAd = null;
        },
      ),
    );
  }

  void _loadDownloadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdService.instance.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          downloadInterstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          downloadInterstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAdAndDownload(String id, String url) {
    if (downloadInterstitialAd != null) {
      downloadInterstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              downloadInterstitialAd = null;
              _loadDownloadInterstitialAd(); // Prepare the next ad
              dowloandBook(id, url);
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              downloadInterstitialAd = null;
              _loadDownloadInterstitialAd();
              dowloandBook(id, url);
            },
          );
      downloadInterstitialAd!.show();
    } else {
      // Ad isn't ready or failed to load, just continue the process
      dowloandBook(id, url);
      _loadDownloadInterstitialAd();
    }
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    detailBannerAd?.dispose();
    startupInterstitialAd?.dispose();
    downloadInterstitialAd?.dispose();
    super.onClose();
  }

  void initPage() async {
    booksLoading.value = true;
    await getBooks();
    booksLoading.value = false;
  }

  Future onRefresh() {
    books.clear();
    q = "";
    selectedTopic = null;
    selectedLanguages = null;
    return getBooks();
  }

  Future getBooks() async {
    try {
      var bookResponse = await HttpService.instance!.baseGet(
        ProjectConst.BOOKS_URL,
        params: _getQueryParams(),
      );
      if (bookResponse?.statusCode == 200) {
        var bk = Books.fromJson(bookResponse!.data);
        next = bk.next;
        books.addAll(bk.results.map((e) => e.toLibraryBook()).toList());
      }
    } catch (e) {
      errorMessage("Bir Sorun Ouştu Lütfen Daha Sonra Deneyin!");
    }
  }

  void _loadNextPage() async {
    page++;
    nextPageLoading.value = true;
    await getBooks();
    nextPageLoading.value = false;
  }

  Map<String, String> _getQueryParams() {
    var params = {"page": page.toString()};
    if (selectedTopic != null) {
      params["topic"] = selectedTopic!.key;
    } else {
      params.remove("topic");
    }
    if (selectedLanguages != null) {
      params["languages"] = selectedLanguages!.key;
    } else {
      params.remove("languages");
    }
    if (q != "") {
      params["search"] = q;
    } else {
      params.remove("search");
    }
    return params;
  }

  Future searchBooks(String search) async {
    q = search;
    if (search.isEmpty || search.length % 3 == 0) {
      books.clear();
      booksLoading.value = true;
      await getBooks();
      booksLoading.value = false;
    }
  }

  Future filterBooks() async {
    books.clear();
    booksLoading.value = true;
    Get.back();
    await getBooks();
    booksLoading.value = false;
  }

  Future clearFilter() async {
    selectedTopic = null;
    selectedLanguages = null;
    books.clear();
    Get.back();
    booksLoading.value = true;

    await getBooks();
    booksLoading.value = false;
  }

  void hasBook() {
    bookDowloandProgres.value = 0;
    if (Get.find<MyBooksController>().books.any(
      (t) => t.bookId == (selectedBook?.bookId ?? "0"),
    )) {
      bookDowloandProgres.value = 1;
    }
  }

  Future dowloandBook(String id, String url) async {
    try {
      if (!await LibraryService.instance.bookExists(id)) {
        bookDowloandProgres.value = -1;
        var dowBook = await LibraryService.instance.downloadEpub(
          bookId: id,
          url: url,
          onProgress: (r, t) {
            bookDowloandProgres.value = (r / t);
          },
        );
        var book = LibraryStorageModel();
        book.authors = selectedBook?.authors ?? [];
        book.bookCoverPath = dowBook.coverPath;
        book.bookPath = dowBook.bookPath;
        book.lastLocationCfi = null;
        book.bookId = id;
        book.bookTitle = selectedBook?.bookTitle ?? "";
        book.langugeCode = selectedBook?.langugeCode ?? "";
        book.lastUpdate = DateTime.now();
        book.progres = 0;
        await db.saveLibraryBook(book);
        Get.find<MyBooksController>().getMyBooks();
      }
    } catch (e) {
      errorMessage(
        "indirme sırasında bir hata oluştu, lütfen daha sonra tekrar deneyin",
      );
      await LibraryService.instance.deleteBook(id);
      bookDowloandProgres.value = 0;
    }
  }

  Future toReaderPage() async {
    var book = await db.getByBookId(selectedBook?.bookId ?? "");
    if (book != null) {
      await Get.toNamed(
        RouteConst.readerPage,
        arguments: {"bookId": book.bookId, "bookPath": book.bookPath},
      );
    } else {
      errorMessage("Kitap bulunamadı");
    }
  }

  bool onProgres() =>
      bookDowloandProgres.value != 0 && bookDowloandProgres.value < 1;
  bool onButton() => bookDowloandProgres.value == 1;
}
