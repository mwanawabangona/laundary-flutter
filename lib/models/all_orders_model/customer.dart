import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:dry_cleaners/models/all_orders_model/address.dart';
import 'package:dry_cleaners/models/all_orders_model/user.dart';

class Customer {
  User? user;
  List<Address>? addresses;

  Customer({this.user, this.addresses});

  @override
  String toString() => 'Customer(user: $user, addresses: $addresses)';

  factory Customer.fromMap(Map<String, dynamic> data) => Customer(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        addresses: (data['addresses'] as List<dynamic>?)
            ?.map((e) => Address.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'addresses': addresses?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Customer].
  factory Customer.fromJson(String data) {
    return Customer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Customer] to a JSON string.
  String toJson() => json.encode(toMap());

  Customer copyWith({
    User? user,
    List<Address>? addresses,
  }) {
    return Customer(
      user: user ?? this.user,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Customer) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => user.hashCode ^ addresses.hashCode;
}
