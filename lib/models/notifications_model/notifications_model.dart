import 'dart:convert';

import 'package:dry_cleaners/models/notifications_model/data.dart';

class NotificationsModel {
  String? message;
  Data? data;

  NotificationsModel({this.message, this.data});

  factory NotificationsModel.fromMap(Map<String, dynamic> data) {
    return NotificationsModel(
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotificationsModel].
  factory NotificationsModel.fromJson(String data) {
    return NotificationsModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [NotificationsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
