import 'dart:convert';

import 'package:dry_cleaners/models/products_model/product.dart';

class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'products': products?.map((e) => e.toMap()).toList(),
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
    List<Product>? products,
  }) {
    return Data(
      products: products ?? this.products,
    );
  }
}
