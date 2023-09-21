import 'dart:convert';

import 'package:dry_cleaners/models/products_model/data.dart';

class ProductsModel {
  String? message;
  Data? data;

  ProductsModel({this.message, this.data});

  factory ProductsModel.fromMap(Map<String, dynamic> data) => ProductsModel(
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
  /// Parses the string and returns the resulting Json object as [ProductsModel].
  factory ProductsModel.fromJson(String data) {
    return ProductsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProductsModel copyWith({
    String? message,
    Data? data,
  }) {
    return ProductsModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
