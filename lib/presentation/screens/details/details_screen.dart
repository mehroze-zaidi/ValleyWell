import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/presentation/screens/details/cubit/details_screen_cubit.dart';
import 'package:valley_well/presentation/widgets/custom_error_widget.dart';
import 'package:valley_well/utils/constants/app_colors.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final ValleyWellModel valleyWellModel;

  const DetailsScreen({
    super.key,
    this.index = 0,
    required this.valleyWellModel,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? questionAnswer;

  @override
  void initState() {
    super.initState();
    if (widget.valleyWellModel.questionAnswer == null) {
      context.read<DetailsScreenCubit>().handleValleyWellQuestions(
            widget.index,
            widget.valleyWellModel,
          );
    } else {
      questionAnswer = widget.valleyWellModel.questionAnswer;
    }
  }

  String cleanText(String text) {
    List<String> lines = text.split('\n');

    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('* **') || lines[i].startsWith('    *')) {
        lines[i] = lines[i].replaceFirst('* **', '**');
      }
    }

    return lines.join('\n');
  }

  String removeSymbols(String text) {
    return text.replaceAll(RegExp(r'[|#*]'), '');
  }

  TextSpan formatText(String text, bool isDarkMode) {
    text = cleanText(text);

    List<TextSpan> spans = [];
    List<String> lines = text.split('\n');

    if (lines.isNotEmpty) {
      String firstLine = lines[0].startsWith('##')
          ? lines[0].replaceFirst('##', '').trimLeft()
          : lines[0].trimLeft();

      spans.add(
        TextSpan(
          text: '${removeSymbols(firstLine)}\n',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.darkText : AppColors.lightText,
          ),
        ),
      );

      lines = lines.sublist(1);
    }

    for (var line in lines) {
      if (line.startsWith('##')) {
        spans.add(
          TextSpan(
            text: '${removeSymbols(line.substring(2).trim())}\n',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      } else if (line.startsWith('**') && line.endsWith('**')) {
        spans.add(
          TextSpan(
            text: '\n\n${removeSymbols(line.substring(2, line.length - 2))}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      } else if (line.startsWith('* **') && line.endsWith('**')) {
        spans.add(
          TextSpan(
            text: '${removeSymbols(line.substring(3, line.length - 2))}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      } else if (line.startsWith('* **')) {
        spans.add(
          TextSpan(
            text: '${removeSymbols(line.substring(3))}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      } else if (line.startsWith('* ')) {
        spans.add(
          TextSpan(
            text: '${removeSymbols(line.substring(2))}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      } else if (line.contains('**')) {
        List<String> parts = line.split('**');
        for (int i = 0; i < parts.length; i++) {
          if (i % 2 == 1) {
            spans.add(
              TextSpan(
                text: removeSymbols(parts[i]),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                ),
              ),
            );
          } else {
            spans.add(
              TextSpan(
                text: removeSymbols(parts[i]),
                style: TextStyle(
                  color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                ),
              ),
            );
          }
        }
        spans.add(const TextSpan(text: '\n'));
      } else {
        spans.add(
          TextSpan(
            text: '${removeSymbols(line)}\n',
            style: TextStyle(
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
        border: Border(
          bottom: BorderSide(
            color: isDarkMode ? AppColors.white30 : AppColors.black20,
            width: 0.5,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(
            CupertinoIcons.back,
            color: isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
            size: 28,
          ),
        ),
        middle: Text(
          widget.valleyWellModel.question,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                fontSize: 16,
              ),
        ),
      ),
      child: BlocConsumer<DetailsScreenCubit, DetailsScreenState>(
        listener: (context, state) {
          if (state is DetailsScreenGetQuestionAnswerSuccess) {
            setState(() {
              questionAnswer = state.questionAnswer;
            });
          }
        },
        builder: (context, state) {
          if (state is DetailsScreenGetQuestionAnswerLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                color: isDarkMode ? AppColors.darkText : AppColors.lightText,
              ),
            );
          }
          if (state is DetailsScreenGetQuestionAnswerConnectionError) {
            return CustomErrorWidget(
              isDarkMode: isDarkMode,
              onRetry: () => context.read<DetailsScreenCubit>().handleValleyWellQuestions(
                    widget.index,
                    widget.valleyWellModel,
                  ),
            );
          }
          if (state is DetailsScreenGetQuestionAnswerError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                        ),
                  ),
                  GestureDetector(
                    onTap: () => context.read<DetailsScreenCubit>().handleValleyWellQuestions(
                          widget.index,
                          widget.valleyWellModel,
                        ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Try again",
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: AppColors.darkText,
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 10,
                bottom: 128,
              ),
              child: RichText(
                text: formatText(questionAnswer!, isDarkMode),
              ),
            ),
          );
        },
      ),
    );
  }
}
