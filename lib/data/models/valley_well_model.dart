import 'package:isar/isar.dart';

part 'valley_well_model.g.dart';

@Collection()
class ValleyWellModel {
  final Id id = Isar.autoIncrement;
  final String question;
  final String? questionAnswer;

  ValleyWellModel({
    required this.question,
    this.questionAnswer,
  });

  ValleyWellModel copyWith({
    String? question,
    String? questionAnswer,
  }) =>
      ValleyWellModel(
        question: question ?? this.question,
        questionAnswer: questionAnswer ?? this.questionAnswer,
      );
}
