import 'dart:convert';

import 'package:dry_cleaners/models/add_order_model/data.dart';

class AddOrderModel {
  String? message;
  Data? data;

  AddOrderModel({this.message, this.data});

  factory AddOrderModel.fromMap(Map<String, dynamic> data) => AddOrderModel(
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddOrderModel].
  factory AddOrderModel.fromJson(String data) {
    return AddOrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddOrderModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
