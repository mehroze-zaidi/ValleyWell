part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenGetQuestionsLoading extends HomeScreenState {}

final class HomeScreenGetQuestionsSuccess extends HomeScreenState {}

final class HomeScreenGetQuestionsError extends HomeScreenState {
  final String errorMessage;

  HomeScreenGetQuestionsError(this.errorMessage);
}

final class HomeScreenUpdateQuestions extends HomeScreenState {}
