import 'dart:convert';

import 'package:dry_cleaners/models/cart_item_model.dart';

class Quantity {
  List<CartItemModel> quantity;

  Quantity({required this.quantity});

  factory Quantity.fromMap(Map<String, dynamic> data) {
    final processedData = data.entries
        .map(
          (e) => CartItemModel(product_id: e.key, quantity: e.value as int),
        )
        .toList();
    return Quantity(
      quantity: processedData,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map2 = {};
    for (final e in quantity) {
      map2[e.product_id] = e.quantity;
    }
    return map2;
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Quantity].
  factory Quantity.fromJson(String data) {
    return Quantity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Quantity] to a JSON string.
  String toJson() => json.encode(toMap());
}
