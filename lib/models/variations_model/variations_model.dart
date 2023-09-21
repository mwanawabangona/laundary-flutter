import 'dart:convert';

import 'package:dry_cleaners/models/variations_model/data.dart';

class VariationsModel {
  String? message;
  Data? data;

  VariationsModel({this.message, this.data});

  @override
  String toString() => 'VariationsModel(message: $message, data: $data)';

  factory VariationsModel.fromMap(Map<String, dynamic> data) {
    return VariationsModel(
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
  /// Parses the string and returns the resulting Json object as [VariationsModel].
  factory VariationsModel.fromJson(String data) {
    return VariationsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VariationsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  VariationsModel copyWith({
    String? message,
    Data? data,
  }) {
    return VariationsModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
