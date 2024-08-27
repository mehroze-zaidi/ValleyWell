part of 'custom_question_screen_cubit.dart';

@freezed
class CustomQuestionScreenState with _$CustomQuestionScreenState {
  const factory CustomQuestionScreenState.initial() = _Initial;


  const factory CustomQuestionScreenState.loading() = _Loading;
  const factory CustomQuestionScreenState.loaded(String questionAnswer) = _Loaded;
  const factory CustomQuestionScreenState.error(String error) = _Error;
}
