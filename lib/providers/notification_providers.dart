import 'package:dry_cleaners/models/notifications_model/notifications_model.dart';
import 'package:dry_cleaners/notfiers/notification_notifiers.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/repos/notification_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationRepoProvider = Provider<INotificationRepo>((ref) {
  return ref.watch(isAppLive) ? NotificationsRepo() : NotificationsRepo();
});

//
//Login
final notificationListProvider =
    StateNotifierProvider<NotificationsNotifier, ApiState<NotificationsModel>>(
        (ref) {
  return NotificationsNotifier(
    ref.watch(notificationRepoProvider),
  );
});
