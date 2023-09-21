import 'dart:convert';

import 'package:dry_cleaners/models/profile_info_model/address.dart';
import 'package:dry_cleaners/models/profile_info_model/user.dart';

class Customer {
  User? user;
  List<Address>? addresses;
  String? stripeId;

  Customer({this.user, this.addresses, this.stripeId});

  factory Customer.fromMap(Map<String, dynamic> data) => Customer(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        addresses: (data['addresses'] as List<dynamic>?)
            ?.map((e) => Address.fromMap(e as Map<String, dynamic>))
            .toList(),
        stripeId: data['stripe_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'addresses': addresses?.map((e) => e.toMap()).toList(),
        'stripe_id': stripeId,
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
}
