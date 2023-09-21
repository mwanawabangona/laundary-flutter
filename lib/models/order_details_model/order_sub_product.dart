import 'dart:convert';

class OrderSubProduct {
  int? id;
  String? name;
  int? price;
  String? description;

  OrderSubProduct({this.id, this.name, this.price, this.description});

  factory OrderSubProduct.fromMap(Map<String, dynamic> data) {
    return OrderSubProduct(
      id: data['id'] as int?,
      name: data['name'] as String?,
      price: data['price'] as int?,
      description: data['description'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderSubProduct].
  factory OrderSubProduct.fromJson(String data) {
    return OrderSubProduct.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderSubProduct] to a JSON string.
  String toJson() => json.encode(toMap());
}
