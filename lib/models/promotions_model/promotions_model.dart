import 'dart:convert';

import 'package:dry_cleaners/models/promotions_model/data.dart';

class PromotionsModel {
  String? message;
  Data? data;

  PromotionsModel({this.message, this.data});

  @override
  String toString() => 'PromotionsModel(message: $message, data: $data)';

  factory PromotionsModel.fromMap(Map<String, dynamic> data) {
    return PromotionsModel(
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
  /// Parses the string and returns the resulting Json object as [PromotionsModel].
  factory PromotionsModel.fromJson(String data) {
    return PromotionsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PromotionsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PromotionsModel copyWith({
    String? message,
    Data? data,
  }) {
    return PromotionsModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
