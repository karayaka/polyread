import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:isar_community/isar.dart';
import 'package:polyread/core/app_tools/project_const.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/local_storage/models/ps_storage_model.dart';
import 'package:polyread/data/local_storage/models/sync_db_storage_model.dart';

class PsRepository {
  late IsarService _isarService;
  PsRepository() {
    _isarService = Get.find();
  }

  Future<List<PsStorageModel>> getPsByBookId(String bookId) async {
    try {
      var isar = await _isarService.db;
      return isar.psStorageModels.where().bookIdEqualTo(bookId).findAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PsStorageModel>> getAllPs() async {
    try {
      var isar = await _isarService.db;
      return isar.psStorageModels.where().findAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getSuggestionTags() async {
    try {
      List<String> suggestionTags = [];
      var allPs = await getAllPs();
      for (var ps in allPs) {
        for (var tag in ps.tags ?? [""]) {
          if (!suggestionTags.contains(tag)) {
            suggestionTags.add(tag);
          }
        }
      }
      return suggestionTags;
    } catch (e) {
      rethrow;
    }
  }

  Future<PsStorageModel?> getPsById(Id id) async {
    try {
      var isar = await _isarService.db;
      return await isar.psStorageModels.get(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<PsStorageModel?> getPsByCfi(String cfi) async {
    try {
      var isar = await _isarService.db;
      return await isar.psStorageModels.where().psCfiEqualTo(cfi).findFirst();
    } catch (e) {
      rethrow;
    }
  }

  Future<PsStorageModel?> getPsByText(String text) async {
    try {
      var isar = await _isarService.db;
      return await isar.psStorageModels.where().textEqualTo(text).findFirst();
    } catch (e) {
      rethrow;
    }
  }

  Future<Id> saveOrUpdatePs(PsStorageModel ps) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        var syncModel = await getLastSyncDate();
        syncModel ??= SyncDbStorageModel(tableName: ProjectConst.PsStorageKey);
        syncModel.lastSync = DateTime.now();
        await isar.syncDbStorageModels.put(syncModel);
        //todo burda veyya bir üst servicede güncelleme yapılacak google drive update işlemi
        return await isar.psStorageModels.put(ps);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deletePs(Id id) async {
    try {
      final isar = await _isarService.db;

      return await isar.writeTxn(() async {
        var syncModel = await getLastSyncDate();
        syncModel ??= SyncDbStorageModel(tableName: ProjectConst.PsStorageKey);
        syncModel.lastSync = DateTime.now();
        await isar.syncDbStorageModels.put(syncModel);
        return await isar.psStorageModels.delete(id);
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
          .tableNameEqualTo(ProjectConst.PsStorageKey)
          .findFirst();
    } catch (e) {
      rethrow;
    }
  }
}
