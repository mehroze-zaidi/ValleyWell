import 'package:valley_well/data/models/response_model.dart';
import 'package:valley_well/data/models/valley_well_model.dart';

abstract class ValleyWellRepository {
  Future<List<ValleyWellModel>> getValleyWellQuestions();

  Future<ResponseModel<String>> handleValleyWellQuestions(
    int index,
    ValleyWellModel valleyWellModel,
  );
}
