import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/config.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpComplete extends StatelessWidget {
  const SignUpComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayBG,
      body: Container(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 88.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sign_up_success.png',
              width: 310.w,
              height: 265.h,
            ),
            AppSpacerH(30.h),
            Text(
              S.of(context).cngrts,
              style: AppTextDecor.osBold24black,
            ),
            AppSpacerH(10.h),
            Text(
              '${S.of(context).uhvscsflysgndupon} ${AppConfig.appName} service',
              style: AppTextDecor.osRegular18black,
              textAlign: TextAlign.center,
            ),
            AppSpacerH(111.h),
            AppTextButton(
              title: S.of(context).grt,
              onTap: () {
                context.nav.pushNamedAndRemoveUntil(
                  Routes.homeScreen,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
