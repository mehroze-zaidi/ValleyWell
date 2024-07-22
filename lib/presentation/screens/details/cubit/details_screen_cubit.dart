import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:valley_well/data/models/response_model.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';
import 'package:valley_well/utils/constants/app_strings.dart';
import 'package:valley_well/utils/enums/response_status.dart';

part 'details_screen_state.dart';

class DetailsScreenCubit extends Cubit<DetailsScreenState> {
  DetailsScreenCubit(
    this.valleyWellRepository,
  ) : super(DetailsScreenInitial());

  final ValleyWellRepository valleyWellRepository;

  void handleValleyWellQuestions(
    int index,
    ValleyWellModel valleyWellModel,
  ) async {
    emit(DetailsScreenGetQuestionAnswerLoading());
    try {
      final ResponseModel responseModel = await valleyWellRepository.handleValleyWellQuestions(
        index,
        valleyWellModel,
      );
      debugPrint(responseModel.responseStatus.toString());
      debugPrint(responseModel.response.toString());
      if (responseModel.responseStatus == ResponseStatus.success) {
        emit(
          DetailsScreenGetQuestionAnswerSuccess(
            responseModel.response,
          ),
        );
      } else if (responseModel.responseStatus == ResponseStatus.failedToConnectToServer) {
        emit(
          DetailsScreenGetQuestionAnswerError(
            AppStrings.failedToConnectToServer,
          ),
        );
      } else if (responseModel.responseStatus == ResponseStatus.noInternetConnection) {
        emit(
          DetailsScreenGetQuestionAnswerError(
            AppStrings.noInternetConnection,
          ),
        );
      } else {
        emit(
          DetailsScreenGetQuestionAnswerError(
            AppStrings.unknownError,
          ),
        );
      }
    } catch (e) {
      emit(
        DetailsScreenGetQuestionAnswerError(
          e.toString(),
        ),
      );
    }
  }
}
