import 'package:dry_cleaners/models/schedule_model.dart';
import 'package:dry_cleaners/notfiers/misc_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAppLive = Provider<bool>((ref) => true);

final onBoardingSliderIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
//OneSignal Player ID Provider
final onesignalDeviceIDProvider = StateProvider<String>((ref) {
  return '';
});

final onBoardingSliderControllerProvider =
    Provider.family.autoDispose<PageController, String>((ref, name) {
  return PageController();
});

final homeScreenIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 4; //4 Means Home Screen
});
final homeScreenPageControllerProvider =
    Provider.autoDispose<PageController>((ref) {
  return PageController(initialPage: 4);
});

final tempSignProvider = StateProvider<bool>((ref) {
  return false;
});
final itemSelectMenuIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final dateProvider = StateProvider.family<DateTime?, String>((ref, id) => null);

// final imageProvider = StateProvider.autoDispose<File?>((ref) => null);

final addressIDProvider = StateProvider.autoDispose<String>((ref) => '');
final scheduleProvider =
    StateProvider.family.autoDispose<ScheduleModel?, String>((ref, id) => null);

final calculateTotalProvider = StateProvider<double>((ref) {
  return 0.00;
});
