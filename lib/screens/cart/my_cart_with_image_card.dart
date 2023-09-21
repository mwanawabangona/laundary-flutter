import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/models/hive_cart_item_model.dart';
import 'package:dry_cleaners/widgets/buttons/cart_item_inc_dec_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyCartItemImageCard extends ConsumerStatefulWidget {
  const MyCartItemImageCard({
    super.key,
    required this.carItemHiveModel,
  });
  final CarItemHiveModel carItemHiveModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyCartItemImageCardState();
}

class _MyCartItemImageCardState extends ConsumerState<MyCartItemImageCard> {
  bool inCart = false;
  final Box settingsBox = Hive.box(AppHSC.appSettingsBox);
  final Box cartsBox = Hive.box(AppHSC.cartBox);

  int? keyAt;

  @override
  void initState() {
    checkProduct();
    super.initState();
  }

  void checkProduct() {
    for (int i = 0; i < cartsBox.length; i++) {
      final Map<String, dynamic> processedData = {};
      final Map<dynamic, dynamic> unprocessedData =
          cartsBox.getAt(i) as Map<dynamic, dynamic>;

      unprocessedData.forEach((key, value) {
        processedData[key.toString()] = value;
      });
      final data = CarItemHiveModel.fromMap(processedData);
      if (data.productsId == widget.carItemHiveModel.productsId) {
        inCart = true;
        keyAt = i;
        break;
      }
    }
    setState(() {
      keyAt = keyAt; // just for Updating
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ValueListenableBuilder(
        valueListenable: Hive.box(AppHSC.cartBox).listenable(),
        builder: (context, Box cartbox, Widget? child) {
          return Container(
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
                        widget.carItemHiveModel.productsImage,
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
                        width: 232.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.carItemHiveModel.productsName,
                              style: AppTextDecor.osBold14black,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.carItemHiveModel.serviceName,
                              style: AppTextDecor.osRegular12black,
                              // overflow: TextOverflow.ellipsis,
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
                                Text(
                                  '${settingsBox.get('currency') ?? '\$'}${widget.carItemHiveModel.unitPrice}/${S.of(context).item}',
                                ),
                              ],
                            ),
                          ),
                          IncDecButtonWithValueV2(
                            height: 36.h,
                            width: 120.w,
                            value: widget.carItemHiveModel.productsQTY,
                            onDec: () {
                              if (widget.carItemHiveModel.productsQTY <= 1) {
                                cartbox.deleteAt(keyAt!);
                                keyAt = null;
                                inCart = false;
                                checkProduct();
                              } else {
                                cartbox.putAt(
                                  keyAt!,
                                  widget.carItemHiveModel
                                      .copyWith(
                                        productsQTY: widget
                                                .carItemHiveModel.productsQTY -
                                            1,
                                      )
                                      .toMap(),
                                );
                              }
                            },
                            onInc: () {
                              cartbox.putAt(
                                keyAt!,
                                widget.carItemHiveModel
                                    .copyWith(
                                      productsQTY:
                                          widget.carItemHiveModel.productsQTY +
                                              1,
                                    )
                                    .toMap(),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
