import 'dart:io';
import 'dart:convert';
import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:polyread/data/services/http_service.dart';
import 'package:polyread/models/dto_models/library_service_models/dowload_epub_model.dart';
import 'package:polyread/models/dto_models/library_service_models/import_epub_model.dart';
import 'package:polyread/models/dto_models/library_service_models/meta_data_model.dart';
import 'package:xml/xml.dart';

class LibraryService {
  LibraryService._();
  static final LibraryService instance = LibraryService._();

  /// Root: /Documents/books
  Future<Directory> _booksRootDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final booksDir = Directory(p.join(dir.path, 'books'));

    if (!await booksDir.exists()) {
      await booksDir.create(recursive: true);
    }
    return booksDir;
  }

  /// /books/{bookId}
  Future<Directory> _bookDir(String bookId) async {
    final root = await _booksRootDir();
    final bookDir = Directory(p.join(root.path, bookId));

    if (!await bookDir.exists()) {
      await bookDir.create(recursive: true);
    }
    return bookDir;
  }

  // --------------------------------------------------
  // EPUB DOWNLOAD (Gutenberg vs.)
  // --------------------------------------------------

  Future<DowloadEpubModel> downloadEpub({
    required String bookId,
    required String url,
    void Function(int received, int total)? onProgress,
  }) async {
    final bookDir = await _bookDir(bookId);
    final epubPath = p.join(bookDir.path, 'book.epub');

    // increase timeouts in case the epub is large or the connection is slow
    // you can also set these globally in `HttpService` by adjusting `baseOptions`
    final options = Options(
      connectTimeout: Duration(minutes: 2), // 2 minutes
      receiveTimeout: Duration(minutes: 2),
      sendTimeout: Duration(minutes: 2),
    );

    await HttpService.instance!.dio!.download(
      url,
      epubPath,
      onReceiveProgress: onProgress,
      options: options,
    );

    final epubFile = File(epubPath);

    // EPUB indirildi → kapağı extract et
    var cover = await _extractAndSaveCover(epubFile: epubFile, bookId: bookId);
    //cover.path; kapak yolu
    return DowloadEpubModel(bookPath: epubPath, coverPath: cover.coverPath);
  }

  // --------------------------------------------------
  // EPUB IMPORT (user file picker sonrası)
  // --------------------------------------------------

  Future<ImportEpubModel> importEpub({
    required String bookId,
    required File sourceFile,
  }) async {
    final bookDir = await _bookDir(bookId);
    final targetPath = p.join(bookDir.path, 'book.epub');
    var newFile = await sourceFile.copy(targetPath);
    var model = ImportEpubModel(
      bookId: bookId,
      bookPath: newFile.path,
      metaData: await _extractAndSaveCover(epubFile: newFile, bookId: bookId),
    );
    return model;
  }
  // --------------------------------------------------
  // DELETE BOOK
  // --------------------------------------------------

  Future<void> deleteBook(String bookId) async {
    final bookDir = await _bookDir(bookId);
    if (await bookDir.exists()) {
      await bookDir.delete(recursive: true);
    }
  }

  // --------------------------------------------------
  // UPDATE COVER IMAGE
  // --------------------------------------------------

  Future<String?> updateCoverImage({
    required String bookId,
    required File newCoverFile,
  }) async {
    try {
      final bookDir = await _bookDir(bookId);

      // Eski kapak dosyalarını sil
      final coverFiles = bookDir.listSync().where((f) {
        final name = p.basename(f.path).toLowerCase();
        return name.startsWith('cover') &&
            (name.endsWith('.jpg') ||
                name.endsWith('.png') ||
                name.endsWith('.jpeg'));
      });

      for (var file in coverFiles) {
        try {
          await file.delete();
        } catch (_) {}
      }

      // Yeni kapağı kaydet
      final ext = p.extension(newCoverFile.path);
      final outFile = File(p.join(bookDir.path, 'cover$ext'));
      await newCoverFile.copy(outFile.path);

      return outFile.path;
    } catch (e) {
      return null;
    }
  }

  // --------------------------------------------------
  // CHECKS
  // --------------------------------------------------
  Future<bool> bookExists(String bookId) async {
    final root = await _booksRootDir();
    final bookDir = Directory(p.join(root.path, bookId));
    return bookDir.exists();
  }

  Future<MetaDataModel> _extractAndSaveCover({
    required File epubFile,
    required String bookId,
  }) async {
    var metaData = MetaDataModel();
    try {
      final bookDir = await _bookDir(bookId);
      final bytes = await epubFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      // OPF bul
      final opfFile = archive.files.firstWhere((f) => f.name.endsWith('.opf'));

      final opfXml = utf8.decode(opfFile.content as List<int>);
      final document = XmlDocument.parse(opfXml);
      final metadataElem = document.findAllElements('metadata').first;
      String? coverPath;

      metaData.title = _metaList(
        metadataElem,
        'title',
      ).firstOrNull; // liste olarak döner
      metaData.authors = _metaList(metadataElem, 'creator');
      metaData.languages = _metaList(metadataElem, 'language').firstOrNull;

      // EPUB 2
      try {
        final meta = document
            .findAllElements('meta')
            .firstWhere((e) => e.getAttribute('name') == 'cover');

        final coverId = meta.getAttribute('content');

        final item = document
            .findAllElements('item')
            .firstWhere((e) => e.getAttribute('id') == coverId);

        coverPath = item.getAttribute('href');
      } catch (_) {}

      // EPUB 3
      if (coverPath == null) {
        try {
          final item = document
              .findAllElements('item')
              .firstWhere(
                (e) =>
                    e.getAttribute('properties')?.contains('cover-image') ??
                    false,
              );
          coverPath = item.getAttribute('href');
        } catch (_) {}
      }

      // Fallback
      if (coverPath == null) {
        final image = archive.files.firstWhere(
          (f) =>
              f.name.toLowerCase().contains('cover') &&
              (f.name.endsWith('.jpg') || f.name.endsWith('.png')),
          orElse: () => archive.files.firstWhere(
            (f) => f.name.endsWith('.jpg') || f.name.endsWith('.png'),
          ),
        );
        coverPath = image.name;
      }

      final opfDir = p.dirname(opfFile.name);
      final fullPath = p.normalize(p.join(opfDir, coverPath));

      final coverFile = archive.files.firstWhere((f) => f.name == fullPath);

      final ext = p.extension(fullPath);
      final outFile = File(p.join(bookDir.path, 'cover$ext'));

      await outFile.writeAsBytes(coverFile.content as List<int>, flush: true);
      metaData.coverPath = outFile.path;
      return metaData;
    } catch (e) {
      // kapak yoksa veya bozuk EPUB
      return metaData;
    }
  }

  List<String> _metaList(XmlElement doc, String localName) {
    return doc.childElements
        .where((e) => e.name.local == localName)
        .map((e) => e.innerText.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }
}
