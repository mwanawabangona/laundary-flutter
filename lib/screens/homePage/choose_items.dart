import 'package:dry_cleaners/constants/app_box_decoration.dart';
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/global_functions.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/models/all_service_model/service.dart';
import 'package:dry_cleaners/models/hive_cart_item_model.dart';
import 'package:dry_cleaners/models/products_model/product.dart';
import 'package:dry_cleaners/models/variations_model/variant.dart';
import 'package:dry_cleaners/notfiers/guest_notfiers.dart';
import 'package:dry_cleaners/providers/address_provider.dart';
import 'package:dry_cleaners/providers/guest_providers.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/providers/order_update_provider.dart';
import 'package:dry_cleaners/providers/settings_provider.dart';
import 'package:dry_cleaners/screens/homePage/subProductBottomSheet/sub_product_bottom_sheet.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/cart_item_inc_dec_button.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/global_functions.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class ChooseItems extends ConsumerWidget {
  const ChooseItems({
    super.key,
    required this.service,
  });
  final Service service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalIndex = ref.watch(itemSelectMenuIndexProvider);
    ref.watch(servicesVariationsProvider(service.id.toString()));
    final ProducServiceVariavtionDataModel productFilter =
        ref.watch(productsFilterProvider);
    if (productFilter.servieID == '') {
      Future.delayed(buildDuration).then((value) {
        ref.watch(productsFilterProvider.notifier).update((state) {
          return state.copyWith(servieID: service.id!.toString());
        });
      });
    }

    if (productFilter.variationID == '') {
      ref
          .watch(
            servicesVariationsProvider(service.id.toString()),
          )
          .maybeWhen(
            orElse: () {},
            loaded: (_) {
              Future.delayed(buildDuration).then((value) {
                ref.watch(productsFilterProvider.notifier).update((state) {
                  final List<Variant> variations = _.data!.variants!;
                  variations.sort(
                    (a, b) => a.id!.compareTo(b.id!),
                  );
                  return state.copyWith(
                    variationID: variations.first.id!.toString(),
                  );
                });
              });
            },
          );
    }

    ref.watch(productsProvider);
    final Box appSettingsBox = Hive.box(AppHSC.appSettingsBox);
    int? minimum;
    double? dlvrychrg;
    double? free;
    final selectedLocal = appSettingsBox.get(AppHSC.appLocal);
    ref.watch(settingsProvider).whenOrNull(
      loaded: (data) {
        minimum = data.data!.minimumCost;
        dlvrychrg = data.data!.deliveryCost!.toDouble();
        free = data.data!.feeCost!.toDouble();
      },
    );
    return WillPopScope(
      onWillPop: () {
        ref.watch(productsFilterProvider.notifier).state =
            ProducServiceVariavtionDataModel(servieID: '', variationID: '');
        return Future.value(true);
      },
      child: ScreenWrapper(
        color: AppColors.grayBG,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            SizedBox(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  Container(
                    height: 100.h,
                    width: 375.w,
                    decoration: AppBoxDecorations.topBar,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        AppSpacerH(44.h),
                        AppNavbar(
                          title:
                              // Hive.box(AppHSC.appSettingsBox)
                              //             .get(AppHSC.appLocal)
                              //             .toString() ==
                              //         "en"
                              //     ?

                              getLng(
                            en: service.name,
                            changeLang: service.nameBn.toString(),
                          )
                          // : service.nameBn.toString()

                          ,
                          onBack: () {
                            context.nav.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 375.w,
                    height: 45.h,
                    child: Consumer(
                      builder: (context, refA, child) {
                        return refA
                            .watch(
                              servicesVariationsProvider(service.id.toString()),
                            )
                            .map(
                              initial: (_) => const SizedBox(),
                              loading: (_) => const LoadingWidget(),
                              loaded: (_) {
                                final List<Variant> variations =
                                    _.data.data!.variants!;
                                variations.sort(
                                  (a, b) => a.id!.compareTo(b.id!),
                                );
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: variations.length,
                                  itemBuilder: (context, index) {
                                    // if (productFilter.variationID == '') {
                                    //   ref
                                    //       .watch(productsFilterProvider.notifier)
                                    //       .update((state) {
                                    //     final ProducServiceVariavtionDataModel
                                    //         data = state;
                                    //     data.variationID = _
                                    //         .data.data!.variants!.first.id!
                                    //         .toString();
                                    //     return data;
                                    //   });
                                    // }
                                    final Variant vdata = variations[index];
                                    return GestureDetector(
                                      onTap: () {
                                        ref
                                            .watch(
                                          productsFilterProvider.notifier,
                                        )
                                            .update((state) {
                                          final ProducServiceVariavtionDataModel
                                              data = state;
                                          data.variationID =
                                              vdata.id!.toString();
                                          return data;
                                        });
                                        ref.refresh(productsProvider);

                                        ref
                                            .watch(
                                              itemSelectMenuIndexProvider
                                                  .notifier,
                                            )
                                            .state = index;
                                      },
                                      child: Container(
                                        height: 45.h,
                                        color: finalIndex == index
                                            ? AppColors.goldenButton
                                            : AppColors.white,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                        ),
                                        child: Center(
                                          child: Text(
                                            // Hive.box(
                                            //           AppHSC.appSettingsBox,
                                            //         )
                                            //             .get(
                                            //               AppHSC.appLocal,
                                            //             )
                                            //             .toString() ==
                                            //         "en"
                                            //     ?

                                            getLng(
                                              en: vdata.name,
                                              changeLang:
                                                  vdata.nameBn.toString(),
                                            )
                                            // : vdata.nameBn!.toString()

                                            ,
                                            style: finalIndex == index
                                                ? AppTextDecor.osBold14white
                                                : AppTextDecor.osRegular14black,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              error: (_) => ErrorTextWidget(error: _.error),
                            );
                      },
                    ),
                  ),
                  Container(
                    height: 563.h,
                    width: 375.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return ref
                            .watch(
                              productsProvider,
                            )
                            .map(
                              initial: (_) => const SizedBox(),
                              loading: (_) => const LoadingWidget(),
                              loaded: (_) => ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: _.data.data!.products!.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == _.data.data!.products!.length) {
                                    return AppSpacerH(10.h);
                                  } else {
                                    final Product product =
                                        _.data.data!.products![index];
                                    return ChooseItemCard(
                                      product: product,
                                    );
                                  }
                                },
                              ),
                              error: (_) => ErrorTextWidget(error: _.error),
                            );
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Builder(
                builder: (context) {
                  return ValueListenableBuilder(
                    valueListenable: Hive.box(AppHSC.cartBox).listenable(),
                    builder: (
                      BuildContext context,
                      Box cartBox,
                      Widget? child,
                    ) {
                      final List<CarItemHiveModel> cartItems = [];
                      for (var i = 0; i < cartBox.length; i++) {
                        final Map<String, dynamic> processedData = {};
                        final Map<dynamic, dynamic> unprocessedData =
                            cartBox.getAt(i) as Map<dynamic, dynamic>;

                        unprocessedData.forEach((key, value) {
                          processedData[key.toString()] = value;
                        });

                        cartItems.add(
                          CarItemHiveModel.fromMap(
                            processedData,
                          ),
                        );
                      }

                      return Container(
                        height: 104.h,
                        width: 375.w,
                        color: AppColors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).ttl,
                                  style: AppTextDecor.osSemiBold18black,
                                ),
                                Text(
                                  '${appSettingsBox.get('currency') ?? '\$'}${calculateTotal(cartItems)}',
                                  style: AppTextDecor.osSemiBold18black,
                                ),
                                if (AppGFunctions.calculateTotal(
                                      cartItems,
                                    ).toInt() <
                                    free!) ...[
                                  Text(
                                    'Delivery Charge is ${appSettingsBox.get('currency') ?? '\$'}$dlvrychrg',
                                    style: AppTextDecor.osRegular12black,
                                  ),
                                ] else ...[
                                  Text(
                                    'Delivery Charge is ${appSettingsBox.get('currency') ?? '\$'}0',
                                    style: AppTextDecor.osRegular12black,
                                  ),
                                ],
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (calculateTotal(cartItems) < minimum!)
                                  Text(
                                    '${S.of(context).mnmmordramnt} ${appSettingsBox.get('currency') ?? '\$'}$minimum',
                                    style: AppTextDecor.osRegular12red,
                                  ),
                                AppSpacerH(5.h),
                                if (ref.read(orderIdProvider) != '')
                                  AppTextButton(
                                    height: 45.h,
                                    width: 164.w,
                                    title: 'Done',
                                    onTap: () {
                                      context.nav.pop();
                                      ref
                                          .watch(
                                            homeScreenIndexProvider.notifier,
                                          )
                                          .state = 0;
                                      ref
                                          .watch(
                                            homeScreenPageControllerProvider,
                                          )
                                          .animateToPage(
                                            0,
                                            duration: transissionDuration,
                                            curve: Curves.easeInOut,
                                          );
                                    },
                                  )
                                else
                                  AppTextButton(
                                    title: S.of(context).ordrnow,
                                    height: 45.h,
                                    width: 164.w,
                                    onTap: () {
                                      final Box authBox = Hive.box(
                                        AppHSC.authBox,
                                      ); //Stores Auth Data

                                      if (authBox.get(AppHSC.authToken) !=
                                              null &&
                                          authBox.get(AppHSC.authToken) != '') {
                                        if (calculateTotal(cartItems) >=
                                            minimum!) {
                                          ref.refresh(
                                            addresListProvider,
                                          );
                                          context.nav.pushNamed(
                                            Routes.checkOutScreen,
                                          );
                                        } else {
                                          EasyLoading.showError(
                                            '${S.of(context).mnmmordramnt} ${appSettingsBox.get('currency') ?? '\$'}$minimum',
                                          );
                                        }
                                      } else {
                                        context.nav
                                            .pushNamed(Routes.loginScreen);
                                      }
                                    },
                                  ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

double calculateTotal(List<CarItemHiveModel> cartItems) {
  double amount = 0;
  for (final element in cartItems) {
    if (element.subProduct != null) {
      amount += element.productsQTY *
          (element.unitPrice + element.subProduct!.price!);
    } else {
      amount += element.productsQTY * element.unitPrice;
    }
  }

  return amount;
}

class ChooseItemCard extends StatefulWidget {
  const ChooseItemCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ChooseItemCard> createState() => _ChooseItemCardState();
}

class _ChooseItemCardState extends State<ChooseItemCard> {
  bool inCart = false;
  final List<CarItemHiveModel> cartItems = [];

  int? keyAt;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("sub ${widget.product.name}");
    int selectedIndex = 0;
    return ValueListenableBuilder(
      valueListenable: Hive.box(AppHSC.appSettingsBox).listenable(),
      builder: (
        BuildContext context,
        Box settingsBox,
        Widget? child,
      ) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(AppHSC.cartBox).listenable(),
          builder: (
            BuildContext context,
            Box cartsBox,
            Widget? child,
          ) {
            final List<CarItemHiveModel> cartItems = [];
            inCart = false;

            for (int i = 0; i < cartsBox.length; i++) {
              debugPrint(cartsBox.getAt(i).toString());
              final Map<String, dynamic> processedData = {};
              final Map<dynamic, dynamic> unprocessedData =
                  cartsBox.getAt(i) as Map<dynamic, dynamic>;

              unprocessedData.forEach((key, value) {
                processedData[key.toString()] = value;
              });
              final data = CarItemHiveModel.fromMap(processedData);
              keyAt = i;
              if (data.productsId == widget.product.id &&
                  data.productsName == widget.product.name) {
                inCart = true;
                break;
              }
            }
            final selectedLocal = settingsBox.get(AppHSC.appLocal);

            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Container(
                // height: 100.h,
                width: 335.w,
                padding: EdgeInsets.all(10.h),
                decoration: const BoxDecoration(color: AppColors.white),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80.h,
                      width: 83.w,
                      child: FittedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: Image.network(
                            widget.product.imagePath!,
                            height: 80.h,
                            width: 83.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    AppSpacerW(20.w),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            // height: 41.h,
                            width: 232.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        // (selectedLocal == null ||
                                        //         selectedLocal == '' ||
                                        //         selectedLocal == 'en')
                                        //     ?

                                        getLng(
                                          en: widget.product.name,
                                          changeLang:
                                              widget.product.nameBn.toString(),
                                        )
                                        // : widget.product.nameBn!.toString()

                                        ,
                                        style: AppTextDecor.osBold14black,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (widget.product.discountPercentage !=
                                            null &&
                                        widget.product.discountPercentage!
                                                as int <
                                            0)
                                      Text(
                                        '${widget.product.discountPercentage}%',
                                        style: AppTextDecor.osBold14red,
                                      ),
                                  ],
                                ),
                                Text(
                                  widget.product.description ?? '',
                                  style: AppTextDecor.osRegular12black,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget.product.oldPrice != null)
                                      Text(
                                        '${settingsBox.get('currency') ?? '\$'}${widget.product.oldPrice}/${S.of(context).item}',
                                        style: AppTextDecor.osRegular12red
                                            .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    Text(
                                      '${settingsBox.get('currency') ?? '\$'}${widget.product.currentPrice}/${S.of(context).item}',
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.product.sbproducts!.isNotEmpty) ...[
                                if (!inCart) ...[
                                  AppTextButton(
                                    title: S.of(context).showmore,
                                    width: 120.w,
                                    height: 36.h,
                                    onTap: () {
                                      showBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return SubPrductBottomSheet(
                                            product: widget.product,
                                          );
                                        },
                                      );
                                    },
                                  )
                                ] else ...[
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Hive.box(AppHSC.cartBox).listenable(),
                                    builder:
                                        (context, Box cartbox, Widget? child) {
                                      if (inCart) {
                                        final Map<String, dynamic>
                                            processedData = {};
                                        final Map<dynamic, dynamic>
                                            unprocessedData =
                                            cartbox.getAt(keyAt!)
                                                as Map<dynamic, dynamic>;

                                        unprocessedData.forEach((key, value) {
                                          processedData[key.toString()] = value;
                                        });

                                        final CarItemHiveModel data =
                                            CarItemHiveModel.fromMap(
                                          processedData,
                                        );
                                        return IncDecButtonWithValueV2(
                                          height: 36.h,
                                          width: 120.w,
                                          value: data.productsQTY,
                                          onDec: () {
                                            if (data.productsQTY <= 1) {
                                              cartbox.deleteAt(keyAt!);
                                              keyAt = null;
                                              inCart = false;
                                            } else {
                                              cartbox.putAt(
                                                keyAt!,
                                                data
                                                    .copyWith(
                                                      productsQTY:
                                                          data.productsQTY - 1,
                                                    )
                                                    .toMap(),
                                              );
                                            }
                                          },
                                          onInc: () {
                                            cartbox.putAt(
                                              keyAt!,
                                              data
                                                  .copyWith(
                                                    productsQTY:
                                                        data.productsQTY + 1,
                                                  )
                                                  .toMap(),
                                            );
                                          },
                                        );
                                      } else {
                                        return AppTextButton(
                                          title: S.of(context).additm,
                                          width: 120.w,
                                          height: 36.h,
                                          onTap: () {
                                            if (!inCart) {
                                              final newcartItrm =
                                                  CarItemHiveModel(
                                                productsId: widget.product.id!,
                                                productsName:
                                                    widget.product.name!,
                                                productsImage:
                                                    widget.product.imagePath!,
                                                productsQTY: 1,
                                                unitPrice: widget
                                                    .product.currentPrice!,
                                                serviceName: widget
                                                    .product.service!.name!,
                                              );
                                              cartbox.add(newcartItrm.toMap());
                                            }
                                          },
                                        );
                                      }
                                    },
                                  )
                                ]
                              ] else ...[
                                ValueListenableBuilder(
                                  valueListenable:
                                      Hive.box(AppHSC.cartBox).listenable(),
                                  builder:
                                      (context, Box cartbox, Widget? child) {
                                    if (inCart) {
                                      final Map<String, dynamic> processedData =
                                          {};
                                      final Map<dynamic, dynamic>
                                          unprocessedData =
                                          cartbox.getAt(keyAt!)
                                              as Map<dynamic, dynamic>;

                                      unprocessedData.forEach((key, value) {
                                        processedData[key.toString()] = value;
                                      });

                                      final CarItemHiveModel data =
                                          CarItemHiveModel.fromMap(
                                        processedData,
                                      );
                                      return IncDecButtonWithValueV2(
                                        height: 36.h,
                                        width: 120.w,
                                        value: data.productsQTY,
                                        onDec: () {
                                          if (data.productsQTY <= 1) {
                                            cartbox.deleteAt(keyAt!);
                                            keyAt = null;
                                            inCart = false;
                                          } else {
                                            cartbox.putAt(
                                              keyAt!,
                                              data
                                                  .copyWith(
                                                    productsQTY:
                                                        data.productsQTY - 1,
                                                  )
                                                  .toMap(),
                                            );
                                          }
                                        },
                                        onInc: () {
                                          cartbox.putAt(
                                            keyAt!,
                                            data
                                                .copyWith(
                                                  productsQTY:
                                                      data.productsQTY + 1,
                                                )
                                                .toMap(),
                                          );
                                        },
                                      );
                                    } else {
                                      return AppTextButton(
                                        title: S.of(context).additm,
                                        width: 120.w,
                                        height: 36.h,
                                        onTap: () {
                                          if (!inCart) {
                                            final newcartItrm =
                                                CarItemHiveModel(
                                              productsId: widget.product.id!,
                                              productsName:
                                                  widget.product.name!,
                                              productsImage:
                                                  widget.product.imagePath!,
                                              productsQTY: 1,
                                              unitPrice:
                                                  widget.product.currentPrice!,
                                              serviceName:
                                                  widget.product.service!.name!,
                                            );
                                            cartbox.add(newcartItrm.toMap());
                                          }
                                        },
                                      );
                                    }
                                  },
                                )
                              ]
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class IncDecButton extends StatelessWidget {
  const IncDecButton({
    super.key,
    required this.ontap,
    required this.icon,
  });
  final Function() ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          color: AppColors.lightpurple,
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}
