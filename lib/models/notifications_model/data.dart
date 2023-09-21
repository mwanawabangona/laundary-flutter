import 'dart:convert';

import 'package:dry_cleaners/models/notifications_model/notification.dart';

class Data {
  List<Notification>? notification;

  Data({this.notification});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        notification: (data['notification'] as List<dynamic>?)
            ?.map((e) => Notification.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'notification': notification?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
