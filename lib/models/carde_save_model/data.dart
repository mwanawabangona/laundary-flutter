import 'dart:convert';

import 'package:dry_cleaners/models/carde_save_model/card.dart';

class Data {
  Card? card;

  Data({this.card});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        card: data['card'] == null
            ? null
            : Card.fromMap(data['card'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'card': card?.toMap(),
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
