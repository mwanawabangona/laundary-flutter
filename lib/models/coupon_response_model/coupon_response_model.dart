import 'dart:convert';

import 'package:dry_cleaners/models/coupon_response_model/data.dart';

class CouponResponseModel {
  String? message;
  Data? data;

  CouponResponseModel({this.message, this.data});

  factory CouponResponseModel.fromMap(Map<String, dynamic> data) {
    return CouponResponseModel(
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
  /// Parses the string and returns the resulting Json object as [CouponResponseModel].
  factory CouponResponseModel.fromJson(String data) {
    return CouponResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [CouponResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CouponResponseModel copyWith({
    String? message,
    Data? data,
  }) {
    return CouponResponseModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
