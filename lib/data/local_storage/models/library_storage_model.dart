import 'package:isar_community/isar.dart';
part 'library_storage_model.g.dart';

@Collection()
class LibraryStorageModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String bookId;
  @Index(type: IndexType.value)
  late String bookTitle;
  @Index(type: IndexType.value)
  late String bookPath;
  @Index(type: IndexType.value)
  String? bookCoverPath;
  @Index(type: IndexType.value)
  String? langugeCode;
  @Index(type: IndexType.value)
  List<String>? authors;
  @Index(type: IndexType.value)
  String? lastLocationCfi;
  @Index(type: IndexType.value)
  late int progres;
  @Index(type: IndexType.value)
  List<String>? tags;
  @Index(type: IndexType.value)
  late DateTime lastUpdate = DateTime.now();
}
