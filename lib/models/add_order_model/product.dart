import 'dart:convert';

import 'package:dry_cleaners/models/add_order_model/service.dart';
import 'package:dry_cleaners/models/add_order_model/variant.dart';

class Product {
  int? id;
  String? name;
  dynamic nameBn;
  String? slug;
  double? currentPrice;
  dynamic oldPrice;
  String? description;
  String? imagePath;
  dynamic discountPercentage;
  Service? service;
  Variant? variant;

  Product({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.currentPrice,
    this.oldPrice,
    this.description,
    this.imagePath,
    this.discountPercentage,
    this.service,
    this.variant,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        name: data['name'] as String?,
        nameBn: data['name_bn'] as dynamic,
        slug: data['slug'] as String?,
        currentPrice: (data['current_price'] as num?)?.toDouble(),
        oldPrice: data['old_price'] as dynamic,
        description: data['description'] as String?,
        imagePath: data['image_path'] as String?,
        discountPercentage: data['discount_percentage'] as dynamic,
        service: data['service'] == null
            ? null
            : Service.fromMap(data['service'] as Map<String, dynamic>),
        variant: data['variant'] == null
            ? null
            : Variant.fromMap(data['variant'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'name_bn': nameBn,
        'slug': slug,
        'current_price': currentPrice,
        'old_price': oldPrice,
        'description': description,
        'image_path': imagePath,
        'discount_percentage': discountPercentage,
        'service': service?.toMap(),
        'variant': variant?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());
}
