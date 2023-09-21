import 'dart:convert';

class SubProduct {
  int? id;
  String? name;
  int? price;
  String? description;

  SubProduct({this.id, this.name, this.price, this.description});

  factory SubProduct.fromMap(Map<String, dynamic> data) => SubProduct(
        id: data['id'] as int?,
        name: data['name'] as String?,
        price: data['price'] as int?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubProduct].
  factory SubProduct.fromJson(String data) {
    return SubProduct.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubProduct] to a JSON string.
  String toJson() => json.encode(toMap());
}
