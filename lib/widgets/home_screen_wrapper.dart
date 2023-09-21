import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/global_functions.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/providers/address_provider.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/providers/order_update_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:upgrader/upgrader.dart';

// ignore: must_be_immutable
class HomeScreenWrapper extends ConsumerWidget {
  HomeScreenWrapper({
    super.key,
    this.color = AppColors.grayBG,
    required this.child,
  });
  final Color color;
  final Widget child;
  final Box cartsBox = Hive.box(AppHSC.cartBox);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> bottomItems = [
      {'icon': Icons.shopping_cart_outlined, 'title': S.of(context).mycrt},
      {'icon': Icons.layers_outlined, 'title': S.of(context).myordr},
      {
        'icon': Icons.notifications_none_outlined,
        'title': S.of(context).ntfctn
      },
      {'icon': Icons.person_outlined, 'title': S.of(context).prfl},
    ];

    AppGFunctions.changeStatusBarColor(color: Colors.transparent);
    final activeIndex = ref.watch(homeScreenIndexProvider);
    final pageController = ref.watch(homeScreenPageControllerProvider);
    ref.watch(addresListProvider);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: UpgradeAlert(
        upgrader: Upgrader(
          showIgnore: false,
          showLater: false,
          durationUntilAlertAgain: const Duration(minutes: 10),
        ),
        child: Container(
          height: 812.h,
          width: 375.w,
          padding: EdgeInsets.zero,
          color: color,
          child: child,
        ),
      ),
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
          backgroundColor: AppColors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0.w),
            child: Image.asset('assets/images/app_icon.png'),
          ),
          onPressed: () {
            pageController.animateToPage(
              4,
              duration: transissionDuration,
              curve: Curves.easeInOut,
            );
            ref.watch(homeScreenIndexProvider.notifier).state = 4;
            if (ref.watch(orderIdProvider) != '') {
              cartsBox.clear();
              ref.watch(orderIdProvider.notifier).state = '';
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        safeAreaValues: const SafeAreaValues(bottom: false),
        height: 70.h,
        leftCornerRadius: 35.w,
        rightCornerRadius: 35.w,
        gapLocation: GapLocation.center,
        activeIndex: activeIndex,
        itemCount: bottomItems.length,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: transissionDuration,
            curve: Curves.easeInOut,
          );

          ref.watch(homeScreenIndexProvider.notifier).state = index;
        },
        tabBuilder: (index, active) {
          return BottomNavWidget(
            active: active,
            icon: bottomItems[index]['icon'] as IconData,
            title: bottomItems[index]['title'] as String,
          );
        },
      ),
    );
  }

  // List<Map<String, dynamic>> bottomItems = [
  //   {'icon': Icons.shopping_cart_outlined, 'title': 'My Cart'},
  //   {'icon': Icons.layers_outlined, 'title': 'My Order'},
  //   {'icon': Icons.notifications_none_outlined, 'title': 'Notification'},
  //   {'icon': Icons.person_outlined, 'title': 'Profile'},
  // ];
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.active,
  });
  final String title;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active ? AppColors.goldenButton : AppColors.navyButton,
          ),
          Text(
            title,
            style: AppTextDecor.osSemiBold10black.copyWith(
              color: active ? AppColors.goldenButton : AppColors.navyButton,
            ),
          )
        ],
      ),
    );
  }
}
