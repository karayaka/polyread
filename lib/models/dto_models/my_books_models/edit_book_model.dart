import 'package:polyread/data/local_storage/models/library_storage_model.dart';

class EditBookModel {
  late int id;
  late String bookPath;
  late String bookId;
  String? title;
  List<String>? authors;
  String? languages;
  String? coverPath;
  EditBookModel({
    required this.id,
    required this.bookId,
    required this.bookPath,
    this.authors,
    this.title,
    this.coverPath,
    this.languages,
  });

  LibraryStorageModel toLibraryStorageModel() {
    var model = LibraryStorageModel();
    model.authors = authors;
    model.bookTitle = title ?? "";
    model.bookId = bookId;
    model.langugeCode = languages;
    model.progres = 0;
    model.bookCoverPath = coverPath;
    model.lastUpdate = DateTime.now();
    return model;
  }
}
