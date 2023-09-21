import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box appSettingsBox = Hive.box(AppHSC.appSettingsBox);
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.nav.pushNamedAndRemoveUntil(
        appSettingsBox.get(AppHSC.hasSeenSplashScreen) != null
            ? Routes.homeScreen
            : Routes.onBoarding,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo.png',
            height: 100.h,
            width: 195.w,
          ),
        ),
      ),
    );
  }
}
