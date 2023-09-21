import 'dart:convert';

import 'package:collection/collection.dart';

class Variant {
  int? id;
  String? name;
  dynamic nameBn;

  Variant({this.id, this.name, this.nameBn});

  @override
  String toString() => 'Variant(id: $id, name: $name, nameBn: $nameBn)';

  factory Variant.fromMap(Map<String, dynamic> data) => Variant(
        id: data['id'] as int?,
        name: data['name'] as String?,
        nameBn: data['name_bn'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'name_bn': nameBn,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Variant].
  factory Variant.fromJson(String data) {
    return Variant.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Variant] to a JSON string.
  String toJson() => json.encode(toMap());

  Variant copyWith({
    int? id,
    String? name,
    dynamic nameBn,
  }) {
    return Variant(
      id: id ?? this.id,
      name: name ?? this.name,
      nameBn: nameBn ?? this.nameBn,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Variant) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ nameBn.hashCode;
}
