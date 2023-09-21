// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/models/hive_cart_item_model.dart';
import 'package:dry_cleaners/models/products_model/product.dart';
import 'package:dry_cleaners/models/products_model/sub_product.dart';
import 'package:dry_cleaners/screens/homePage/choose_items.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/widgets/buttons/cart_item_inc_dec_button.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubPrductBottomSheet extends StatefulWidget {
  const SubPrductBottomSheet({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<SubPrductBottomSheet> createState() => _SubPrductBottomSheetState();
}

class _SubPrductBottomSheetState extends State<SubPrductBottomSheet> {
  final settingsBox = Hive.box(AppHSC.appSettingsBox);
  final cartsBox = Hive.box(AppHSC.cartBox);
  bool inCart = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(AppHSC.cartBox).listenable(),
      builder: (
        BuildContext context,
        Box cartsBox,
        Widget? child,
      ) {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 24,
                    spreadRadius: 16,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSpacerH(16.h),
                    Text(
                      S.of(context).slctvarient,
                      style: AppTextDecor.osRegular14Navy,
                    ),
                    AppSpacerH(8.h),
                    Text(
                      widget.product.name!,
                      style: AppTextDecor.osBold24black,
                    ),
                    AppSpacerH(16.h),
                    SizedBox(
                      width: MediaQuery.of(
                        context,
                      ).size.width,
                      height: 270.h,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: widget.product.sbproducts!.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          final length = widget.product.sbproducts!.length;
                          return buildSubPoduct(
                            context,
                            length,
                            widget.product.sbproducts![index],
                            cartsBox,
                          );
                        },
                      ),
                    ),
                    AppSpacerH(8.h),
                    ValueListenableBuilder(
                      valueListenable: Hive.box(
                        AppHSC.cartBox,
                      ).listenable(),
                      builder: (context, Box cartBox, child) {
                        List<CarItemHiveModel> cartItems = [];
                        int? keyAt;
                        for (int i = 0; i < cartsBox.length; i++) {
                          final Map<String, dynamic> processedData = {};
                          final Map<dynamic, dynamic> unprocessedData =
                              cartBox.getAt(
                            i,
                          ) as Map<dynamic, dynamic>;

                          unprocessedData.forEach((
                            key,
                            value,
                          ) {
                            processedData[key.toString()] = value;
                          });
                          final data = CarItemHiveModel.fromMap(
                            processedData,
                          );
                          cartItems.add(data);
                        }
                        return Text(
                          "${settingsBox.get('currency')}${calculateTotal(cartItems)}",
                          style: AppTextDecor.osBold24black.copyWith(
                            color: AppColors.purple,
                          ),
                        );
                      },
                    ),
                    AppSpacerH(16.h),
                    AppTextButton(
                      onTap: () {
                        context.nav.pop(context);
                      },
                      title: S.of(context).cnfirm,
                      buttonColor: AppColors.purple,
                    ),
                    AppSpacerH(16.h),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 150,
              right: 150,
              child: Container(
                height: 15.h,
                decoration: const BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Container buildSubPoduct(
    BuildContext context,
    int length,
    SubProduct subProduct,
    Box<dynamic> cartsBox,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 4,
      ),
      width: MediaQuery.of(
        context,
      ).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          8,
        ),
        border: Border.all(
          color: AppColors.gray,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 14.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  length != 0 ? subProduct.name ?? '' : "Default",
                  style: AppTextDecor.osBold14black,
                ),
                Text(
                  "${settingsBox.get('currency')} ${subProduct.price}",
                  style: AppTextDecor.osSemiBold12black.copyWith(
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box(
                AppHSC.cartBox,
              ).listenable(),
              builder: (
                context,
                Box cartbox,
                Widget? child,
              ) {
                int? keyAt;
                inCart = false;
                for (int i = 0; i < cartsBox.length; i++) {
                  final Map<String, dynamic> processedData = {};
                  final Map<dynamic, dynamic> unprocessedData = cartbox.getAt(
                    i,
                  ) as Map<dynamic, dynamic>;

                  unprocessedData.forEach((
                    key,
                    value,
                  ) {
                    processedData[key.toString()] = value;
                  });
                  final data = CarItemHiveModel.fromMap(
                    processedData,
                  );

                  if (data.productsId == subProduct.id) {
                    inCart = true;
                    keyAt = i;
                  }
                }
                if (inCart) {
                  final Map<String, dynamic> processedData = {};
                  final Map<dynamic, dynamic> unprocessedData = cartbox.getAt(
                    keyAt!,
                  ) as Map<dynamic, dynamic>;

                  unprocessedData.forEach((
                    key,
                    value,
                  ) {
                    processedData[key.toString()] = value;
                  });

                  final CarItemHiveModel data = CarItemHiveModel.fromMap(
                    processedData,
                  );

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncDecButtonWithValueV2(
                        height: 36.h,
                        width: 120.w,
                        value: data.productsQTY,
                        onDec: () {
                          if (data.productsQTY <= 1) {
                            cartbox.deleteAt(
                              keyAt!,
                            );
                            keyAt = null;
                            inCart = false;
                          } else {
                            cartbox.putAt(
                              keyAt!,
                              data
                                  .copyWith(
                                    productsQTY: data.productsQTY - 1,
                                  )
                                  .toMap(),
                            );
                            inCart = true;
                          }
                        },
                        onInc: () {
                          cartbox.putAt(
                            keyAt!,
                            data
                                .copyWith(
                                  productsQTY: data.productsQTY + 1,
                                )
                                .toMap(),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      AppTextButton(
                        title: S.of(context).additm,
                        width: 120.w,
                        height: 36.h,
                        onTap: () {
                          if (!inCart) {
                            final newcartItrm = CarItemHiveModel(
                              productsId: subProduct.id ?? 0,
                              productsName: subProduct.name ?? '',
                              productsImage: widget.product.imagePath!,
                              productsQTY: 1,
                              unitPrice: subProduct.price!.toDouble(),
                              serviceName: widget.product.service!.name!,
                            );
                            cartbox.add(
                              newcartItrm.toMap(),
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
