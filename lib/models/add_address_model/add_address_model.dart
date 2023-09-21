import 'dart:convert';

import 'package:dry_cleaners/models/add_address_model/data.dart';

class AddAddressModel {
  String? message;
  Data? data;

  AddAddressModel({this.message, this.data});

  factory AddAddressModel.fromMap(Map<String, dynamic> data) {
    return AddAddressModel(
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
  /// Parses the string and returns the resulting Json object as [AddAddressModel].
  factory AddAddressModel.fromJson(String data) {
    return AddAddressModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddAddressModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AddAddressModel copyWith({
    String? message,
    Data? data,
  }) {
    return AddAddressModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
