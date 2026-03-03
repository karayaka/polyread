import 'package:polyread/core/enums/page_event_type.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_dto_model.dart';

class PsPageModel {
  late String bookId;
  String? psCfi;
  String? pageCfi;
  late String text;
  PageEventType eventType = PageEventType.save;
  PsPageModel({
    required this.bookId,
    required this.text,
    required this.eventType,
    this.psCfi,
    this.pageCfi,
  });
  PsDtoModel toDtoModel() => PsDtoModel(
    bookId: bookId,
    text: text,
    ps: "",
    psCfi: psCfi,
    pageCfi: pageCfi,
  );

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'text': text,
      "psCfi": psCfi,
      "pageCfi": pageCfi,
      "eventType": eventType,
    };
  }

  factory PsPageModel.fromMap(Map<String, dynamic> map) => PsPageModel(
    bookId: map["bookId"],
    text: map["text"],
    pageCfi: map["pageCfi"],
    psCfi: map["psCfi"],
    eventType: map["eventType"],
  );
}
