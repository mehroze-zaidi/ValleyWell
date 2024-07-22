import 'package:flutter/material.dart';
import 'package:valley_well/data/models/valley_well_model.dart';
import 'package:valley_well/presentation/screens/details/details_screen.dart';
import 'package:valley_well/presentation/screens/home/home_screen.dart';
import 'package:valley_well/presentation/widgets/responsive_layout.dart';
import 'package:valley_well/utils/constants/app_colors.dart';
import 'package:valley_well/utils/constants/app_constant.dart';
import 'package:valley_well/utils/enums/develop_mode.dart';

class ValleyWellApp extends StatelessWidget {
  const ValleyWellApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Valley Well',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
          ),
          scaffoldBackgroundColor: AppColors.primaryColor,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                surfaceTintColor: AppColors.transparent,
              ),
          useMaterial3: true,
        ),
        home: ResponsiveLayout(
          tiny: AppConstants.developMode == DevelopMode.release
              ? const HomeScreen()
              : DetailsScreen(
                  valleyWellModel: ValleyWellModel(
                    question: "What is a premium in the context of health insurance?",
                  ),
                ),
          phone: AppConstants.developMode == DevelopMode.release
              ? const HomeScreen()
              : DetailsScreen(
                  valleyWellModel: ValleyWellModel(
                    question: "What is a premium in the context of health insurance?",
                  ),
                ),
          tablet: AppConstants.developMode == DevelopMode.release
              ? const HomeScreen()
              : DetailsScreen(
                  valleyWellModel: ValleyWellModel(
                    question: "What is a premium in the context of health insurance?",
                  ),
                ),
          largeTablet: AppConstants.developMode == DevelopMode.release
              ? const HomeScreen()
              : DetailsScreen(
                  valleyWellModel: ValleyWellModel(
                    question: "What is a premium in the context of health insurance?",
                  ),
                ),
          computer: AppConstants.developMode == DevelopMode.release
              ? const HomeScreen()
              : DetailsScreen(
                  valleyWellModel: ValleyWellModel(
                    question: "What is a premium in the context of health insurance?",
                  ),
                ),
        ),
      );
}
