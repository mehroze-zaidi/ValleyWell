import 'package:isar/isar.dart';
import 'package:valley_well/data/models/valley_well_model.dart';

class ValleyWellDatabase {
  final Isar isar;

  ValleyWellDatabase(
    this.isar,
  );

  Future<List<ValleyWellModel>> getAllValleyWellModel() async =>
      await isar.valleyWellModels.where().findAll();

  Future<void> saveValleyWellModel({
    String? index,
    required ValleyWellModel valleyWellModel,
  }) async {
    if (index != null) {
      await isar.writeTxn(
        () async {
          await isar.valleyWellModels.putByIndex(
            index,
            valleyWellModel,
          );
        },
      );
    } else {
      await isar.writeTxn(
        () async {
          await isar.valleyWellModels.put(
            valleyWellModel,
          );
        },
      );
    }
  }

  Future<void> deleteValleyWellModel(
    ValleyWellModel valleyWellModel,
  ) async =>
      await isar.writeTxn(
        () async => await isar.collection<ValleyWellModel>().delete(
              valleyWellModel.id,
            ),
      );

  Future<void> deleteAllValleyWellModel() async => await isar.writeTxn(
        () async => await isar.collection<ValleyWellModel>().where().deleteAll(),
      );
}
