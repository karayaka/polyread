import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polyread/data/local_storage/models/external_book_storage_model.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/local_storage/models/ps_storage_model.dart';
import 'package:polyread/data/local_storage/models/reading_series_model.dart';
import 'package:polyread/data/local_storage/models/sync_db_storage_model.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          ExternalBookStorageModelSchema,
          LibraryStorageModelSchema,
          SyncDbStorageModelSchema,
          PsStorageModelSchema,
          VocabularyStorageModelSchema,
          ReadingSeriesModelSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
