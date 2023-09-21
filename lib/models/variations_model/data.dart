import 'dart:convert';

import 'package:dry_cleaners/models/variations_model/variant.dart';

class Data {
  List<Variant>? variants;

  Data({this.variants});

  @override
  String toString() => 'Data(variants: $variants)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        variants: (data['variants'] as List<dynamic>?)
            ?.map((e) => Variant.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'variants': variants?.map((e) => e.toMap()).toList(),
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
    List<Variant>? variants,
  }) {
    return Data(
      variants: variants ?? this.variants,
    );
  }
}
