import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFlatTextButton extends StatelessWidget {
  const AppFlatTextButton({
    super.key,
    this.buttonColor = AppColors.grayBG,
    this.txtColor = AppColors.black,
    required this.title,
    this.onTap,
  });
  final Color buttonColor;
  final Color txtColor;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(color: buttonColor),
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: AppTextDecor.osBold14black.copyWith(color: txtColor),
          ),
        ),
      ),
    );
  }
}
