import 'package:valley_well/data/api/gemini_api_service.dart';
import 'package:valley_well/data/database/valley_well_database.dart';
import 'package:valley_well/data/models/response_model.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';
import 'package:valley_well/utils/common/app_utils.dart';
import 'package:valley_well/utils/enums/response_status.dart';

class ValleyWellRepositoryImpl implements ValleyWellRepository {
  final GeminiApiService geminiApiService;
  final ValleyWellDatabase valleyWellDatabase;

  ValleyWellRepositoryImpl(
    this.geminiApiService,
    this.valleyWellDatabase,
  );

  @override
  Future<List<ValleyWellModel>> getValleyWellQuestions() async {
    List<ValleyWellModel> valleyWellModelList = await valleyWellDatabase.getAllValleyWellModel();

    if (valleyWellModelList.isEmpty) {
      for (var valleyWellModel in AppUtils.instance.questionAnswerModelList) {
        await valleyWellDatabase.saveValleyWellModel(
          valleyWellModel: valleyWellModel,
        );
      }
      valleyWellModelList = await valleyWellDatabase.getAllValleyWellModel();
    }
    AppUtils.instance.questionAnswerModelList = valleyWellModelList;
    return AppUtils.instance.questionAnswerModelList;
  }

  @override
  Future<ResponseModel<String>> handleValleyWellQuestions(
    int index,
    ValleyWellModel valleyWellModel,
  ) async {
    String inst="Don't add any special character except start (*) ";
    final ResponseModel<String> responseModel = await geminiApiService.callGeminiApi(
      valleyWellModel.question + inst,
    );
    if (responseModel.responseStatus == ResponseStatus.success) {
      ValleyWellModel valleyWellModelWithAnswer = valleyWellModel.copyWith(
        questionAnswer: responseModel.response,
      );
      AppUtils.instance.questionAnswerModelList[index] = valleyWellModelWithAnswer;
      await valleyWellDatabase.deleteAllValleyWellModel();
      for (var valleyWellModel in AppUtils.instance.questionAnswerModelList) {
        await valleyWellDatabase.saveValleyWellModel(
          valleyWellModel: valleyWellModel,
        );
      }
    }
    return responseModel;
  }
}
