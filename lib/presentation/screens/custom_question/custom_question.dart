import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/domain/repository/valley_well_repository.dart';
import 'package:valley_well/presentation/screens/custom_question/cubit/custom_question_screen_cubit.dart';
import 'package:valley_well/presentation/widgets/custom_cupertino_app_textfield.dart';
import 'package:valley_well/presentation/widgets/shape_shimmer_loading.dart';
import 'package:valley_well/presentation/widgets/text_loading_shimmer_widget.dart';

import '../../../utils/constants/app_colors.dart';

class CustomQuestionScreen extends StatefulWidget {
  const CustomQuestionScreen({super.key});

  @override
  State<CustomQuestionScreen> createState() => _CustomQuestionScreenState();
}

class _CustomQuestionScreenState extends State<CustomQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery
        .of(context)
        .platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return BlocProvider(
      create: (context) =>
          CustomQuestionScreenCubit(
            GetIt.I.get<ValleyWellRepository>(),
          ),
      child: Builder(
          builder: (context) {
            return CupertinoPageScaffold(
              backgroundColor:
              isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
              navigationBar: CupertinoNavigationBar(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                backgroundColor:
                isDarkMode ? AppColors.darkBackground : AppColors
                    .lightBackground,
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(
                    CupertinoIcons.back,
                    color: isDarkMode ? AppColors.darkIcon : AppColors.lightIcon,
                    size: 28,
                  ),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? AppColors.white30 : AppColors.black20,
                    width: 0.5,
                  ),
                ),
                middle: Text(
                  "Ask Health Insurance Question",
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkText : AppColors
                        .lightText,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CupertinoAppTextfield(
                      onChange: (value) {
                        context
                            .read<CustomQuestionScreenCubit>()
                            .searchText = value;
                      },
                      showShadow: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<CustomQuestionScreenCubit,
                            CustomQuestionScreenState>(
                          builder: (context, state) {
                           return state.when(initial: ()=> _searchIcon(context),
                                loading: ()=> const ShapeShimmerLoading(width: 30,height: 30,),
                                loaded: (_)=> _searchIcon(context),
                                error: (error) => _searchIcon(context) ,);

                          },
                        ),
                      ),
                      hint: "Write your question here",
                      color: AppColors.lightCard,
                    ),
                  ),
                  Expanded(
                      child: BlocBuilder<CustomQuestionScreenCubit,
                          CustomQuestionScreenState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const SizedBox(),
                            loading: () =>
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: TextLoadingShimmerWidget(),
                            ),
                            loaded: (questionAnswer) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    questionAnswer,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                            error: (error) {
                              return Text(
                                error,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: AppColors.black,
                                ),
                              );
                            },
                          );
                        },
                      ))
                ],
              ),
            );
          }
      ),
    );
  }


  Widget _searchIcon(BuildContext context){
    return IconButton(
      visualDensity: const VisualDensity(vertical: -3),
      onPressed: () {
        context.read<CustomQuestionScreenCubit>()
            .getCustomQuestionAnswer(
            ValleyWellModel(question:context.read<CustomQuestionScreenCubit>().searchText));
      },
      icon: const Icon(
        Icons.search,
        size: 24,
      ),
    );


  }
}
