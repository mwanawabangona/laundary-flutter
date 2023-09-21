import 'dart:convert';

import 'package:dry_cleaners/models/order_details_model/order.dart';

class Data {
  Order? order;

  Data({this.order});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        order: data['order'] == null
            ? null
            : Order.fromMap(data['order'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'order': order?.toMap(),
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
    Order? order,
  }) {
    return Data(
      order: order ?? this.order,
    );
  }
}
