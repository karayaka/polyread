import 'package:isar_community/isar.dart';
part 'vocabulary_storage_model.g.dart';

@Collection()
class VocabularyStorageModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  bool onShowVocabulary = false;
  @Index(type: IndexType.value)
  bool onLearnVocabulary = false;
  @Index(type: IndexType.value)
  late String bookId;
  @Index(type: IndexType.value)
  late String sourceWord;
  @Index(type: IndexType.value)
  late String text;
  @Index(type: IndexType.value)
  late String? desc;
  @Index(type: IndexType.value)
  late String? toLanguage;
  @Index(type: IndexType.value)
  late String languageCode;
  @Index(type: IndexType.value)
  DateTime createdAt = DateTime.now();
}
