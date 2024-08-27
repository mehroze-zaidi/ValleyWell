import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valley_well/data/models/response_model.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';
import 'package:valley_well/utils/constants/app_strings.dart';
import 'package:valley_well/utils/enums/response_status.dart';

part 'custom_question_screen_state.dart';
part 'custom_question_screen_cubit.freezed.dart';

class CustomQuestionScreenCubit extends Cubit<CustomQuestionScreenState> {
  CustomQuestionScreenCubit(  this.valleyWellRepository) : super(const CustomQuestionScreenState.initial());
String searchText="";
  final ValleyWellRepository valleyWellRepository;
  void getCustomQuestionAnswer(

      ValleyWellModel valleyWellModel,
      ) async {
    emit(const _Loading());
    try {
      final ResponseModel responseModel = await valleyWellRepository.getValleyWellCustomAnswer(

        valleyWellModel,
      );
      debugPrint(responseModel.responseStatus.toString());
      debugPrint(responseModel.response.toString());
      if (responseModel.responseStatus == ResponseStatus.success) {
        emit(
          _Loaded(
            responseModel.response,
          ),
        );
      } else if (responseModel.responseStatus == ResponseStatus.failedToConnectToServer) {
        emit(
          const _Error(
            AppStrings.failedToConnectToServer,
          ),
        );
      } else if (responseModel.responseStatus == ResponseStatus.noInternetConnection) {
        emit(
          const _Error(
            AppStrings.noInternetConnection,
          ),
        );
      } else {
        emit(
          const _Error(
            AppStrings.unknownError,
          ),
        );
      }
    } catch (e) {
      emit(
        _Error(
          e.toString(),
        ),
      );
    }
  }
}
