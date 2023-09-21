import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
    this.width = double.infinity,
    this.height,
    this.buttonColor,
    required this.title,
    this.onTap,
    this.titleColor,
  });
  final double? width;
  final double? height;
  final Color? buttonColor;
  final String title;
  final Color? titleColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 45.h,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(
            color: AppColors.red,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextDecor.osBold14white
                .copyWith(color: titleColor ?? AppColors.red),
          ),
        ),
      ),
    );
  }
}
