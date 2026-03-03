import 'package:isar_community/isar.dart';
part 'sync_db_storage_model.g.dart';

@Collection()
class SyncDbStorageModel {
  SyncDbStorageModel({this.tableName, DateTime? lastSyncDate}) {
    lastSync = lastSyncDate ?? DateTime.now();
  }
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String? tableName;

  @Index(type: IndexType.value)
  late DateTime lastSync = DateTime.now();
}
