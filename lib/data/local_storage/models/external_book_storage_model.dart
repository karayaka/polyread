import 'package:isar_community/isar.dart';
part 'external_book_storage_model.g.dart';

@Collection()
class ExternalBookStorageModel {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? path;
  @Index(type: IndexType.value)
  String? name;
  @Index(type: IndexType.value)
  DateTime? modifiedDate;

  ExternalBookStorageModel({this.path, this.name, this.modifiedDate});

  Map<String, dynamic> toJson() {
    return {
      "path": path,
      "name": name,
      "modifiedDate": modifiedDate?.toIso8601String(),
    };
  }

  factory ExternalBookStorageModel.fromJson(Map<String, dynamic> json) {
    return ExternalBookStorageModel(
      path: json['path'],
      name: json['name'],
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : null,
    );
  }
}
