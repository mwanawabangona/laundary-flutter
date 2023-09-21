import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRountedTextButton extends StatelessWidget {
  const AppRountedTextButton({
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
        height: height ?? 50.h,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.goldenButton,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: AppColors.white),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextDecor.osBold14white
                .copyWith(color: titleColor ?? AppColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
