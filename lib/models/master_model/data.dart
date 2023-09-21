import 'dart:convert';

class Data {
  String? currency;
  int? deliveryCost;
  int? feeCost;
  int? minimumCost;
  List<dynamic>? postCode;
  String? androidUrl;
  String? iosUrl;

  Data({
    this.currency,
    this.deliveryCost,
    this.feeCost,
    this.minimumCost,
    this.postCode,
    this.androidUrl,
    this.iosUrl,
  });

  @override
  String toString() {
    return 'Data(currency: $currency, deliveryCost: $deliveryCost, feeCost: $feeCost, minimumCost: $minimumCost, postCode: $postCode, androidUrl: $androidUrl, iosUrl: $iosUrl)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        currency: data['currency'] as String?,
        deliveryCost: data['delivery_cost'] as int?,
        feeCost: data['fee_cost'] as int?,
        minimumCost: data['minimum_cost'] as int?,
        postCode: data['post_code'] as List<dynamic>,
        androidUrl: data['android_url'] as String?,
        iosUrl: data['ios_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'currency': currency,
        'delivery_cost': deliveryCost,
        'fee_cost': feeCost,
        'minimum_cost': minimumCost,
        'post_code': postCode,
        'android_url': androidUrl,
        'ios_url': iosUrl,
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
