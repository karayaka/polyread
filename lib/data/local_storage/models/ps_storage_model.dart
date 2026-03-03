import 'package:isar_community/isar.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_dto_model.dart';
part 'ps_storage_model.g.dart';

@Collection()
class PsStorageModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String bookId;

  @Index(type: IndexType.value)
  late String text;

  @Index(type: IndexType.value)
  late String? psCfi;

  @Index(type: IndexType.value)
  late String? pageCfi;

  @Index(type: IndexType.value)
  late String? ps;

  @Index(type: IndexType.value)
  List<String>? tags;

  @Index(type: IndexType.value)
  late int? colorHex;

  @Index(type: IndexType.value)
  bool underline = false;

  @Index(type: IndexType.value)
  DateTime date = DateTime.now();

  PsDtoModel toPsDtoModel() => PsDtoModel(
    bookId: bookId,
    text: text,
    id: id,
    ps: ps,
    psCfi: psCfi,
    pageCfi: pageCfi,
    tags: tags,
    colorHex: colorHex,
    underline: underline,
    date: date,
  );
}
