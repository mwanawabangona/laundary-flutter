import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:dry_cleaners/models/all_orders_model/order.dart';

class Data {
  List<Order>? orders;

  Data({this.orders});

  @override
  String toString() => 'Data(orders: $orders)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        orders: (data['orders'] as List<dynamic>?)
            ?.map((e) => Order.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'orders': orders?.map((e) => e.toMap()).toList(),
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
    List<Order>? orders,
  }) {
    return Data(
      orders: orders ?? this.orders,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => orders.hashCode;
}
