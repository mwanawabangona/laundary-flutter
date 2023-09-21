import 'package:dry_cleaners/models/notifications_model/notifications_model.dart';
import 'package:dry_cleaners/repos/notification_repo.dart';
import 'package:dry_cleaners/services/api_state.dart';
import 'package:dry_cleaners/services/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsNotifier
    extends StateNotifier<ApiState<NotificationsModel>> {
  NotificationsNotifier(this.repo) : super(const ApiState.initial()) {
    getAllNotifications();
  }

  final INotificationRepo repo;

  Future<void> getAllNotifications() async {
    state = const ApiState.loading();
    try {
      state = ApiState.loaded(
        data: await repo.getAllNotifications(),
      );
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.errorText(e));
    }
  }
}
