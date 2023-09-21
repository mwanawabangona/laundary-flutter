import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/address.dart';

class BillingDetails {
  Address? address;
  dynamic email;
  dynamic name;
  dynamic phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  factory BillingDetails.fromMap(Map<String, dynamic> data) {
    return BillingDetails(
      address: data['address'] == null
          ? null
          : Address.fromMap(data['address'] as Map<String, dynamic>),
      email: data['email'] as dynamic,
      name: data['name'] as dynamic,
      phone: data['phone'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'address': address?.toMap(),
        'email': email,
        'name': name,
        'phone': phone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BillingDetails].
  factory BillingDetails.fromJson(String data) {
    return BillingDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BillingDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
