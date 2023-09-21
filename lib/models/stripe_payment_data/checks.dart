import 'dart:convert';

class Checks {
  dynamic addressLine1Check;
  String? addressPostalCodeCheck;
  String? cvcCheck;

  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  factory Checks.fromMap(Map<String, dynamic> data) => Checks(
        addressLine1Check: data['address_line1_check'] as dynamic,
        addressPostalCodeCheck: data['address_postal_code_check'] as String?,
        cvcCheck: data['cvc_check'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'address_line1_check': addressLine1Check,
        'address_postal_code_check': addressPostalCodeCheck,
        'cvc_check': cvcCheck,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Checks].
  factory Checks.fromJson(String data) {
    return Checks.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Checks] to a JSON string.
  String toJson() => json.encode(toMap());
}
