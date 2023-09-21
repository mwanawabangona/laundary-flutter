import 'dart:convert';

import 'package:dry_cleaners/models/addres_list_model/address.dart';

class Data {
  List<Address>? addresses;

  Data({this.addresses});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        addresses: (data['addresses'] as List<dynamic>?)
            ?.map((e) => Address.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'addresses': addresses?.map((e) => e.toMap()).toList(),
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

  Data copyWith({
    List<Address>? addresses,
  }) {
    return Data(
      addresses: addresses ?? this.addresses,
    );
  }
}
