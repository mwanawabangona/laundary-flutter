import 'dart:convert';

import 'package:dry_cleaners/models/register_model/data.dart';

class RegisterModel {
  String? message;
  Data? data;

  RegisterModel({this.message, this.data});

  @override
  String toString() => 'RegisterModel(message: $message, data: $data)';

  factory RegisterModel.fromMap(Map<String, dynamic> data) => RegisterModel(
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterModel].
  factory RegisterModel.fromJson(String data) {
    return RegisterModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
