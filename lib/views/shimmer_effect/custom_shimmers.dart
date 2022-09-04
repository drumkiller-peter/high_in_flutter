import 'package:flutter/material.dart';
import 'package:high_in_flutter/configs/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key, this.height, this.width}) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.sliderBgColor,
      highlightColor: AppColors.sliderBgColor.withOpacity(0.1),
      child: Container(
        height: height ?? 20,
        width: width ?? 150,
        decoration: BoxDecoration(
            color: AppColors.sliderBgColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
