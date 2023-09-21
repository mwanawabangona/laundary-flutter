import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/checks.dart';

class Card {
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  dynamic installments;
  String? last4;
  dynamic mandate;
  String? network;
  dynamic threeDSecure;
  dynamic wallet;

  Card({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.installments,
    this.last4,
    this.mandate,
    this.network,
    this.threeDSecure,
    this.wallet,
  });

  factory Card.fromMap(Map<String, dynamic> data) => Card(
        brand: data['brand'] as String?,
        checks: data['checks'] == null
            ? null
            : Checks.fromMap(data['checks'] as Map<String, dynamic>),
        country: data['country'] as String?,
        expMonth: data['exp_month'] as int?,
        expYear: data['exp_year'] as int?,
        fingerprint: data['fingerprint'] as String?,
        funding: data['funding'] as String?,
        installments: data['installments'] as dynamic,
        last4: data['last4'] as String?,
        mandate: data['mandate'] as dynamic,
        network: data['network'] as String?,
        threeDSecure: data['three_d_secure'] as dynamic,
        wallet: data['wallet'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'brand': brand,
        'checks': checks?.toMap(),
        'country': country,
        'exp_month': expMonth,
        'exp_year': expYear,
        'fingerprint': fingerprint,
        'funding': funding,
        'installments': installments,
        'last4': last4,
        'mandate': mandate,
        'network': network,
        'three_d_secure': threeDSecure,
        'wallet': wallet,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Card].
  factory Card.fromJson(String data) {
    return Card.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Card] to a JSON string.
  String toJson() => json.encode(toMap());
}
