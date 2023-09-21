import 'dart:convert';

import 'package:dry_cleaners/models/all_service_model/data.dart';

class AllServiceModel {
  String? message;
  Data? data;

  AllServiceModel({this.message, this.data});

  @override
  String toString() => 'AllServiceModel(message: $message, data: $data)';

  factory AllServiceModel.fromMap(Map<String, dynamic> data) {
    return AllServiceModel(
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
  /// Parses the string and returns the resulting Json object as [AllServiceModel].
  factory AllServiceModel.fromJson(String data) {
    return AllServiceModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllServiceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AllServiceModel copyWith({
    String? message,
    Data? data,
  }) {
    return AllServiceModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
