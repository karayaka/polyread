class LibraryBookModel {
  late String bookId;

  late String bookTitle;

  late String bookPath;

  String? bookCoverPath;

  String? langugeCode;

  String? summaries;

  int? downloadCount;

  List<String>? authors;

  late int progres;

  LibraryBookModel({
    required this.bookId,
    required this.bookTitle,
    required this.bookPath,
    this.bookCoverPath,
    this.authors,
    this.langugeCode,
    this.summaries,
    this.downloadCount,
    this.progres = 0,
  });
}
