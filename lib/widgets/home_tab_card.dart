import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/models/all_service_model/service.dart';
import 'package:dry_cleaners/providers/guest_providers.dart';
import 'package:dry_cleaners/widgets/global_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeTabCard extends ConsumerWidget {
  const HomeTabCard({
    super.key,
    required this.service,
    this.ontap,
  });
  final Service service;
  final Function()? ontap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(servicesVariationsProvider(service.id!.toString()));
    return ValueListenableBuilder(
      valueListenable: Hive.box(AppHSC.appSettingsBox).listenable(),
      builder: (BuildContext context, Box appSettingsBox, Widget? child) {
        final selectedLocal = appSettingsBox.get(AppHSC.appLocal);
        return GestureDetector(
          onTap: ontap,
          child: Container(
            width: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.h),
                  child: SizedBox(
                    height: 60.h,
                    width: 60.h,
                    child: Image.network(
                      service.imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    getLng(
                      en: service.name,
                      changeLang: service.nameBn.toString(),
                    ),
                    style: AppTextDecor.osSemiBold10black,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
