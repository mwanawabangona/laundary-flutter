import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/models/notifications_model/notification.dart'
    as nt;
import 'package:dry_cleaners/providers/notification_providers.dart';
import 'package:dry_cleaners/screens/notifications/notification_function.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class MyNotificationsTab extends ConsumerWidget {
  MyNotificationsTab({super.key});

  List<nt.Notification> notifications = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(notificationListProvider).maybeWhen(
          loaded: (_) {
            notifications = _.data?.notification ?? [];
          },
          orElse: () {},
        );
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
                  title: S.of(context).ntfctn,
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box(AppHSC.authBox).listenable(),
              builder: (BuildContext context, Box authbox, Widget? child) {
                return (authbox.get('token') != null &&
                        authbox.get('token') != '' &&
                        notifications.isNotEmpty)
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notfication = notifications[index];
                          return Dismissible(
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                NotificationFunctions.deleteNotification(
                                  notificationID: notfication.id.toString(),
                                ).then((value) {
                                  ref.refresh(notificationListProvider);
                                });
                              } else if (direction ==
                                  DismissDirection.startToEnd) {
                                NotificationFunctions.readNotification(
                                  notificationID: notfication.id.toString(),
                                ).then((value) {
                                  ref.refresh(notificationListProvider);
                                });
                              }
                            },
                            key: UniqueKey(),
                            child: Container(
                              padding: EdgeInsets.all(16.h),
                              margin: EdgeInsets.all(10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.2),
                                    offset: const Offset(0, 2),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    notfication.title ?? '',
                                    style: notfication.isRead == 1
                                        ? AppTextDecor.osRegular12navy
                                        : AppTextDecor.osSemiBold14black,
                                  ),
                                  Text(
                                    notfication.message ?? '',
                                    style: notfication.isRead == 1
                                        ? AppTextDecor.osRegular12navy
                                        : AppTextDecor.osSemiBold14black,
                                  ),
                                  // Text(
                                  //   DateFormat.jm('en_US')
                                  //       .format(notfication.createdAt!),
                                  //   style: notfication.isRead == 1
                                  //       ? AppTextDecor.osRegular12navy
                                  //       : AppTextDecor.osSemiBold14black,
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const NoNotificationWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_notification.png',
              height: 118.h,
              width: 118.w,
            ),
            AppSpacerH(60.h),
            Text(
              S.of(context).nontfctn,
              style: AppTextDecor.osSemiBold18black,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
