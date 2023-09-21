import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/input_field_decorations.dart';
import 'package:dry_cleaners/providers/order_providers.dart';
import 'package:dry_cleaners/services/api_service.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/widgets/buttons/flat_text_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppOrderDialouges {
  AppOrderDialouges._();
  static Future<void> orderCancelDialouge(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              color: AppColors.white,
              height: 265.h,
              width: 335.w,
              child: Column(
                children: [
                  AppSpacerH(30.h),
                  Image.asset(
                    'assets/images/icon_order_cancel.png',
                    height: 70.h,
                    width: 70.w,
                  ),
                  AppSpacerH(17.h),
                  Text(
                    'Are you sure\nwant to Cancel this order?',
                    style: AppTextDecor.osSemiBold20black,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacerH(43.h),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: AppFlatTextButton(
                            title: 'Cancel',
                            onTap: () {
                              context.nav.pop();
                            },
                          ),
                        ),
                        Expanded(
                          child: AppFlatTextButton(
                            title: 'Confirm',
                            buttonColor: AppColors.red,
                            txtColor: AppColors.white,
                            onTap: () {
                              context.nav.pop();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> orderFeedBackDialouge({
    required BuildContext context,
    required String orderID,
    required WidgetRef ref,
  }) async {
    double ratings = 3;
    final dio = getDio();
    final TextEditingController textEditingController = TextEditingController();
    bool isLoading = false;
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    color: AppColors.white,
                    width: 335.w,
                    height: 550.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppSpacerH(30.h),
                          SvgPicture.asset(
                            'assets/svgs/icon_feed_back.svg',
                            height: 180.h,
                            width: 163.w,
                          ),
                          AppSpacerH(30.h),
                          Text(
                            'How was Ironing Service?',
                            style: AppTextDecor.osSemiBold20black,
                            textAlign: TextAlign.center,
                          ),
                          AppSpacerH(15.h),
                          Text(
                            'Your feedback will help us to improve the Iron Service Experience.',
                            style: AppTextDecor.osRegular14black,
                            textAlign: TextAlign.center,
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            allowHalfRating: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.gold,
                            ),
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            onRatingUpdate: (rating) {
                              ratings = rating;
                            },
                          ),
                          AppSpacerH(15.h),
                          TextField(
                            maxLines: 3,
                            decoration: AppInputDecor.loginPageInputDecor,
                            controller: textEditingController,
                          ),
                          AppSpacerH(15.h),
                          Row(
                            children: [
                              Expanded(
                                child: AppFlatTextButton(
                                  title: 'Cancel',
                                  onTap: () {
                                    context.nav.pop();
                                  },
                                ),
                              ),
                              Expanded(
                                child: isLoading
                                    ? const LoadingWidget()
                                    : AppFlatTextButton(
                                        title: 'Confirm',
                                        buttonColor: AppColors.gold,
                                        txtColor: AppColors.white,
                                        onTap: () {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          dio.post(
                                            '/ratings',
                                            data: {
                                              'order_id': orderID,
                                              'content':
                                                  textEditingController.text,
                                              'rating': ratings.toString()
                                            },
                                          ).then((value) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            ref.refresh(
                                              orderDetailsProvider(orderID),
                                            );
                                            context.nav.pop();
                                          });
                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                      ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
