import 'dart:convert';

import 'package:dry_cleaners/models/promotions_model/promotion.dart';

class Data {
  List<Promotion>? promotions;

  Data({this.promotions});

  @override
  String toString() => 'Data(promotions: $promotions)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        promotions: (data['promotions'] as List<dynamic>?)
            ?.map((e) => Promotion.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'promotions': promotions?.map((e) => e.toMap()).toList(),
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

  Data copyWith({
    List<Promotion>? promotions,
  }) {
    return Data(
      promotions: promotions ?? this.promotions,
    );
  }
}
