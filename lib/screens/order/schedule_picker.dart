import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_string_const.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/schedule_model.dart';
import 'package:dry_cleaners/models/schedules_model/schedule.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/providers/order_providers.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulerPicker extends ConsumerStatefulWidget {
  const SchedulerPicker({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SchedulerPickerState();
}

class _SchedulerPickerState extends ConsumerState<SchedulerPicker> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final dateSelect = ref.watch(dateProvider(AppStrConst.pickup));

    if (dateSelect == null) {
      if (DateTime.now().weekday == DateTime.sunday) {
        Future.delayed(buildDuration).then((value) {
          ref.watch(dateProvider(AppStrConst.pickup).notifier).state =
              DateTime.now().add(const Duration(days: 1));
        });
      } else {
        Future.delayed(buildDuration).then((value) {
          ref.watch(dateProvider(AppStrConst.pickup).notifier).state =
              DateTime.now();
        });
      }
    }
    ref.watch(pickUpScheduleProvider);
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      child: Container(
        height: 812.h,
        width: 375.w,
        color: AppColors.grayBG,
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              width: 375.w,
              child: Column(
                children: [
                  AppSpacerH(44.h),
                  AppNavbar(
                    title:
                        '${AppStrConst.pickup == "Pick Up" ? S.of(context).pckup : ""} ${S.of(context).schdl}',
                    onBack: () {
                      context.nav.pop();
                    },
                  ),
                  TableCalendar(
                    rowHeight: 70.h,
                    currentDay: DateTime.now(),
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: dateSelect ?? DateTime.now(),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      if (!selectDay.isBefore(DateTime.now()) ||
                          isSameDay(
                                selectDay,
                                DateTime.now(),
                              ) &&
                              selectDay.weekday != DateTime.sunday) {
                        ref
                            .watch(dateProvider(AppStrConst.pickup).notifier)
                            .state = selectDay;
                      } else if (selectDay.weekday == DateTime.sunday) {
                        EasyLoading.showError(S.of(context).noslctavlbl);
                      }
                      debugPrint("this is the date $selectDay");
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(dateSelect, date);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ref.watch(pickUpScheduleProvider).map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const LoadingWidget(),
                    loaded: (_) {
                      final List<Schedule> schedules = _.data.data!.schedules!;

                      return ValueListenableBuilder(
                        valueListenable:
                            Hive.box(AppHSC.appSettingsBox).listenable(),
                        builder: (
                          BuildContext context,
                          Box settingsBox,
                          Widget? child,
                        ) {
                          final selectedLocal =
                              settingsBox.get(AppHSC.appLocal);
                          return GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 2.9,
                            children: [
                              ...schedules.map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    ref
                                        .watch(
                                          scheduleProvider(AppStrConst.pickup)
                                              .notifier,
                                        )
                                        .state = ScheduleModel(
                                      schedule: e,
                                      dateTime: dateSelect!,
                                    );

                                    ref
                                        .watch(
                                          dateProvider('Delivery').notifier,
                                        )
                                        .state = null;
                                    ref
                                        .watch(
                                          scheduleProvider('Delivery').notifier,
                                        )
                                        .state = null;

                                    context.nav.pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      padding: EdgeInsets.all(5.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.h),
                                      ),
                                      child: Center(
                                        child: Text(
                                          (selectedLocal == null ||
                                                  selectedLocal == '' ||
                                                  selectedLocal == 'en')
                                              ? e.title ?? ""
                                              : "${e.title!.split("-").last}- ${e.title!.split("-").first}",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    error: (_) => ErrorTextWidget(error: _.error),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
