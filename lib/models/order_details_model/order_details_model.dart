import 'dart:convert';

import 'package:dry_cleaners/models/order_details_model/data.dart';

class OrderDetailsModel {
  String? message;
  Data? data;

  OrderDetailsModel({this.message, this.data});

  factory OrderDetailsModel.fromMap(Map<String, dynamic> data) {
    return OrderDetailsModel(
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
  /// Parses the string and returns the resulting Json object as [OrderDetailsModel].
  factory OrderDetailsModel.fromJson(String data) {
    return OrderDetailsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderDetailsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderDetailsModel copyWith({
    String? message,
    Data? data,
  }) {
    return OrderDetailsModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
