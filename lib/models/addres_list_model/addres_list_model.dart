import 'dart:convert';

import 'package:dry_cleaners/models/addres_list_model/data.dart';

class AddresListModel {
  String? message;
  Data? data;

  AddresListModel({this.message, this.data});

  factory AddresListModel.fromMap(Map<String, dynamic> data) {
    return AddresListModel(
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
  /// Parses the string and returns the resulting Json object as [AddresListModel].
  factory AddresListModel.fromJson(String data) {
    return AddresListModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddresListModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AddresListModel copyWith({
    String? message,
    Data? data,
  }) {
    return AddresListModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
