import 'dart:convert';

class Address {
  dynamic city;
  String? country;
  dynamic line1;
  dynamic line2;
  String? postalCode;
  dynamic state;

  Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        city: data['city'] as dynamic,
        country: data['country'] as String?,
        line1: data['line1'] as dynamic,
        line2: data['line2'] as dynamic,
        postalCode: data['postal_code'] as String?,
        state: data['state'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'city': city,
        'country': country,
        'line1': line1,
        'line2': line2,
        'postal_code': postalCode,
        'state': state,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());
}
