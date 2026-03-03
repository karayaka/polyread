import 'package:polyread/models/dto_models/library_service_models/meta_data_model.dart';

class ImportEpubModel {
  late MetaDataModel metaData;
  late String bookPath;
  late String bookId;
  ImportEpubModel({
    required this.bookPath,
    required this.bookId,
    required this.metaData,
  });
}
