import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(
    this.valleyWellRepository,
  ) : super(HomeScreenInitial()) {
    getValleyWellQuestions();
  }

  final ValleyWellRepository valleyWellRepository;

  void getValleyWellQuestions() async {
    emit(HomeScreenGetQuestionsLoading());
    try {
      valleyWellRepository.getValleyWellQuestions();
      emit(HomeScreenGetQuestionsSuccess());
    } catch (e) {
      emit(
        HomeScreenGetQuestionsError(
          e.toString(),
        ),
      );
    }
  }

  void updateQuestions() => emit(HomeScreenUpdateQuestions());
}
