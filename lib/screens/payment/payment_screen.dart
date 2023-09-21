import 'package:dry_cleaners/constants/app_box_decoration.dart';
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/constants/input_field_decorations.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/global_functions.dart';
import 'package:dry_cleaners/providers/address_provider.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/screens/order/payment_method_card.dart';
import 'package:dry_cleaners/screens/payment/payment_controller.dart';
import 'package:dry_cleaners/screens/payment/payment_section.dart';
import 'package:dry_cleaners/screens/payment/schedule_picker_widget.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/button_with_icon.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CheckOutScreen extends ConsumerStatefulWidget {
  const CheckOutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends ConsumerState<CheckOutScreen> {
  final PaymentController pay = PaymentController();
  final TextEditingController _instruction = TextEditingController();
  final Box appSettingsBox = Hive.box(AppHSC.appSettingsBox);
  PaymentType selectedPaymentType = PaymentType.cod;

  @override
  Widget build(BuildContext context) {
    // int? couponID;
    ref.watch(addressIDProvider);
    ref.watch(dateProvider('Pick Up'));
    ref.watch(dateProvider('Delivery'));
    // ref.watch(couponProvider).maybeWhen(
    //       orElse: () {},
    //       loaded: (_) {
    //         couponID = _.data?.coupon?.id;
    //       },
    //     );
    return WillPopScope(
      onWillPop: () {
        ref.watch(dateProvider('Pick Up').notifier).state = null;
        ref.watch(dateProvider('Delivery').notifier).state = null;
        return Future.value(true);
      },
      child: ScreenWrapper(
        padding: EdgeInsets.zero,
        child: Container(
          height: 812.h,
          width: 375.w,
          color: AppColors.grayBG,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: AppColors.white,
                    height: 88.h,
                    width: 375.w,
                    child: Column(
                      children: [
                        AppSpacerH(44.h),
                        AppNavbar(
                          title: S.of(context).shpngndpymnt,
                          onBack: () {
                            context.nav.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        AppSpacerH(10.h),
                        Container(
                          width: 375.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          decoration: AppBoxDecorations.pageCommonCard,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).shpngschdl,
                                style: AppTextDecor.osSemiBold18black,
                              ),
                              // const CutomDatePicker('Collection Date'),
                              AppSpacerH(10.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: ShedulePicker(
                                      image: 'assets/images/pickup-car.png',
                                      title: S.of(context).pickupat,
                                    ),
                                  ),
                                  AppSpacerW(10.w),
                                  Expanded(
                                    child: ShedulePicker(
                                      image: 'assets/images/pick-up-truck.png',
                                      title: S.of(context).dlvryat,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacerH(10.h),
                            ],
                          ),
                        ),
                        AppSpacerH(10.h),
                        Container(
                          width: 375.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          decoration: AppBoxDecorations.pageCommonCard,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 335.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.of(context).adrs,
                                      style: AppTextDecor.osSemiBold18black,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.nav.pushNamed(
                                          Routes.manageAddressScreen,
                                        );
                                      },
                                      // ignore: use_decorated_box
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grayBG,
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            S.of(context).mngaddrs,
                                            style:
                                                AppTextDecor.osSemiBold14navy,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AppSpacerH(11.h),
                              ref.watch(addresListProvider).map(
                                    initial: (_) => const SizedBox(),
                                    loading: (_) => const LoadingWidget(),
                                    loaded: (_) => _
                                            .data.data!.addresses!.isEmpty
                                        ? AppIconTextButton(
                                            icon: Icons.add,
                                            title: S.of(context).adadres,
                                            onTap: () {
                                              context.nav.pushNamed(
                                                Routes.addOrUpdateAddressScreen,
                                              );
                                            },
                                          )
                                        : FormBuilderDropdown(
                                            decoration: AppInputDecor
                                                .loginPageInputDecor
                                                .copyWith(
                                              hintText: S.of(context).chsadrs,
                                            ),
                                            onChanged: (val) {
                                              ref
                                                  .watch(
                                                    addressIDProvider.notifier,
                                                  )
                                                  .state = val.toString();
                                            },
                                            name: 'address',
                                            items: _.data.data!.addresses!
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    value: e.id.toString(),
                                                    child: Text(
                                                      AppGFunctions
                                                          .processAdAddess(
                                                        e,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                    error: (_) =>
                                        ErrorTextWidget(error: _.error),
                                  )
                            ],
                          ),
                        ),
                        AppSpacerH(10.h),
                        Container(
                          width: 375.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          decoration: AppBoxDecorations.pageCommonCard,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).instrctn,
                                style: AppTextDecor.osSemiBold18black,
                              ),
                              AppSpacerH(11.h),
                              TextField(
                                controller: _instruction,
                                decoration:
                                    AppInputDecor.loginPageInputDecor.copyWith(
                                  hintText: S.of(context).adinstrctnop,
                                ),
                                maxLines: 3,
                              )
                            ],
                          ),
                        ),
                        AppSpacerH(10.h),
                        Container(
                          width: 375.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          decoration: AppBoxDecorations.pageCommonCard,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).pymntmthd,
                                style: AppTextDecor.osSemiBold18black,
                              ),
                              AppSpacerH(11.h),
                              PaymentMethodCard(
                                onTap: () {
                                  setState(() {
                                    selectedPaymentType = PaymentType.cod;
                                  });
                                },
                                imageLocation: 'assets/images/logo_cod.png',
                                title: S.of(context).cshondlvry,
                                subtitle: S.of(context).pywhndlvry,
                                isSelected:
                                    selectedPaymentType == PaymentType.cod,
                              ),
                              // AppSpacerH(11.h),
                              // PaymentMethodCard(
                              //   onTap: () {
                              //     setState(() {
                              //       selectedPaymentType =
                              //           PaymentType.onlinePayment;
                              //     });
                              //   },
                              //   imageLocation:
                              //       'assets/images/logo_master_card.png',
                              //   title: S.of(context).mkpymnt,
                              //   subtitle: S.of(context).payonlinewithcard,
                              //   isSelected: selectedPaymentType ==
                              //       PaymentType.onlinePayment,
                              // ),
                            ],
                          ),
                        ),
                        PaymentSection(
                          instruction: _instruction,
                          selectedPaymentType: selectedPaymentType,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PaymentType { cod }
