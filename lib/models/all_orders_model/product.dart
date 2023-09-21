import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:dry_cleaners/models/all_orders_model/service.dart';
import 'package:dry_cleaners/models/all_orders_model/variant.dart';

class Product {
  int? id;
  String? name;
  dynamic nameBn;
  String? slug;
  double? currentPrice;
  double? oldPrice;
  String? imagePath;
  int? discountPercentage;
  Service? service;
  Variant? variant;

  Product({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.currentPrice,
    this.oldPrice,
    this.imagePath,
    this.discountPercentage,
    this.service,
    this.variant,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, nameBn: $nameBn, slug: $slug, currentPrice: $currentPrice, oldPrice: $oldPrice, imagePath: $imagePath, discountPercentage: $discountPercentage, service: $service, variant: $variant)';
  }

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        name: data['name'] as String?,
        nameBn: data['name_bn'] as dynamic,
        slug: data['slug'] as String?,
        currentPrice: (data['current_price'] as num?)?.toDouble(),
        oldPrice: (data['old_price'] as num?)?.toDouble(),
        imagePath: data['image_path'] as String?,
        discountPercentage: data['discount_percentage'] as int?,
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

  Product copyWith({
    int? id,
    String? name,
    dynamic nameBn,
    String? slug,
    double? currentPrice,
    double? oldPrice,
    String? imagePath,
    int? discountPercentage,
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
      imagePath: imagePath ?? this.imagePath,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      service: service ?? this.service,
      variant: variant ?? this.variant,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      nameBn.hashCode ^
      slug.hashCode ^
      currentPrice.hashCode ^
      oldPrice.hashCode ^
      imagePath.hashCode ^
      discountPercentage.hashCode ^
      service.hashCode ^
      variant.hashCode;
}
