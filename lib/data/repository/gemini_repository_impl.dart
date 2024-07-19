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
    if (valleyWellModelList.isNotEmpty) {
      AppUtils.instance.questionAnswerModelList = valleyWellModelList;
      return AppUtils.instance.questionAnswerModelList;
    } else {
      for (var valleyWellModel in AppUtils.instance.questionAnswerModelList) {
        await valleyWellDatabase.saveValleyWellModel(
          valleyWellModel: valleyWellModel,
        );
      }
      return AppUtils.instance.questionAnswerModelList;
    }
  }

  @override
  Future<ResponseModel<String>> handleValleyWellQuestions(
    int index,
    ValleyWellModel valleyWellModel,
  ) async {
    final ResponseModel<String> responseModel = await geminiApiService.callGeminiApi(
      valleyWellModel.question,
    );
    if (responseModel.responseStatus == ResponseStatus.success) {
      ValleyWellModel valleyWellModelWithAnswer = valleyWellModel.copyWith(
        questionAnswer: responseModel.response,
      );
      await valleyWellDatabase.saveValleyWellModel(
        index: index.toString(),
        valleyWellModel: valleyWellModelWithAnswer,
      );
      AppUtils.instance.questionAnswerModelList[index] = valleyWellModelWithAnswer;
    }
    return responseModel;
  }
}
