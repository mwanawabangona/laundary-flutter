import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRightIconTextButton extends StatelessWidget {
  const AppRightIconTextButton({
    super.key,
    this.width = double.infinity,
    this.height,
    this.buttonColor,
    required this.title,
    this.onTap,
    this.titleColor,
    required this.icon,
  });
  final double? width;
  final double? height;
  final Color? buttonColor;
  final String title;
  final IconData icon;
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
          color: buttonColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(color: AppColors.grayBG),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextDecor.osBold14white
                  .copyWith(color: titleColor ?? AppColors.black),
            ),
            AppSpacerW(6.w),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
