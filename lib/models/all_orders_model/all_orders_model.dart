import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dry_cleaners/models/all_orders_model/data.dart';

class AllOrdersModel {
  String? message;
  Data? data;

  AllOrdersModel({this.message, this.data});

  @override
  String toString() => 'AllOrdersModel(message: $message, data: $data)';

  factory AllOrdersModel.fromMap(Map<String, dynamic> data) {
    return AllOrdersModel(
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
  /// Parses the string and returns the resulting Json object as [AllOrdersModel].
  factory AllOrdersModel.fromJson(String data) {
    return AllOrdersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllOrdersModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AllOrdersModel copyWith({
    String? message,
    Data? data,
  }) {
    return AllOrdersModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AllOrdersModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
