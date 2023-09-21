import 'dart:convert';

import 'package:dry_cleaners/models/stripe_payment_data/datum.dart';

class Charges {
  String? object;
  List<Datum>? data;
  bool? hasMore;
  int? totalCount;
  String? url;

  Charges({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  factory Charges.fromMap(Map<String, dynamic> data) => Charges(
        object: data['object'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
        hasMore: data['has_more'] as bool?,
        totalCount: data['total_count'] as int?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'object': object,
        'data': data?.map((e) => e.toMap()).toList(),
        'has_more': hasMore,
        'total_count': totalCount,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Charges].
  factory Charges.fromJson(String data) {
    return Charges.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Charges] to a JSON string.
  String toJson() => json.encode(toMap());
}
