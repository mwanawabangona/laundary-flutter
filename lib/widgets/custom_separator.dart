import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSeprator extends StatelessWidget {
  CustomSeprator({super.key, this.color, this.height, this.width});
  Color? color;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.h,
      width: width ?? double.infinity,
      color: color ?? AppColors.gray,
    );
  }
}
