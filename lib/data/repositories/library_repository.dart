import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:polyread/core/app_tools/project_const.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/local_storage/models/sync_db_storage_model.dart';

class LibraryRepository {
  late IsarService _isarService;

  LibraryRepository() {
    _isarService = Get.find();
  }

  Future<Id> saveLibraryBook(LibraryStorageModel book) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        var syncModel = await getLastSyncDate();
        syncModel ??= SyncDbStorageModel(
          tableName: ProjectConst.LibraryBookStoregeKey,
        );
        syncModel.lastSync = DateTime.now();
        await isar.syncDbStorageModels.put(syncModel);
        //todo burda veyya bir üst servicede güncelleme yapılacak
        return await isar.libraryStorageModels.put(book);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LibraryStorageModel>> getAllLibrary() async {
    final isar = await _isarService.db;
    return await isar.libraryStorageModels
        .where()
        .sortByLastUpdateDesc()
        .findAll();
  }

  Future<LibraryStorageModel?> getByBookId(String bookId) async {
    try {
      final isar = await _isarService.db;
      return await isar.libraryStorageModels
          .where()
          .bookIdEqualTo(bookId)
          .findFirst();
    } catch (e) {
      rethrow;
    }
  }

  Future<LibraryStorageModel?> getLibraryBookById(Id id) async {
    try {
      final isar = await _isarService.db;
      return await isar.libraryStorageModels.get(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteLibraryBook(Id id) async {
    try {
      final isar = await _isarService.db;

      return await isar.writeTxn(() async {
        var syncModel = await getLastSyncDate();
        syncModel ??= SyncDbStorageModel(
          tableName: ProjectConst.LibraryBookStoregeKey,
        );
        syncModel.lastSync = DateTime.now();
        await isar.syncDbStorageModels.put(syncModel);
        return await isar.libraryStorageModels.delete(id);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<SyncDbStorageModel?> getLastSyncDate() async {
    try {
      final isar = await _isarService.db;
      return await isar.syncDbStorageModels
          .where()
          .tableNameEqualTo(ProjectConst.LibraryBookStoregeKey)
          .findFirst();
    } catch (e) {
      rethrow;
    }
  }
}
