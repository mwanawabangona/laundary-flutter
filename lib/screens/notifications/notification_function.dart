import 'package:dry_cleaners/services/api_service.dart';

class NotificationFunctions {
  NotificationFunctions._();

  static Future<void> readNotification({required String notificationID}) async {
    await getDio().post(
      '/notifications/$notificationID',
      data: {
        'isRead': 1,
      },
    );
  }

  static Future<void> deleteNotification({
    required String notificationID,
  }) async {
    await getDio().delete(
      '/notifications/$notificationID',
    );
  }
}
