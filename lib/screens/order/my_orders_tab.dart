import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/screens/cart/my_cart_tab.dart';
import 'package:dry_cleaners/screens/order/my_orders_tab_signed.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyOrdersTab extends ConsumerWidget {
  const MyOrdersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
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
                  showBack: false,
                  title: S.of(context).myorder,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ValueListenableBuilder(
                valueListenable: Hive.box(AppHSC.authBox).listenable(),
                builder: (BuildContext context, Box authbox, Widget? child) {
                  return authbox.get(AppHSC.authToken) != null
                      ? const MyOrdersSignedIn()
                      : const NotSignedInwidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
