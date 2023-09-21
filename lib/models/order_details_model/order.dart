import 'dart:convert';

import 'package:dry_cleaners/models/order_details_model/address.dart';
import 'package:dry_cleaners/models/order_details_model/customer.dart';
import 'package:dry_cleaners/models/order_details_model/order_sub_product.dart';
import 'package:dry_cleaners/models/order_details_model/product.dart';
import 'package:dry_cleaners/models/order_details_model/quantity.dart';

class Order {
  int? id;
  String? orderCode;
  dynamic driverStatus;
  bool? drivers;
  Customer? customer;
  int? discount;
  double? amount;
  double? totalAmount;
  int? deliveryCharge;
  String? orderStatus;
  String? orderStatusbn;
  String? paymentStatus;
  String? paymentStatusbn;
  String? paymentType;
  String? pickDate;
  String? pickHour;
  String? deliveryDate;
  String? deliveryHour;
  String? orderedAt;
  dynamic rating;
  int? item;
  Address? address;
  List<Product>? products;
  Quantity? quantity;
  List<OrderSubProduct>? orderSubProduct;
  dynamic payment;

  Order({
    this.id,
    this.orderCode,
    this.driverStatus,
    this.drivers,
    this.customer,
    this.discount,
    this.amount,
    this.totalAmount,
    this.deliveryCharge,
    this.orderStatus,
    this.orderStatusbn,
    this.paymentStatus,
    this.paymentStatusbn,
    this.paymentType,
    this.pickDate,
    this.pickHour,
    this.deliveryDate,
    this.deliveryHour,
    this.orderedAt,
    this.rating,
    this.item,
    this.address,
    this.products,
    this.quantity,
    this.orderSubProduct,
    this.payment,
  });

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        id: data['id'] as int?,
        orderCode: data['order_code'] as String?,
        driverStatus: data['driver_status'] as dynamic,
        drivers: data['drivers'] as bool?,
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        discount: data['discount'] as int?,
        amount: (data['amount'] as num?)?.toDouble(),
        totalAmount: (data['total_amount'] as num?)?.toDouble(),
        deliveryCharge: data['delivery_charge'] as int?,
        orderStatus: data['order_status'] as String?,
        orderStatusbn: data['order_status_bn'] as String?,
        paymentStatus: data['payment_status'] as String?,
        paymentStatusbn: data['payment_status_bn'] as String?,
        paymentType: data['payment_type'] as String?,
        pickDate: data['pick_date'] as String?,
        pickHour: data['pick_hour'] as String?,
        deliveryDate: data['delivery_date'] as String?,
        deliveryHour: data['delivery_hour'] as String?,
        orderedAt: data['ordered_at'] as String?,
        rating: data['rating'] as dynamic,
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
        orderSubProduct: (data['order_sub_product'] as List<dynamic>?)
            ?.map((e) => OrderSubProduct.fromMap(e as Map<String, dynamic>))
            .toList(),
        payment: data['payment'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'order_code': orderCode,
        'driver_status': driverStatus,
        'drivers': drivers,
        'customer': customer?.toMap(),
        'discount': discount,
        'amount': amount,
        'total_amount': totalAmount,
        'delivery_charge': deliveryCharge,
        'order_status': orderStatus,
        'order_status_bn': orderStatusbn,
        'payment_status': paymentStatus,
        'payment_status_bn': paymentStatusbn,
        'payment_type': paymentType,
        'pick_date': pickDate,
        'pick_hour': pickHour,
        'delivery_date': deliveryDate,
        'delivery_hour': deliveryHour,
        'ordered_at': orderedAt,
        'rating': rating,
        'item': item,
        'address': address?.toMap(),
        'products': products?.map((e) => e.toMap()).toList(),
        'quantity': quantity?.toMap(),
        'order_sub_product': orderSubProduct?.map((e) => e.toMap()).toList(),
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
