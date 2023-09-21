import 'dart:convert';

class Variant {
  int? id;
  String? name;
  dynamic nameBn;

  Variant({this.id, this.name, this.nameBn});

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
}
