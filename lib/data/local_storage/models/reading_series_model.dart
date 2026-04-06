import 'package:isar_community/isar.dart';

part 'reading_series_model.g.dart';

@Collection()
class ReadingSeriesModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late DateTime date = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @Index(type: IndexType.value)
  double progres = 0;

  @Index(type: IndexType.value)
  int readingTime = 0;
}
