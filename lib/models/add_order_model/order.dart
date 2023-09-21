import 'dart:convert';

import 'package:dry_cleaners/models/add_order_model/address.dart';
import 'package:dry_cleaners/models/add_order_model/customer.dart';
import 'package:dry_cleaners/models/add_order_model/product.dart';
import 'package:dry_cleaners/models/all_orders_model/quantity.dart';

class Order {
  int? id;
  String? orderCode;
  Customer? customer;
  int? item;
  Address? address;
  List<Product>? products;
  Quantity? quantity;
  dynamic payment;

  Order({
    this.id,
    this.orderCode,
    this.customer,
    this.item,
    this.address,
    this.products,
    this.quantity,
    this.payment,
  });

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        id: data['id'] as int?,
        orderCode: data['order_code'] as String?,
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        item: data['item'] as int?,
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        quantity: data['quantity'] == null
            ? null
            : Quantity.fromMap(data['quantity'] as Map<String, dynamic>),
        payment: data['payment'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'order_code': orderCode,
        'customer': customer?.toMap(),
        'item': item,
        'address': address?.toMap(),
        'products': products?.map((e) => e.toMap()).toList(),
        'quantity': quantity?.toMap(),
        'payment': payment,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());
}
