import 'dart:convert';

import 'package:dry_cleaners/models/saved_cards_model/data.dart';

class SavedCardsModel {
  String? message;
  Data? data;

  SavedCardsModel({this.message, this.data});

  factory SavedCardsModel.fromMap(Map<String, dynamic> data) {
    return SavedCardsModel(
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SavedCardsModel].
  factory SavedCardsModel.fromJson(String data) {
    return SavedCardsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SavedCardsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
