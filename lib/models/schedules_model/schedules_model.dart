import 'dart:convert';

import 'package:dry_cleaners/models/schedules_model/data.dart';

class SchedulesModel {
  String? message;
  Data? data;

  SchedulesModel({this.message, this.data});

  factory SchedulesModel.fromMap(Map<String, dynamic> data) {
    return SchedulesModel(
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
  /// Parses the string and returns the resulting Json object as [SchedulesModel].
  factory SchedulesModel.fromJson(String data) {
    return SchedulesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SchedulesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SchedulesModel copyWith({
    String? message,
    Data? data,
  }) {
    return SchedulesModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
