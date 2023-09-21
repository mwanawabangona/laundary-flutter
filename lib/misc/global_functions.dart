// ignore_for_file: require_trailing_commas

import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/models/addres_list_model/address.dart';
import 'package:dry_cleaners/models/hive_cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

class AppGFunctions {
  AppGFunctions._();
  static void changeStatusBarColor({
    required Color color,
    Brightness? iconBrightness,
    Brightness? brightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness:
            iconBrightness ?? Brightness.dark, // For Android (dark icons)
        statusBarBrightness: brightness ?? Brightness.light,
      ),
    );
  }

  static Logger log() {
    final logger = Logger();
    return logger;
  }

  static TableRow tableTextRow({required String title, required String data}) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            title,
            style: AppTextDecor.osRegular14black,
            textAlign: Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal).toString() ==
                      "ar"
                  
                ? TextAlign.right
                : TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            data,
            style: AppTextDecor.osRegular14black,
            textAlign: Hive.box(AppHSC.appSettingsBox)
                        .get(AppHSC.appLocal)
                        .toString() ==
                    "ar"
                ? TextAlign.left
                : TextAlign.right,
          ),
        ),
      ],
    );
  }

  static TableRow tableDiscountTextRow(
      {required String title, required String data}) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            title,
            style: AppTextDecor.osRegular14black,
            textAlign: Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal).toString() ==
                      "ar"
                  ?
                 TextAlign.right
                : TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            data,
            style: AppTextDecor.osRegular14red,
            textAlign: Hive.box(AppHSC.appSettingsBox)
                        .get(AppHSC.appLocal)
                        .toString() ==
                    "ar"
                ? TextAlign.left
                : TextAlign.right,
          ),
        ),
      ],
    );
  }

  static TableRow tableTitleTextRow(
      {required String title, required String data}) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            title,
            style: AppTextDecor.osBold14black,
            textAlign: Hive.box(AppHSC.appSettingsBox)
                        .get(AppHSC.appLocal)
                        .toString() ==
                    "ar"
                ? TextAlign.right
                : TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Text(
            data,
            style: AppTextDecor.osBold14black,
            textAlign: Hive.box(AppHSC.appSettingsBox)
                        .get(AppHSC.appLocal)
                        .toString() ==
                    "ar"
                ? TextAlign.left
                : TextAlign.right,
          ),
        ),
      ],
    );
  }

  static String processAdAddess(Address address) {
    String modadresses = '';
    if (address.addressName != null) {
      modadresses = '$modadresses${address.addressName}: ';
    }
    if (address.flatNo != null) {
      modadresses = '$modadresses Flat#:${address.flatNo}, ';
    }
    if (address.houseNo != null) {
      modadresses = '$modadresses House#:${address.houseNo}, ';
    }
    if (address.roadNo != null) {
      modadresses = '$modadresses Road#:${address.roadNo}, ';
    }
    if (address.block != null) {
      modadresses = '$modadresses Block#:${address.block}, ';
    }
    if (address.area != null) {
      modadresses = '$modadresses${address.area}, ';
    }
    if (address.addressLine != null) {
      modadresses = '$modadresses${address.addressLine}, ';
    }
    if (address.addressLine2 != null) {
      modadresses = '$modadresses${address.addressLine2}, ';
    }
    if (address.postCode != null) {
      modadresses = '$modadresses${address.postCode}';
    }

    return modadresses;
  }
  static double calculateTotal(List<CarItemHiveModel> cartItems) {
    double amount = 0;
    for (final element in cartItems) {
      amount += element.productsQTY * element.unitPrice;
    }
    return amount;
  }
}
