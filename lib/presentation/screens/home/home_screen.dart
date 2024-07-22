import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';
import 'package:valley_well/presentation/screens/details/cubit/details_screen_cubit.dart';
import 'package:valley_well/presentation/screens/details/details_screen.dart';
import 'package:valley_well/presentation/screens/home/cubit/home_screen_cubit.dart';
import 'package:valley_well/utils/common/app_utils.dart';
import 'package:valley_well/utils/constants/app_colors.dart';
import 'package:valley_well/utils/constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => HomeScreenCubit(
        GetIt.I.get<ValleyWellRepository>(),
      ),
      child: CupertinoPageScaffold(
        backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
          border: Border(
            bottom: BorderSide(
              color: isDarkMode ? AppColors.white30 : AppColors.black20,
              width: 0.5,
            ),
          ),
          middle: Text(
            AppStrings.appName,
            style: TextStyle(
              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        ),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenGetQuestionsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 128,
                left: 10,
                right: 10,
              ),
              itemCount: AppUtils.instance.questionAnswerModelList.length,
              itemBuilder: (context, index) {
                final ValleyWellModel valleyWellModel =
                    AppUtils.instance.questionAnswerModelList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => DetailsScreenCubit(
                              GetIt.I.get<ValleyWellRepository>(),
                            ),
                            child: DetailsScreen(
                              index: index,
                              valleyWellModel: valleyWellModel,
                            ),
                          ),
                        ),
                      ).then(
                        (value) => context.read<HomeScreenCubit>().updateQuestions(),
                      );
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode ? AppColors.darkShadow : AppColors.lightShadow,
                            blurRadius: 10.0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                    valleyWellModel.question,
                                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                          color:
                                              isDarkMode ? AppColors.darkText : AppColors.lightText,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  CupertinoIcons.chevron_forward,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                            if (valleyWellModel.questionAnswer != null) ...[
                              const SizedBox(height: 5),
                              Text(
                                valleyWellModel.questionAnswer!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                      color: isDarkMode
                                          ? AppColors.darkAnswerText
                                          : AppColors.lightAnswerText,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
