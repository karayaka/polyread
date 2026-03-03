import 'package:polyread/data/local_storage/models/ps_storage_model.dart';

class PsDtoModel {
  int? id;
  late String bookId;
  late String text;
  String? psCfi;
  String? pageCfi;
  String? ps;
  List<String>? tags;
  int? colorHex = 4294967295;
  bool underline = false;
  DateTime? date = DateTime.now();

  PsDtoModel({
    this.id,
    required this.bookId,
    required this.text,
    this.colorHex,
    this.date,
    this.ps,
    this.psCfi,
    this.pageCfi,
    this.tags,
    this.underline = false,
  });
  PsStorageModel toPsStorageModel() {
    var model = PsStorageModel();
    if (id != null) {
      model.id = id!;
    }
    model.bookId = bookId;
    model.colorHex = colorHex;
    model.date = date ?? DateTime.now();
    model.ps = ps;
    model.pageCfi = pageCfi;
    model.psCfi = psCfi;
    model.tags = tags;
    model.text = text;
    model.underline = underline;
    return model;
  }
}
