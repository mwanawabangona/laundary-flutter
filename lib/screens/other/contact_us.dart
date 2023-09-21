import 'package:dry_cleaners/constants/app_box_decoration.dart';
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/config.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends ConsumerWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            height: 812.h,
            width: 375.w,
            color: AppColors.grayBG,
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  height: 88.h,
                  width: 375.w,
                  child: Column(
                    children: [
                      AppSpacerH(44.h),
                      AppNavbar(
                        title: S.of(context).cntctus,
                        onBack: () {
                          context.nav.pop();
                        },
                      ),
                    ],
                  ),
                ),
                AppSpacerH(23.h),
                Image.asset(
                  'assets/images/contact_us.png',
                  height: 165.h,
                  width: 262.w,
                ),
                AppSpacerH(60.h),
                const Icon(
                  Icons.location_pin,
                  color: AppColors.goldenButton,
                ),
                AppSpacerH(15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Text(
                    AppConfig.ctAboutCompany,
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSpacerH(37.h),
                GestureDetector(
                  onTap: () async {
                    await FlutterLaunch.launchWhatsapp(
                      phone: AppConfig.ctWhatsApp,
                      message: "",
                    );
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/svgs/icon_whats_app.svg'),
                      AppSpacerH(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          '${S.of(context).msgonwhtsap}\n${AppConfig.ctWhatsApp}',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacerH(37.h),
                GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('mailto:${AppConfig.ctMail}'),
                    )) {
                      EasyLoading.showError("Couldn't Mail");
                    }
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: AppColors.goldenButton,
                      ),
                      AppSpacerH(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Text(
                          AppConfig.ctMail,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 375.w,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              decoration: AppBoxDecorations.pageCommonCard,
              child: AppTextButton(
                title: S.of(context).cls,
                onTap: () async {
                  context.nav.pop();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
