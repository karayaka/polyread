import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
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

  MyBooksController() {
    db = Get.find();
  }

  @override
  void onInit() {
    getMyBooks();
    super.onInit();
  }

  Future getMyBooks() async {
    try {
      myBooksLoading.value = true;
      books.value = await db.getAllLibrary();
      myBooksLoading.value = false;
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
        var uuid = DateTime.now().millisecondsSinceEpoch.toString();
        var importBook = await LibraryService.instance.importEpub(
          bookId: "C_$uuid",
          sourceFile: File(result.paths[0] ?? ""),
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
        var id = await db.saveLibraryBook(book);
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

  Future toEditMetaDataPage(int id) async {
    await Get.toNamed(
      RouteConst.editMetaData,
      parameters: {"id": id.toString()},
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
    var rstl = EarnSeriesModel(
      timeLevel: 2,
      isTimeEarned: true,
      streakLevel: 2,
      isStreakEarned: true,
    );
    Get.toNamed(RouteConst.shareSeriesPage, arguments: rstl);
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
