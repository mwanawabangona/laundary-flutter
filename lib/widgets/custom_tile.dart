import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    this.ontap,
    this.hasBorder = true,
  });
  final IconData icon;
  final String title;
  final Function()? ontap;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 335.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: hasBorder ? AppColors.gray : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.black,
              size: 20.h,
            ),
            AppSpacerW(15.w),
            Expanded(
              child: Text(
                title,
                style: AppTextDecor.osRegular14black,
              ),
            ),
            Icon(
              Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal).toString() ==
                      "ar"
                  ? Icons.keyboard_arrow_left
                  : Icons.keyboard_arrow_right,
              size: 24.w,
              color: AppColors.gray,
            ),
            AppSpacerW(5.w)
          ],
        ),
      ),
    );
  }
}
