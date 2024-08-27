import 'package:flutter/material.dart';
import 'package:valley_well/presentation/widgets/shape_shimmer_loading.dart';

class TextLoadingShimmerWidget extends StatelessWidget {
  const TextLoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children:List.generate(5, (index) => const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ShapeShimmerLoading(width: double.maxFinite,height: 20,),
    ),),);
  }
}
