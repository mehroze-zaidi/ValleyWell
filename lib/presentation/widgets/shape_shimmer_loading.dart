import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valley_well/utils/constants/app_colors.dart';

class ShapeShimmerLoading extends StatelessWidget {
  const ShapeShimmerLoading(
      {super.key, this.width = 50, this.height = 50, this.borderRadius = 5});

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        gradient: const LinearGradient(
            colors: [AppColors.black20, Colors.black12, AppColors.white]),
        child: Container(

          width: width,
          height: height,
          decoration:
              BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(borderRadius)),
        ));
  }
}
