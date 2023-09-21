import 'dart:convert';

import 'package:dry_cleaners/models/saved_cards_model/card.dart';

class Data {
  List<Card>? cards;

  Data({this.cards});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        cards: (data['cards'] as List<dynamic>?)
            ?.map((e) => Card.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'cards': cards?.map((e) => e.toMap()).toList(),
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
