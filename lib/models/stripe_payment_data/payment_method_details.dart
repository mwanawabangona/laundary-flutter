import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/card.dart';

class PaymentMethodDetails {
  Card? card;
  String? type;

  PaymentMethodDetails({this.card, this.type});

  factory PaymentMethodDetails.fromMap(Map<String, dynamic> data) {
    return PaymentMethodDetails(
      card: data['card'] == null
          ? null
          : Card.fromMap(data['card'] as Map<String, dynamic>),
      type: data['type'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'card': card?.toMap(),
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethodDetails].
  factory PaymentMethodDetails.fromJson(String data) {
    return PaymentMethodDetails.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethodDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
