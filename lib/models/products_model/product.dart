import 'dart:convert';

import 'package:dry_cleaners/models/products_model/service.dart';
import 'package:dry_cleaners/models/products_model/sub_product.dart';
import 'package:dry_cleaners/models/products_model/variant.dart';

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
  List<SubProduct>? sbproducts;
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
    this.sbproducts,
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
        sbproducts: (data['sub_products'] as List<dynamic>?)
            ?.map((e) => SubProduct.fromMap(e as Map<String, dynamic>))
            .toList(),
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
        "sub_products":
            sbproducts?.map((subProduct) => subProduct.toMap()).toList(),
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

  Product copyWith({
    int? id,
    String? name,
    dynamic nameBn,
    String? slug,
    double? currentPrice,
    dynamic oldPrice,
    String? description,
    String? imagePath,
    dynamic discountPercentage,
    List<SubProduct>? sbproducts,
    Service? service,
    Variant? variant,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      nameBn: nameBn ?? this.nameBn,
      slug: slug ?? this.slug,
      currentPrice: currentPrice ?? this.currentPrice,
      oldPrice: oldPrice ?? this.oldPrice,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      sbproducts: sbproducts ?? this.sbproducts,
      service: service ?? this.service,
      variant: variant ?? this.variant,
    );
  }
}
