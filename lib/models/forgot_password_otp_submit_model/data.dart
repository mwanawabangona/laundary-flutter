import 'dart:convert';

class Data {
  String? token;

  Data({this.token});

  @override
  String toString() => 'Data(token: $token)';

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
