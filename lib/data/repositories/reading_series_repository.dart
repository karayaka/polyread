import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:polyread/core/app_tools/project_const.dart';
import 'package:polyread/data/local_storage/isar_service.dart';
import 'package:polyread/data/local_storage/models/reading_series_model.dart';
import 'package:polyread/data/local_storage/models/sync_db_storage_model.dart';
import 'package:polyread/models/series_models/series_calculate.dart';

class ReadingSeriesRepository {
  late IsarService _isarService;

  ReadingSeriesRepository() {
    _isarService = Get.find();
  }

  Future<Id> saveReadingSeries(double progres, int readingTime) async {
    try {
      final isar = await _isarService.db;
      return await isar.writeTxn(() async {
        var syncModel = await getLastSyncDate();
        var readingSeries = await getReadingSeriesByDate();
        readingSeries ??= ReadingSeriesModel();
        readingSeries.progres += progres;
        readingSeries.readingTime += readingTime;
        syncModel ??= SyncDbStorageModel(
          tableName: ProjectConst.ReadingSeriesStoregeKey,
        );
        syncModel.lastSync = DateTime.now();
        await isar.syncDbStorageModels.put(syncModel);
        return await isar.readingSeriesModels.put(readingSeries);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReadingSeriesModel>> getAllReadingSeries() async {
    final isar = await _isarService.db;
    return await isar.readingSeriesModels.where().findAll();
  }

  //todo seri değiştimi kontrolü yapılacak ve kutlama paylaşım sayfasına yönlendirilecek
  Future<SeriesCalculate> getSeriesCalculate() async {
    var series = await getAllReadingSeries();
    var nseriesDay = 0;
    var readingTime = 0;
    var today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    series.sort((a, b) => a.date.compareTo(b.date));

    var lng = ProjectConst.ReadingSeriesDeleteDay;
    if (series.length < ProjectConst.ReadingSeriesDeleteDay) {
      lng = series.length;
    }

    for (var i = 0; i < lng; i++) {
      var sr = series.firstWhereOrNull((p) => p.date == today);
      if (sr != null) {
        nseriesDay++;
        readingTime += sr.readingTime;
      } else {
        nseriesDay = 0;
      }
      today = today.add(Duration(days: -1));
    }
    //10 günden eski verileri sil
    deleteReadingSeries();
    return SeriesCalculate(
      readingTime: (readingTime ~/ 60) ~/ lng, //günlük dakika hesabı
      series: nseriesDay,
    );
  }

  Future<ReadingSeriesModel?> getReadingSeriesByDate() async {
    final isar = await _isarService.db;
    return await isar.readingSeriesModels
        .where()
        .dateEqualTo(
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        )
        .findFirst();
  }

  Future deleteReadingSeries() async {
    final isar = await _isarService.db;
    await isar.readingSeriesModels
        .where()
        .dateLessThan(DateTime.now().add(Duration(days: -11)))
        .deleteAll();
  }

  Future<SyncDbStorageModel?> getLastSyncDate() async {
    try {
      final isar = await _isarService.db;
      return await isar.syncDbStorageModels
          .where()
          .tableNameEqualTo(ProjectConst.ReadingSeriesStoregeKey)
          .findFirst();
    } catch (e) {
      rethrow;
    }
  }
}
