import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBoxDecorations {
  AppBoxDecorations._();

  static const BoxDecoration topBar = BoxDecoration(
    color: AppColors.white,
    border: Border(bottom: BorderSide(color: AppColors.gray)),
  );
  static BoxDecoration topBarv2 = BoxDecoration(
    color: AppColors.white,
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF000000).withOpacity(0.2),
        offset: const Offset(0, 2),
        blurRadius: 10,
      )
    ],
  );
  static BoxDecoration pageCommonCard = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(5.w),
  );
}
