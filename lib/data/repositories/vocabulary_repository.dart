import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/local_storage/models/vocabulary_storage_model.dart';

class VocabularyRepository {
  late IsarService _isarService;

  VocabularyRepository() {
    _isarService = Get.find<IsarService>();
  }

  Future<Id> saveVocabulary(VocabularyStorageModel vocab) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        return await isar.vocabularyStorageModels.put(vocab);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<VocabularyStorageModel?> getVocabulary(String word) async {
    try {
      final isar = await _isarService.db;
      return await isar.vocabularyStorageModels
          .filter()
          .sourceWordEqualTo(word)
          .findFirst();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VocabularyStorageModel>> getAllVocabulary() async {
    try {
      final isar = await _isarService.db;
      return await isar.vocabularyStorageModels.where().findAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VocabularyStorageModel>> getHistoryVocabulary() async {
    try {
      final isar = await _isarService.db;
      return await isar.vocabularyStorageModels
          .filter()
          .onShowVocabularyEqualTo(true)
          .and()
          .onLearnVocabularyEqualTo(false)
          .findAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleShowVocabulary(int id, bool show) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        final vocab = await isar.vocabularyStorageModels.get(id);
        if (vocab != null) {
          vocab.onShowVocabulary = show;
          vocab.onLearnVocabulary = false;
          await isar.vocabularyStorageModels.put(vocab);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleLearnVocabulary(int id, bool learned) async {
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        final vocab = await isar.vocabularyStorageModels.get(id);
        if (vocab != null) {
          vocab.onLearnVocabulary = learned;
          await isar.vocabularyStorageModels.put(vocab);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteVocabulary(int id) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        return await isar.vocabularyStorageModels.delete(id);
      });
    } catch (e) {
      rethrow;
    }
  }
}
