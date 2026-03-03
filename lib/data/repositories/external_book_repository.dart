import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/local_storage/models/external_book_storage_model.dart';

class ExternalBookRepository {
  late IsarService _isarService;
  ExternalBookRepository() {
    _isarService = Get.find();
  }

  Future<List<ExternalBookStorageModel>> getExternalBookHistory() async {
    try {
      final isar = await _isarService.db;
      return await isar.externalBookStorageModels.where().findAll();
    } catch (e) {
      rethrow;
    }
  }

  ///Son güncel hali ile date günceelenep kayıt edeliyor
  Future<Id> saveExternalBookHistory(ExternalBookStorageModel model) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        var existing = await isar.externalBookStorageModels
            .where()
            .pathEqualTo(model.path)
            .findFirst();
        if (existing != null) {
          model.id = existing.id;
          model.modifiedDate = DateTime.now();
        }
        return await isar.externalBookStorageModels.put(model);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteExternalBookHistory(Id id) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        return await isar.externalBookStorageModels.delete(id);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteExternalBookHistoryByPath(String path) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        return await isar.externalBookStorageModels
            .where()
            .pathEqualTo(path)
            .deleteFirst();
      });
    } catch (e) {
      rethrow;
    }
  }
}
