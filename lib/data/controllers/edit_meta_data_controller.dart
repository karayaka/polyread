import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:polyread/data/services/library_service.dart';
import 'package:polyread/models/dto_models/my_books_models/edit_book_model.dart';

class EditMetaDataController extends BaseController {
  late LibraryRepository db;
  late int id;
  int formType = 0;
  EditBookModel? formModel;
  LibraryStorageModel? originalModel; // Orijinal modeli sakla
  var selectedLanguge = "".obs;
  RxList<String> autors = RxList.empty();
  GlobalKey<FormState> editFormKey = GlobalKey();
  var formLoading = false.obs;
  String autor = "";
  TextEditingController autorController = TextEditingController();
  String newCoverPath = "";
  var saveButtonLoading = false.obs;
  EditMetaDataController() {
    id = int.parse(Get.parameters["id"] ?? "0");
    db = Get.find();
  }

  @override
  void onInit() {
    getFormModel();
    super.onInit();
  }

  Future getFormModel() async {
    try {
      formLoading.value = true;
      var mdl = await db.getLibraryBookById(id);
      if (mdl != null) {
        originalModel = mdl;
        toModel(mdl);
      }
      formLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  String getBookCoverPath() =>
      newCoverPath != "" ? newCoverPath : formModel?.coverPath ?? "";

  void toModel(LibraryStorageModel model) {
    autors.addAll(model.authors ?? []);
    selectedLanguge.value = _setLanguge(model.langugeCode);
    formModel = EditBookModel(
      id: model.id,
      bookId: model.bookId,
      bookPath: model.bookPath,
      title: model.bookTitle,
      coverPath: model.bookCoverPath,
      authors: model.authors, //bu konuya bakıacak
      languages: _setLanguge(model.langugeCode),
    );
  }

  void addAutor() {
    if (autorController.text.isNotEmpty) {
      autors.add(autorController.text);
      autorController.clear();
    }
  }

  void deleteAutor(int index) {
    autors.removeAt(index);
  }

  Future<void> saveBook() async {
    try {
      if (editFormKey.currentState?.validate() ?? false) {
        saveButtonLoading.value = true;
        if (newCoverPath.isNotEmpty) {
          formModel!.coverPath = await LibraryService.instance.updateCoverImage(
            bookId: originalModel!.bookId,
            newCoverFile: File(newCoverPath),
          );
        }
        // todo burda katapda kaldığı yr gibi bilgilerde güncellencek
        if (formModel != null) {
          final updatedBook = LibraryStorageModel();
          updatedBook.id = formModel!.id;
          updatedBook.lastLocationCfi =
              originalModel?.lastLocationCfi; // CFI bilgisini koru
          updatedBook.bookId = formModel!.bookId;
          updatedBook.bookTitle = formModel!.title ?? "";
          updatedBook.bookPath = formModel!.bookPath;
          updatedBook.bookCoverPath = formModel!.coverPath;
          updatedBook.authors = autors;
          updatedBook.langugeCode = selectedLanguge.value;
          updatedBook.progres = originalModel?.progres ?? 0;
          updatedBook.lastUpdate = DateTime.now();

          await db.saveLibraryBook(updatedBook);
          await Get.find<MyBooksController>().getMyBooks();
          Get.back<bool>(result: true);
        }

        formLoading.value = false;
      }
    } catch (e) {
      errorMessage(e.toString());
      formLoading.value = false;
    }
  }

  Future<void> pickCoverImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    formLoading.value = true;
    if (result != null) {
      newCoverPath = result.files.single.path ?? "";
    }
    formLoading.value = false;
  }

  String _setLanguge(String? code) =>
      (code ?? "").replaceAll(" ", "").contains("-")
      ? code!.split("-").first
      : code ?? "tr";
}
