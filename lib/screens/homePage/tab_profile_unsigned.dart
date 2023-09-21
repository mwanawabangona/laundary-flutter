import 'package:cached_network_image/cached_network_image.dart';
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/constants/input_field_decorations.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/providers/address_provider.dart';
import 'package:dry_cleaners/providers/auth_provider.dart';
import 'package:dry_cleaners/providers/profile_update_provider.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/buttons/rounder_button.dart';
import 'package:dry_cleaners/widgets/custom_tile.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UsignedUserTab extends ConsumerWidget {
  const UsignedUserTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: ValueListenableBuilder(
        valueListenable: Hive.box(AppHSC.userBox).listenable(),
        builder: (context, Box userBox, Widget? child) {
          return ValueListenableBuilder(
            valueListenable: Hive.box(AppHSC.authBox).listenable(),
            builder: (context, Box authBox, Widget? child) {
              debugPrint(
                'Stripe Key : ${userBox.get(AppHSC.stripeCustomerID)}',
              );
              return Column(
                children: [
                  if (authBox.get('token') != null)
                    Container(
                      height: 230.h,
                      width: 375.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/profile_bg.png',
                          ),
                          colorFilter: ColorFilter.mode(
                            AppColors.gold,
                            BlendMode.multiply,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        height: 230.h,
                        width: 335.w,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 230.h,
                              width: 335.w,
                              child: Column(
                                children: [
                                  AppSpacerH(44.h),
                                  SizedBox(
                                    // height: 165.h,
                                    // width: 166.w,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100.h,
                                          height: 100.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.gray,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                          ),
                                          // padding: const EdgeInsets.all(1),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              50.h,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: userBox
                                                  .get('profile_photo_path')
                                                  .toString(),
                                              height: 100.h,
                                              width: 100.h,
                                              fit: BoxFit.cover,
                                              errorWidget: (
                                                context,
                                                url,
                                                error,
                                              ) =>
                                                  Icon(
                                                Icons.error,
                                                size: 100.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                        AppSpacerH(16.h),
                                        Text(
                                          userBox.get('name')! as String,
                                          style: AppTextDecor.osBold20white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 53.h,
                              right: 5.w,
                              child: GestureDetector(
                                onTap: () {
                                  context.nav
                                      .pushNamed(Routes.editProfileScreen);
                                },
                                child: SizedBox(
                                  height: 20.h,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.edit,
                                        color: AppColors.white,
                                      ),
                                      Text(
                                        S.of(context).edt,
                                        style: AppTextDecor.osRegular14white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 134.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.w),
                          bottomRight: Radius.circular(5.w),
                        ),
                        color: AppColors.goldenButton,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          AppSpacerH(56.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (userBox.get('profile_photo_path') != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7.h),
                                  child: Image.network(
                                    userBox.get('profile_photo_path')!
                                        as String,
                                    height: 60.h,
                                    width: 60.w,
                                  ),
                                )
                              else
                                Icon(
                                  Icons.person,
                                  size: 60.h,
                                ),
                              if (authBox.get('token') == null)
                                AppRountedTextButton(
                                  title: S
                                      .of(context)
                                      .login, // S.of(context).password

                                  width: 140.w,
                                  onTap: () {
                                    context.nav.pushNamed(Routes.loginScreen);
                                  },
                                )
                              else
                                const SizedBox()
                            ],
                          )
                        ],
                      ),
                    ),
                  SizedBox(
                    child: Column(
                      children: [
                        AppSpacerH(30.h),
                        Align(
                          alignment: Hive.box(AppHSC.appSettingsBox)
                                      .get(AppHSC.appLocal)
                                      .toString() ==
                                  "ar"
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: Hive.box(AppHSC.appSettingsBox)
                                          .get(AppHSC.appLocal)
                                          .toString() ==
                                      "ar"
                                  ? 0.h
                                  : 20.h,
                              left: Hive.box(AppHSC.appSettingsBox)
                                          .get(AppHSC.appLocal)
                                          .toString() ==
                                      "ar"
                                  ? 20.h
                                  : 0.h,
                            ),
                            child: SizedBox(
                              width: 140.w,
                              height: 50.h,
                              child: LocaLizationSelector(),
                            ),
                          ),
                        ),
                        if (authBox.get('token') != null)
                          CustomTile(
                            title: S.of(context).mngaddrs,
                            icon: Icons.edit_location_outlined,
                            ontap: () {
                              ref.refresh(addresListProvider);
                              context.nav.pushNamed(Routes.manageAddressScreen);
                            },
                          ),
                        CustomTile(
                          title: S.of(context).privacyPolicy,
                          icon: Icons.lock_outline,
                          ontap: () {
                            context.nav.pushNamed(Routes.privacyPolicyScreen);
                          },
                        ),
                        CustomTile(
                          title: S.of(context).trmsofsrvc,
                          icon: Icons.gavel_outlined,
                          ontap: () {
                            context.nav.pushNamed(Routes.termsOfServiceScreen);
                          },
                        ),
                        CustomTile(
                          title: S.of(context).cntctus,
                          icon: Icons.person_outline,
                          ontap: () {
                            context.nav.pushNamed(Routes.contactUsScreen);
                          },
                        ),
                        CustomTile(
                          title: S.of(context).abtus,
                          icon: Icons.info,
                          hasBorder: authBox.get('token') != null,
                          ontap: () {
                            context.nav.pushNamed(Routes.aboutUsScreen);
                          },
                        ),
                        if (authBox.get('token') != null)
                          CustomTile(
                            title: S.of(context).lgout,
                            icon: Icons.logout,
                            hasBorder: !(authBox.get('token') != null),
                            ontap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      height: 200.h,
                                      width: 335.w,
                                      padding: EdgeInsets.all(20.h),
                                      child: Consumer(
                                        builder: (context, ref, child) {
                                          return ref.watch(logOutProvider).map(
                                                initial: (_) => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      S.of(context).urabttolgot,
                                                      style: AppTextDecor
                                                          .osSemiBold18black,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    AppSpacerH(10.h),
                                                    Text(
                                                      S.of(context).arusre,
                                                      style: AppTextDecor
                                                          .osRegular14black,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    AppSpacerH(10.h),
                                                    SizedBox(
                                                      height: 50.h,
                                                      width: 335.w,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                AppTextButton(
                                                              title: S
                                                                  .of(context)
                                                                  .no,
                                                              buttonColor:
                                                                  AppColors
                                                                      .gray,
                                                              titleColor:
                                                                  AppColors
                                                                      .black,
                                                              onTap: () {
                                                                context.nav
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          AppSpacerW(10.w),
                                                          Expanded(
                                                            child:
                                                                AppTextButton(
                                                              title: S
                                                                  .of(context)
                                                                  .y,
                                                              onTap: () {
                                                                ref
                                                                    .watch(
                                                                      logOutProvider
                                                                          .notifier,
                                                                    )
                                                                    .logout();
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                loading: (value) =>
                                                    const LoadingWidget(),
                                                error: (_) {
                                                  Future.delayed(buildDuration)
                                                      .then((value) {
                                                    ref.refresh(logOutProvider);
                                                  });
                                                  return ErrorTextWidget(
                                                    error: _.error,
                                                  );
                                                },
                                                loaded: (value) {
                                                  Future.delayed(buildDuration)
                                                      .then((value) {
                                                    context.nav.pop();
                                                    userBox.clear();
                                                    authBox.clear();
                                                    ref.refresh(
                                                      profileInfoProvider,
                                                    );
                                                    ref.refresh(logOutProvider);
                                                    context.nav.pushNamed(
                                                      Routes.loginScreen,
                                                    );
                                                  });
                                                  return MessageTextWidget(
                                                    msg: S.of(context).lgdot,
                                                  );
                                                },
                                              );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class LocaLizationSelector extends StatelessWidget {
  LocaLizationSelector({super.key});
  final List<AppLanguage> languages = [
    AppLanguage(name: '\ud83c\uddfa\ud83c\uddf8 ENG', value: 'en'),
    AppLanguage(name: '🇪🇬 مصر', value: 'ar'),
    AppLanguage(name: '🇹🇷 Tür', value: 'tr'),
    AppLanguage(name: '🇮🇳 हिंदी', value: 'in'),
    AppLanguage(name: '🇧🇩 বাংলা', value: 'bn'),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      decoration: AppInputDecor.loginPageInputDecor.copyWith(
        fillColor: Colors.transparent,
      ),
      initialValue:
          Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal) as String?,
      iconEnabledColor: AppColors.black,
      dropdownColor: AppColors.white,
      name: 'language',
      items: languages
          .map(
            (e) => DropdownMenuItem(
              value: e.value,
              child: Text(
                e.name,
                style: AppTextDecor.osBold14black,
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null && value != '') {
          Hive.box(AppHSC.appSettingsBox).put(AppHSC.appLocal, value);
        }
      },
    );
  }
}

class AppLanguage {
  String name;
  String value;
  AppLanguage({
    required this.name,
    required this.value,
  });
}
