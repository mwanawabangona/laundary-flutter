import 'dart:convert';

import 'package:dry_cleaners/models/carde_save_model/data.dart';

class CardeSaveModel {
  String? message;
  Data? data;

  CardeSaveModel({this.message, this.data});

  factory CardeSaveModel.fromMap(Map<String, dynamic> data) {
    return CardeSaveModel(
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
  /// Parses the string and returns the resulting Json object as [CardeSaveModel].
  factory CardeSaveModel.fromJson(String data) {
    return CardeSaveModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardeSaveModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
