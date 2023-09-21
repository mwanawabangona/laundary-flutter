import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/card.dart';

class PaymentMethodOptions {
  Card? card;

  PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromMap(Map<String, dynamic> data) {
    return PaymentMethodOptions(
      card: data['card'] == null
          ? null
          : Card.fromMap(data['card'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'card': card?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethodOptions].
  factory PaymentMethodOptions.fromJson(String data) {
    return PaymentMethodOptions.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethodOptions] to a JSON string.
  String toJson() => json.encode(toMap());
}
