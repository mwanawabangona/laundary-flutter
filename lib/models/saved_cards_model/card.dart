import 'dart:convert';

class Card {
  int? id;
  String? accountHolder;
  String? cardNo;
  String? cvc;
  int? lastNo;
  dynamic brand;
  String? expireMonth;
  String? expireYear;

  Card({
    this.id,
    this.accountHolder,
    this.cardNo,
    this.cvc,
    this.lastNo,
    this.brand,
    this.expireMonth,
    this.expireYear,
  });

  factory Card.fromMap(Map<String, dynamic> data) => Card(
        id: data['id'] as int?,
        accountHolder: data['account_holder'] as String?,
        cardNo: data['card_no'] as String?,
        cvc: data['cvc'] as String?,
        lastNo: data['last_no'] as int?,
        brand: data['brand'] as dynamic,
        expireMonth: data['expire_month'] as String?,
        expireYear: data['expire_year'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'account_holder': accountHolder,
        'card_no': cardNo,
        'cvc': cvc,
        'last_no': lastNo,
        'brand': brand,
        'expire_month': expireMonth,
        'expire_year': expireYear,
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
