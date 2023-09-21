import 'dart:convert';

class Coupon {
  int? id;
  String? code;
  int? discount;
  int? minAmount;
  String? type;

  Coupon({this.id, this.code, this.discount, this.minAmount, this.type});

  factory Coupon.fromMap(Map<String, dynamic> data) => Coupon(
        id: data['id'] as int?,
        code: data['code'] as String?,
        discount: data['discount'] as int?,
        minAmount: data['min_amount'] as int?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'code': code,
        'discount': discount,
        'min_amount': minAmount,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Coupon].
  factory Coupon.fromJson(String data) {
    return Coupon.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Coupon] to a JSON string.
  String toJson() => json.encode(toMap());

  Coupon copyWith({
    int? id,
    String? code,
    int? discount,
    int? minAmount,
    String? type,
  }) {
    return Coupon(
      id: id ?? this.id,
      code: code ?? this.code,
      discount: discount ?? this.discount,
      minAmount: minAmount ?? this.minAmount,
      type: type ?? this.type,
    );
  }
}
