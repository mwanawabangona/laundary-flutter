import 'dart:convert';

import 'package:dry_cleaners/models/coupon_response_model/coupon.dart';

class Data {
  Coupon? coupon;

  Data({this.coupon});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        coupon: data['coupon'] == null
            ? null
            : Coupon.fromMap(data['coupon'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'coupon': coupon?.toMap(),
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

  Data copyWith({
    Coupon? coupon,
  }) {
    return Data(
      coupon: coupon ?? this.coupon,
    );
  }
}
