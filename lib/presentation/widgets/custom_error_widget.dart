import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:valley_well/utils/constants/app_assets.dart';
import 'package:valley_well/utils/constants/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final bool isDarkMode;
  final Function() onRetry;

  const CustomErrorWidget({
    super.key,
    required this.isDarkMode,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onRetry(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Lottie.asset(
              AppAssets.noInternetConnectionLottieAsset,
              height: 80,
            ),
          ),
          Text(
            "No Internet Connection!",
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 64,
              vertical: 8,
            ),
            child: Text(
              "Please make sure your device is connected to the Internet.",
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
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
        ],
      ),
    );
  }
}
