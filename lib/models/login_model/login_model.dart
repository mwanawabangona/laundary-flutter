import 'dart:convert';

import 'package:dry_cleaners/models/login_model/data.dart';

class LoginModel {
  String? message;
  Data? data;

  LoginModel({this.message, this.data});

  @override
  String toString() => 'LoginModel(message: $message, data: $data)';

  factory LoginModel.fromMap(Map<String, dynamic> data) => LoginModel(
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
  /// Parses the string and returns the resulting Json object as [LoginModel].
  factory LoginModel.fromJson(String data) {
    return LoginModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
