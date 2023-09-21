// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CartItemModel {
  String product_id;
  int quantity;
  CartItemModel({
    required this.product_id,
    required this.quantity,
  });

  CartItemModel copyWith({
    String? product_id,
    int? quantity,
  }) {
    return CartItemModel(
      product_id: product_id ?? this.product_id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': product_id,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product_id: map['product_id'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartItemModel(product_id: $product_id, quantity: $quantity)';

  @override
  bool operator ==(covariant CartItemModel other) {
    if (identical(this, other)) return true;

    return other.product_id == product_id && other.quantity == quantity;
  }

  @override
  int get hashCode => product_id.hashCode ^ quantity.hashCode;
}
