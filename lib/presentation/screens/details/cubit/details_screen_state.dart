part of 'details_screen_cubit.dart';

@immutable
sealed class DetailsScreenState {}

final class DetailsScreenInitial extends DetailsScreenState {}

final class DetailsScreenGetQuestionAnswerLoading extends DetailsScreenState {}

final class DetailsScreenGetQuestionAnswerSuccess extends DetailsScreenState {
  final String questionAnswer;

  DetailsScreenGetQuestionAnswerSuccess(
    this.questionAnswer,
  );
}

final class DetailsScreenGetQuestionAnswerError extends DetailsScreenState {
  final String errorMessage;

  DetailsScreenGetQuestionAnswerError(this.errorMessage);
}

final class DetailsScreenGetQuestionAnswerConnectionError extends DetailsScreenState {
  final String errorMessage;

  DetailsScreenGetQuestionAnswerConnectionError(this.errorMessage);
}
