import 'dart:convert';

import 'package:dry_cleaners/models/profile_info_model/customer.dart';

class Data {
  Customer? customer;

  Data({this.customer});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'customer': customer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
