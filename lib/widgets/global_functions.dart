import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

String getLng({String? en, String? changeLang}) {
  final lang = Hive.box(AppHSC.appSettingsBox).get(AppHSC.appLocal).toString();
  debugPrint("for all $lang $en $changeLang");
  if (lang == 'en') {
    return en!;
  } else {
    if (changeLang != null && changeLang != "null") {
      return changeLang;
    } else {
      return en!;
    }
  }
}
