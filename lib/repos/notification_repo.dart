import 'package:dry_cleaners/models/notifications_model/notifications_model.dart';
import 'package:dry_cleaners/services/api_service.dart';

abstract class INotificationRepo {
  Future<NotificationsModel> getAllNotifications();
}

class NotificationsRepo implements INotificationRepo {
  final dio = getDio();
  @override
  Future<NotificationsModel> getAllNotifications() async {
    final response = await dio.get('/notifications');
    return NotificationsModel.fromMap(response.data as Map<String, dynamic>);
  }
}
