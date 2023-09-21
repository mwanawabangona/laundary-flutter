import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CutomDatePicker extends ConsumerWidget {
  const CutomDatePicker(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider(name)) ?? DateTime.now();
    return SizedBox(
      height: 78.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextDecor.osRegular14black,
          ),
          AppSpacerH(8.h),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2099),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.gray,
                          onPrimary: AppColors.black,
                          onSurface: AppColors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                AppColors.black, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (date != null) {
                  ref.watch(dateProvider(name).notifier).state = date;
                }
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.grayBG,
                  ),
                ),
                padding: EdgeInsets.all(14.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${date.day}/${date.month}/${date.year}',
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svgs/icon_calender_date_picker.svg',
                      semanticsLabel: 'Top Logo',
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
