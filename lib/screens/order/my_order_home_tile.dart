import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/models/all_orders_model/order.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/dashed_line.dart';
import 'package:dry_cleaners/widgets/global_functions.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeOrderTile extends StatelessWidget {
  HomeOrderTile({
    super.key,
    required this.data,
  });

  final Order data;
  final Box settingsBox = Hive.box(AppHSC.appSettingsBox);

  @override
  Widget build(BuildContext context) {
    final gotDate = DateTime.parse(data.orderedAt!.split(" ").first);
    return GestureDetector(
      onTap: () {
        context.nav
            .pushNamed(Routes.orderDetails, arguments: data.id!.toString());
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Container(
          // height: 219.h,
          width: 335.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        border: Border.all(color: AppColors.gray),
                      ),
                      height: 46.h,
                      width: 46.h,
                      child: Stack(
                        children: [
                          Center(
                            child: (data.products?.first.service?.imagePath !=
                                    null)
                                ? Image.network(
                                    data.products!.first.service!.imagePath!,
                                    height: 46.h,
                                    width: 46.h,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/3.png",
                                    height: 46.h,
                                    width: 46.h,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          // const Center(
                          //   child: CircularProgressIndicator(
                          //     color: AppColors.gold,
                          //     value: 0.25, //TODO: Change With Order Status
                          //     backgroundColor: AppColors.grayBG,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  const AppSpacerW(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${S.of(context).ordrid} #${data.orderCode}",
                          style: AppTextDecor.osSemiBold12black,
                        ),
                        AppSpacerH(8.h),
                        Text(
                          "${DateFormat("EEEE,dd MMM, yyyy").format(gotDate)}\n${data.orderedAt!.split(" ")[1]} ${data.orderedAt!.split(" ")[2]}",
                          style: AppTextDecor.osSemiBold12black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: getOrderStatusColor(),
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: Text(
                      getLng(
                        en: data.orderStatus,
                        changeLang: data.orderStatusbn,
                      ),
                      style: AppTextDecor.osBold14white,
                    ),
                  )
                ],
              ),
              AppSpacerH(10.h),
              const MySeparator(),
              AppSpacerH(10.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/pickup-car.png",
                        height: 24.h,
                        width: 24.h,
                        fit: BoxFit.cover,
                      ),
                      AppSpacerW(8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.pickDate}',
                            style: AppTextDecor.osRegular12black,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 11.h,
                              ),
                              Text(
                                '${data.pickHour}',
                                style: AppTextDecor.osRegular12black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/pick-up-truck.png",
                        height: 24.h,
                        width: 24.h,
                        fit: BoxFit.cover,
                      ),
                      AppSpacerW(8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.deliveryDate}',
                            style: AppTextDecor.osRegular12black,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 11.h,
                              ),
                              Text(
                                '${data.deliveryHour}',
                                style: AppTextDecor.osRegular12black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getOrderStatusColor() {
    if (data.orderStatus!.toLowerCase() == 'pending') {
      return AppColors.gray;
    } else if (data.orderStatus!.replaceAll(' ', '').toLowerCase() ==
        'pickedYourOrder'.toLowerCase()) {
      return const Color(0xFF3AD0FF);
    } else {
      return AppColors.gold;
    }
  }
}
