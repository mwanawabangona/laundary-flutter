import 'dart:convert';

class Refunds {
  String? object;
  List<dynamic>? data;
  bool? hasMore;
  int? totalCount;
  String? url;

  Refunds({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  factory Refunds.fromMap(Map<String, dynamic> data) => Refunds(
        object: data['object'] as String?,
        data: data['data'] as List<dynamic>?,
        hasMore: data['has_more'] as bool?,
        totalCount: data['total_count'] as int?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'object': object,
        'data': data,
        'has_more': hasMore,
        'total_count': totalCount,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Refunds].
  factory Refunds.fromJson(String data) {
    return Refunds.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Refunds] to a JSON string.
  String toJson() => json.encode(toMap());
}
