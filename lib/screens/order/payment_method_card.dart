import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends ConsumerWidget {
  const PaymentMethodCard({
    super.key,
    required this.imageLocation,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    this.onTap,
  });
  final String imageLocation;
  final String title;
  final String subtitle;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.h),
          border: Border.all(
            color: isSelected ? AppColors.goldenButton : AppColors.white,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageLocation,
              height: 40.h,
              width: 40.w,
            ),
            AppSpacerW(15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextDecor.osBold14black,
                  ),
                  Text(
                    subtitle,
                    style: AppTextDecor.osRegular12navy,
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.goldenButton,
                size: 15.h,
              )
          ],
        ),
      ),
    );
  }
}
