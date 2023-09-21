import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomJourneyDot extends StatelessWidget {
  const CustomJourneyDot({
    super.key,
    required this.activeIndex,
    required this.count,
  });
  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: AnimatedContainer(
              duration: transissionDuration,
              height: 6.h,
              width: activeIndex == index ? 36.w : 6.w,
              decoration: BoxDecoration(
                color: AppColors.goldenButton,
                borderRadius: BorderRadius.circular(3.h),
              ),
            ),
          );
        },
      ),
    );
  }
}
