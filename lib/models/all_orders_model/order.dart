import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dry_cleaners/models/all_orders_model/address.dart';
import 'package:dry_cleaners/models/all_orders_model/customer.dart';
import 'package:dry_cleaners/models/all_orders_model/product.dart';
import 'package:dry_cleaners/models/all_orders_model/quantity.dart';

class Order {
  int? id;
  String? orderCode;
  Customer? customer;
  double? discount;
  double? amount;
  double? totalAmount;
  int? deliveryCharge;
  String? orderStatus;
  String? orderStatusbn;
  String? paymentStatus;
  String? paymentStatusbn;
  String? paymentType;
  String? paymentTypebn;
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
  dynamic payment;

  Order({
    this.id,
    this.orderCode,
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
    this.paymentTypebn,
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
    this.payment,
  });

  @override
  String toString() {
    return 'Order(id: $id, orderCode: $orderCode, customer: $customer, discount: $discount, amount: $amount, totalAmount: $totalAmount, deliveryCharge: $deliveryCharge, orderStatus: $orderStatus, paymentStatus: $paymentStatus, paymentType: $paymentType, pickDate: $pickDate, pickHour: $pickHour, deliveryDate: $deliveryDate, deliveryHour: $deliveryHour, orderedAt: $orderedAt, rating: $rating, item: $item, address: $address, products: $products, quantity: $quantity, payment: $payment)';
  }

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        id: data['id'] as int?,
        orderCode: data['order_code'] as String?,
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        discount: (data['discount'] as num?)?.toDouble(),
        amount: (data['amount'] as num?)?.toDouble(),
        totalAmount: (data['total_amount'] as num?)?.toDouble(),
        deliveryCharge: data['delivery_charge'] as int?,
        orderStatus: data['order_status'] as String?,
        orderStatusbn: data['order_status_bn'] as String?,
        paymentStatus: data['payment_status'] as String?,
        paymentStatusbn: data['payment_status_bn'] as String?,
        paymentType: data['payment_type'] as String?,
        paymentTypebn: data['payment_type_bn'] as String?,
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
        payment: data['payment'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'order_code': orderCode,
        'customer': customer?.toMap(),
        'discount': discount,
        'amount': amount,
        'total_amount': totalAmount,
        'delivery_charge': deliveryCharge,
        'order_status': orderStatus,
        'payment_status': paymentStatus,
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

  Order copyWith({
    int? id,
    String? orderCode,
    Customer? customer,
    double? discount,
    double? amount,
    double? totalAmount,
    int? deliveryCharge,
    String? orderStatus,
    String? paymentStatus,
    String? paymentType,
    String? pickDate,
    String? pickHour,
    String? deliveryDate,
    String? deliveryHour,
    String? orderedAt,
    dynamic rating,
    int? item,
    Address? address,
    List<Product>? products,
    Quantity? quantity,
    dynamic payment,
  }) {
    return Order(
      id: id ?? this.id,
      orderCode: orderCode ?? this.orderCode,
      customer: customer ?? this.customer,
      discount: discount ?? this.discount,
      amount: amount ?? this.amount,
      totalAmount: totalAmount ?? this.totalAmount,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentType: paymentType ?? this.paymentType,
      pickDate: pickDate ?? this.pickDate,
      pickHour: pickHour ?? this.pickHour,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryHour: deliveryHour ?? this.deliveryHour,
      orderedAt: orderedAt ?? this.orderedAt,
      rating: rating ?? this.rating,
      item: item ?? this.item,
      address: address ?? this.address,
      products: products ?? this.products,
      quantity: quantity ?? this.quantity,
      payment: payment ?? this.payment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Order) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      orderCode.hashCode ^
      customer.hashCode ^
      discount.hashCode ^
      amount.hashCode ^
      totalAmount.hashCode ^
      deliveryCharge.hashCode ^
      orderStatus.hashCode ^
      paymentStatus.hashCode ^
      paymentType.hashCode ^
      pickDate.hashCode ^
      pickHour.hashCode ^
      deliveryDate.hashCode ^
      deliveryHour.hashCode ^
      orderedAt.hashCode ^
      rating.hashCode ^
      item.hashCode ^
      address.hashCode ^
      products.hashCode ^
      quantity.hashCode ^
      payment.hashCode;
}
