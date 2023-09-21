import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key, this.title, this.onBack, this.showBack = true});
  final String? title;
  final Function()? onBack;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 390.w,
      child: Stack(
        children: [
          if (showBack)
            Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal).toString() ==
                    "ar"
                ? RotatedBox(
                    quarterTurns: 2, // Rotate by 180 degrees (2 quarter turns)
                    child: AppBackButton(
                      size: 44.h,
                      onTap: onBack,
                    ),
                  )
                : AppBackButton(
                    size: 44.h,
                    onTap: onBack,
                  ),
          Align(
            child: SizedBox(
              height: 44.h,
              width: 260.w,
              child: Center(
                child: Text(
                  title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
