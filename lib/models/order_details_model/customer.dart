import 'dart:convert';

import 'package:dry_cleaners/models/order_details_model/address.dart';
import 'package:dry_cleaners/models/order_details_model/user.dart';

class Customer {
  User? user;
  List<Address>? addresses;

  Customer({this.user, this.addresses});

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
}
